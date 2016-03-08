package csjobs.web.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.WebApplicationContext;

import csjobs.model.Job;
import csjobs.model.User;
import csjobs.model.dao.JobDao;
import csjobs.model.dao.UserDao;
import csjobs.web.editor.UserPropertyEditor;

@Controller
public class JobController {

    @Autowired
    private JobDao jobDao;

    @Autowired
    private UserDao userDao;

    @Autowired
    private WebApplicationContext context;

    @InitBinder
    public void initBinder( WebDataBinder binder )
    {
        SimpleDateFormat dateFormat = new SimpleDateFormat( "MM/dd/yyyy" );
        // dateFormat.setLenient(false);
        // true passed to CustomDateEditor construct means convert empty String
        // to null
        binder.registerCustomEditor( User.class,
            (UserPropertyEditor) context.getBean( "userPropertyEditor" ) );
        binder.registerCustomEditor( Date.class, new CustomDateEditor(
            dateFormat, true ) );

    }

    @RequestMapping({ "/index.html", "/job/list.html" })
    public String list( ModelMap models )
    {
        models.put( "openJobs", jobDao.getOpenJobs() );
        return "job/list";
    }

    @RequestMapping("/job/view.html")
    public String view( @RequestParam Long id, ModelMap models )
    {
        models.put( "job", jobDao.getJob( id ) );
        return "job/view";
    }

    @RequestMapping(value = "/addJob.html", method = RequestMethod.GET)
    public String addJob( ModelMap models )
    {
        models.put( "job", new Job() );

        List<User> users = userDao.getUsers();

        System.out.println( "total users" + users.size() );
        List<User> reviewer = new ArrayList<User>();

        for( int i = 0; i < users.size(); i++ )
        {
            if( users.get( i ).isReviewer() )
            {
                reviewer.add( users.get( i ) );
            }
        }
        models.put( "reviewer", reviewer );
        return "addJob";

    }

    @RequestMapping(value = "/addJob.html", method = RequestMethod.POST)
    public String register( @ModelAttribute Job job,
        HttpServletRequest request, @RequestParam Long chairId,
        @RequestParam Long jobId )
    {

        String reviewers[] = request.getParameterValues( "reviewer" );
        System.out.println( "chair is" + chairId );
        System.out.println( "user id" + userDao.getUser( chairId ).getId() );
        job.setCommitteeChair( userDao.getUser( chairId ) );
        System.out.println( "check point" );
        List<User> committeeMembers = new ArrayList<User>();
        for( int i = 0; i < reviewers.length; i++ )
        {
            committeeMembers.add( userDao.getUser( reviewers[i] ) );
        }
        if( !committeeMembers.contains( userDao.getUser( chairId ) ) )
        {
            committeeMembers.add( userDao.getUser( chairId ) );
        }
        job.setCommitteeMembers( committeeMembers );
        job = jobDao.saveJob( job );
        return "redirect:/admin.html";
    }

    @RequestMapping(value = "/editJob.html", method = RequestMethod.GET)
    public String editJob( ModelMap models, @RequestParam Long jobIdd )
    {
        System.out.println( "job id?" + jobIdd );
        List<User> users = userDao.getUsers();
        System.out.println( "total users" + users.size() );
        List<User> reviewer = new ArrayList<User>();

        for( int i = 0; i < users.size(); i++ )
        {
            if( users.get( i ).isReviewer() )
            {
                reviewer.add( users.get( i ) );
            }
        }
        models.put( "reviewer", reviewer );
        models.put( "editJob", jobDao.getJob( jobIdd ) );
        return "editJob";

    }

    @RequestMapping(value = "/editJob.html", method = RequestMethod.POST)
    public String editJob( @ModelAttribute Job jobId,
        HttpServletRequest request, @RequestParam Long committeeChair )
    {
        System.out.println( "post" + jobId.getId() );

        //String reviewers[] = request.getParameterValues( "committeeMembers" );
        System.out.println( "chair is" + committeeChair );
        jobId.setCommitteeChair( userDao.getUser( committeeChair ) );
      //  List<User> committeeMembers1 = new ArrayList<User>();
       /* for( int i = 0; i < reviewers.length; i++ )
        {
            committeeMembers1.add( userDao.getUser( reviewers[i] ) );
        }*/
        if( !jobId.getCommitteeMembers().contains( userDao.getUser( committeeChair ) ) )
        {
            jobId.getCommitteeMembers().add( userDao.getUser( committeeChair ) );
           // committeeMembers1.add(  );
        }
        //jobId.setCommitteeMembers( committeeMembers1 );
        // userValidator.validate( user, bindingResult );
        // if( bindingResult.hasErrors() ) return "register";
        // jobDao.saveJob(temp);
        jobId = jobDao.saveJob( jobId );
        return "redirect:/admin.html";
    }
}
