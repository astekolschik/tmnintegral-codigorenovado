package com.tmnintegral.repository.impl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.tmnintegral.domain.Red;
import com.tmnintegral.repository.RedDao;

/**
 * @author Martín
 *
 */
@Repository(value = "RedDao")
public class JPARedDao implements RedDao{

	private EntityManager em = null;

    /*
     * Sets the entity manager.
     */
    @PersistenceContext
    public void setEntityManager(EntityManager em) {
        this.em = em;
    }
	
    @Transactional(readOnly = true)
    @SuppressWarnings("unchecked")
	public Red getRed(int id_red) throws NoResultException{
    	Red r = null;
    	try{
    		r = (Red) em.createQuery("select r from Red r where r.id_network = " + id_red).getSingleResult();
    	}catch(NoResultException e){
    		//log ("No se encontro el rol con id: " + roleId);
    	}
    	return r;
	}
    
    @Transactional(readOnly = true)
    @SuppressWarnings("unchecked")
	public Red getRed(String net) throws NoResultException{
    	Red r = null;
    	try{
    		r = (Red) em.createQuery("select r from Red r where r.network = " + net).getSingleResult();
    	}catch(NoResultException e){
    		//log ("No se encontro el rol con id: " + roleId);
    	}
    	return r;
	}

    @Transactional(readOnly = true)
    @SuppressWarnings("unchecked")
	public List<Red> getRedList() {
		return em.createQuery("select r from Red r order by r.id_network").getResultList();
	}

    @Transactional(readOnly = false)
    @SuppressWarnings("unchecked")
	public void saveRed(Red r) throws Exception {
		int id_red = (Integer) em.createQuery("select max(id_network) + 1 from Red").getSingleResult();
		r.setId_network(id_red);
		em.merge(r);
	}
    

    @Transactional(readOnly = false)
    @SuppressWarnings("unchecked")
	public void updateRed(Red r) {
		em.merge(r);
	}

    @Transactional(readOnly = false)
    @SuppressWarnings("unchecked")
	public void deleteRed(Red r) {
		em.remove(r);
	}

    @Transactional(readOnly = false)
    @SuppressWarnings("unchecked")
	public void deleteRed(int id_red) {
		em.createQuery("delete from Red r where r.id_network=" + id_red).executeUpdate();
	}
    
    @Transactional(readOnly = false)
    @SuppressWarnings("unchecked")
	public void deleteRed(String net) {
		em.createQuery("delete from Red r where r.network=" + net).executeUpdate();
	}

    @Transactional(readOnly = false)
    @SuppressWarnings("unchecked")
		public List<Red> getRedList(Integer id) {
		return em.createQuery("select r from Red r where r.client.id=" + id + " order by r.id_network").getResultList();
	}
}
