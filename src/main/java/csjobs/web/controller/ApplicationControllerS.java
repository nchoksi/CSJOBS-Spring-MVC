package csjobs.web.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.Date;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;

import csjobs.model.Application;
import csjobs.model.Degree;
import csjobs.model.Job;
import csjobs.model.User;
import csjobs.model.dao.ApplicationDao;
import csjobs.model.dao.JobDao;

@Controller
@SessionAttributes("application")
public class ApplicationControllerS {

    @Autowired
    private JobDao jobDao;

    @Autowired
    private ApplicationDao applicationDao;

    @Autowired
    private ServletContext context;

    @RequestMapping(value = "/application/apply.html",
        method = RequestMethod.GET)
    public String apply( @RequestParam Long jobId, HttpSession session,
        ModelMap models, Authentication authentication )
    {
        Job job = jobDao.getJob( jobId );
        User applicant = (User) authentication.getPrincipal();
        Application application = applicationDao.getApplication( job, applicant );

        if( application != null && application.isSubmitted() )
        {
            models.put( "errorCode", "error.application.submitted" );
            return "error";
        }

        if( application == null )
            application = new Application( job, applicant );

        models.put( "application", application );
        return "application/apply";
    }

    private File getFileDirectory()
    {
        String path = context.getRealPath( "/WEB-INF/files" );
        return new File( path );
    }

    String type;

    Long size;

    User Applicant;

    Date date;

    @RequestMapping(value = "/application/apply.html",
        method = RequestMethod.POST)
    public String apply(
        @ModelAttribute("application") Application application,
        SessionStatus sessionStatus, @RequestParam MultipartFile file1,
        @RequestParam MultipartFile file2, @RequestParam MultipartFile file3 )
        throws IllegalStateException, IOException
    {
        System.out.println( "post method" );
        System.out.println( application.getCurrentJobInstitution() );

        // save this file under /WEB-INF/files
        // stores CV

        System.out.println( file1.getOriginalFilename() );

        if( !file1.isEmpty() )
        {
            file1.transferTo( new File( getFileDirectory(), "CV"
                + application.getApplicant().getId()
                + application.getJob().getId() + file1.getOriginalFilename() ) );

            String fileName = "CV" + application.getApplicant().getId()
                + application.getJob().getId() + file1.getOriginalFilename();
            type = file1.getContentType();
            size = file1.getSize();
            date = new Date();
            Applicant = application.getApplicant();

            csjobs.model.File cv = new csjobs.model.File();
            cv.setName( fileName );
            cv.setType( type );
            cv.setSize( size );
            cv.setDate( date );
            cv.setOwner( Applicant );
            System.out.println( "cv" );
            csjobs.model.File cvInfo = applicationDao.saveFile1( cv );
            application.setCv( cvInfo );
        }

        // stores ts
        if( !file2.isEmpty() )
        {
            file2.transferTo( new File( getFileDirectory(), "TS"
                + application.getApplicant().getId()
                + application.getJob().getId() + file2.getOriginalFilename() ) );

            String fileName = "TS" + application.getApplicant().getId()
                + application.getJob().getId() + file2.getOriginalFilename();
            type = file2.getContentType();
            size = file2.getSize();
            date = new Date();
            Applicant = application.getApplicant();

            csjobs.model.File ts = new csjobs.model.File();
            ts.setName( fileName );
            ts.setType( type );
            ts.setSize( size );
            ts.setDate( date );
            ts.setOwner( Applicant );
            System.out.println( "ts" );
            csjobs.model.File tsInfo = applicationDao.saveFile2( ts );

            application.setTeachingStatement( tsInfo );
        }
        if( !file3.isEmpty() )
        {
            // Stores rs
            file3.transferTo( new File( getFileDirectory(), "RS"
                + application.getApplicant().getId()
                + application.getJob().getId() + file3.getOriginalFilename() ) );

            String fileName = "RS" + application.getApplicant().getId()
                + application.getJob().getId() + file3.getOriginalFilename();
            type = file3.getContentType();
            size = file3.getSize();
            date = new Date();
            Applicant = application.getApplicant();

            csjobs.model.File rs = new csjobs.model.File();
            rs.setName( fileName );
            rs.setType( type );
            rs.setSize( size );
            rs.setDate( date );
            rs.setOwner( Applicant );
            System.out.println( "rs" );
            csjobs.model.File rsInfo = applicationDao.saveFile3( rs );

            application.setResearchStatement( rsInfo );
        }

        application = applicationDao.saveApplication( application );

        sessionStatus.setComplete();
        return "redirect:addDegree.html?applicationId=" + application.getId();
    }

    @RequestMapping(value = "/application/addDegree.html",
        method = RequestMethod.GET)
    public String addDegree( @RequestParam Long applicationId, ModelMap models )
    {
        models.put( "application",
            applicationDao.getApplication( applicationId ) );
        models.put( "degree", new Degree() );
        return "application/addDegree";
    }

    @RequestMapping(value = "/application/addDegree.html",
        method = RequestMethod.POST)
    public String addDegree( @ModelAttribute Application application,
        @ModelAttribute Degree degree, SessionStatus sessionStatus )
    {
        Date date = new Date();

        application.getDegrees().add( degree );
        application.setSubmitDate( date );
        application = applicationDao.saveApplication( application );
        sessionStatus.setComplete();
        return "redirect:addDegree.html?applicationId=" + application.getId();
    }

    @RequestMapping("/download.html")
    public String download( HttpServletResponse response,
        @RequestParam String file ) throws IOException
    {
        System.out.println( "download" );
        response.setContentType( "application/octet-stream" );
        /*
         * response.setContentType("application/pdf");
         * response.setContentType("text");
         */
        response.setHeader( "Content-Disposition", "attachment; filename="
            + file );

        FileInputStream in = new FileInputStream( new File( getFileDirectory(),
            file ) );
        OutputStream out = response.getOutputStream();

        byte buffer[] = new byte[2048];
        int bytesRead;
        while( (bytesRead = in.read( buffer )) > 0 )
            out.write( buffer, 0, bytesRead );

        in.close();
        return null;
    }

    @RequestMapping("reviewer/applicants.html")
    public String applicants( ModelMap models, @RequestParam Long jobId )
    {
        models.put( "applicants", applicationDao.getApplicant( jobId ) );
        return "/reviewer/applicants";
    }
   
    @RequestMapping("/applicants.html")
    public String adminapplicants( ModelMap models, @RequestParam Long jobId )
    {
        models.put( "applicants", applicationDao.getApplicant( jobId ) );
        return "/applicants";
    }

}
