package csjobs.model.dao.jpa;


import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import csjobs.model.Application;
import csjobs.model.File;
import csjobs.model.Job;
import csjobs.model.User;
import csjobs.model.dao.ApplicationDao;

@Repository
public class ApplicationDaoImpl implements ApplicationDao {

    @PersistenceContext
    private EntityManager entityManager;

    @Override
    public Application getApplication( Long id )
    {
        return entityManager.find( Application.class, id );
    }

    @Override
    public Application getApplication( Job job, User applicant )
    {
        String query = "from Application where job = :job and applicant = :applicant";

        List<Application> results = entityManager
            .createQuery( query, Application.class )
            .setParameter( "job", job )
            .setParameter( "applicant", applicant )
            .getResultList();
        return results.size() == 0 ? null : results.get( 0 );
    }

    @Override
    @Transactional
    public Application saveApplication( Application application )
    {
        return entityManager.merge( application );
    }

	@Override
	@Transactional
	public File saveFile1(File file1) {
		// TODO Auto-generated method stub
		return entityManager.merge(file1);
	}

	@Override
	@Transactional
	public File saveFile2(File file2) {
		// TODO Auto-generated method stub
		return entityManager.merge(file2);
	}

	@Override
	@Transactional
	public File saveFile3(File file3) {
		// TODO Auto-generated method stub
		return entityManager.merge(file3);
	}

    @Override
    public List<Application> getApplicant( Long jobId )
    {
        String query = "from Application where job.id = :jobId";
        
        List<Application> results = entityManager
            .createQuery( query, Application.class ).setParameter( "jobId", jobId )
            .getResultList();
        return results;
    }

  /*  @Override
    public Application getApplicant( Long jobId )
    {
        String query = "from Application where job.id = :jobId";
        return entityManager.createQuery( query, Application.class ).getSingleResult();
    }
*/
}
