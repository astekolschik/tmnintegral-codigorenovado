/**
 * 
 */
package com.tmnintegral.repository.impl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.tmnintegral.domain.Client;
import com.tmnintegral.domain.User;
import com.tmnintegral.repository.UserDao;

/**
 * @author Agustina
 *
 */
@Repository(value = "userDao")
public class JPAUserDao implements UserDao {

	private EntityManager em = null;
	
	private static String ADMIN_ROLE = "1";

    /*
     * Sets the entity manager.
     */
    @PersistenceContext
    public void setEntityManager(EntityManager em) {
        this.em = em;
    }
	
	/* (non-Javadoc)
	 * @see com.caece.tmnintegral.dao.UserDao#getUser(int)
	 */
    @Transactional(readOnly = true)
    @SuppressWarnings("unchecked")
	public User getUser(int userId) {
    	User u = null;
    	try{
    		u = (User) em.createQuery("select u from User u where u.id= " + userId).getSingleResult();
    	}catch(NoResultException e){
    		//log ("No se encontro el usuario con id: " + userId);
    	}
    	return u;
	}

	/* (non-Javadoc)
	 * @see com.caece.tmnintegral.dao.UserDao#getUser(java.lang.String)
	 */
    @Transactional(readOnly = true)
    @SuppressWarnings("unchecked")
	public User getUser(String username) {
    	User u = null;
    	try{
    		u = (User) em.createQuery("select u from User u where u.user_name='" + username + "'").getSingleResult();
    	}catch(NoResultException e){
    		//log ("No se encontro el usuario con nombre: " + username);
    	}
    	return u;
	}

	/* (non-Javadoc)
	 * @see com.caece.tmnintegral.dao.UserDao#getUsersList()
	 */
    @Transactional(readOnly = true)
    @SuppressWarnings("unchecked")
	public List<User> getUsersList() {
    	return em.createQuery("select u from User u order by u.id").getResultList();
	}

	/* (non-Javadoc)
	 * @see com.caece.tmnintegral.dao.UserDao#saveUser(com.caece.tmnintegral.repository.User)
	 */
    @Transactional(readOnly = false)
    @SuppressWarnings("unchecked")
	public void saveUser(User u) throws Exception {
    	if (this.getUser(u.getUser_name()) == null){
    		int userId = (Integer)em.createQuery("select max(user_id) + 1 from User").getSingleResult();
    		u.setId(userId);
    		em.merge(u);
    	}else{
    		throw new Exception("El user con ese nombre ya existe");
    	}
	}

	/* (non-Javadoc)
	 * @see com.caece.tmnintegral.dao.UserDao#updateUser(com.caece.tmnintegral.repository.User)
	 */
    @Transactional(readOnly = false)
    @SuppressWarnings("unchecked")
	public void updateUser(User u) {
    	em.merge(u);
	}

	/* (non-Javadoc)
	 * @see com.caece.tmnintegral.dao.UserDao#deleteUser(com.caece.tmnintegral.repository.User)
	 */
    @Transactional(readOnly = false)
    @SuppressWarnings("unchecked")
	public void deleteUser(User u) {
    	em.remove(u);
	}

	/* (non-Javadoc)
	 * @see com.caece.tmnintegral.dao.UserDao#deleteUser(int)
	 */
    @Transactional(readOnly = false)
    @SuppressWarnings("unchecked")
	public void deleteUser(int userId) {
    	em.createQuery("delete from User u where u.id=" + userId).executeUpdate();
	}

	/* (non-Javadoc)
	 * @see com.caece.tmnintegral.dao.UserDao#deleteUser(java.lang.String)
	 */
    @Transactional(readOnly = false)
    @SuppressWarnings("unchecked")
	public void deleteUser(String username) {
    	em.createQuery("delete from User u where u.user_name='" + username + "'").executeUpdate();
	}

    @Transactional(readOnly = true)
    @SuppressWarnings("unchecked")
	public List<User> getAdministratorUsers() {
    	return em.createQuery("select u from User u where u.role_id= " + ADMIN_ROLE + " order by u.id").getResultList();
	}

    @Transactional(readOnly = true)
    @SuppressWarnings("unchecked")
	public List<User> getUsersList(int clientId) {
		return em.createQuery("select u from User u where u.client.id= " + clientId + " order by u.id").getResultList();
	}

    @Transactional(readOnly = true)
    @SuppressWarnings("unchecked")
    public List<Client> getClientList() {
    	return em.createQuery("select c from Client c order by c.id").getResultList();
	}

    @Transactional(readOnly = true)
    @SuppressWarnings("unchecked")
	public List<User> getDisabledUserList(Integer clientId) {
    	return em.createQuery("select u from User u where u.client.id= " + clientId + " and u.role_id=4 order by u.id").getResultList();
	}

}
