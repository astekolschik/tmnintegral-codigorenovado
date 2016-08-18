/**
 * 
 */
package com.tmnintegral.repository.impl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.tmnintegral.domain.UserLog;
import com.tmnintegral.repository.UserLogDao;

/**
 * @author Agustina
 *
 */
@Repository(value = "userLogDao")
public class JPAUserLogDao implements UserLogDao {

	private EntityManager em = null;

    /*
     * Sets the entity manager.
     */
    @PersistenceContext
    public void setEntityManager(EntityManager em) {
        this.em = em;
    }
	
	/* (non-Javadoc)
	 * @see com.tmnintegral.repository.UserLogDao#getUserLogs()
	 */
    @Transactional(readOnly = true)
    @SuppressWarnings("unchecked")
	public List<UserLog> getAllUserLogs() {
    	return em.createQuery("select ul from UserLog ul order by ul.id desc").getResultList();
	}
    
    /* (non-Javadoc)
	 * @see com.tmnintegral.repository.UserLogDao#getUserLogs()
	 */
    @Transactional(readOnly = true)
    @SuppressWarnings("unchecked")
	public List<UserLog> getUserLogs(int userId) {
    	return em.createQuery("select ul from UserLog ul where ul.user= " + userId + "order by ul.id desc").getResultList();
	}


	/* (non-Javadoc)
	 * @see com.tmnintegral.repository.UserLogDao#saveUserLog(com.tmnintegral.domain.UserLog)
	 */
    @Transactional(readOnly = false)
    @SuppressWarnings("unchecked")
	public void saveUserLog(UserLog log) throws Exception {
		em.merge(log);
	}

    @Transactional(readOnly = true)
    @SuppressWarnings("unchecked")
	public List<UserLog> getTenUserLogs(int userId) {
		return em.createQuery("select ul from UserLog ul where ul.user= " + userId + "order by ul.id desc").setMaxResults(10).getResultList();
	}

}
