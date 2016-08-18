package com.tmnintegral.repository.impl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.tmnintegral.domain.Configuration;
import com.tmnintegral.repository.ConfigurationDao;

/**
 * @author Agustina
 *
 */
@Repository(value = "ConfigurationDao")
public class JPAConfigurationDao implements ConfigurationDao{

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
	public Configuration getConfiguration(int id) throws NoResultException{
    	Configuration d = null;
    	try{
    		d = (Configuration) em.createQuery("select d from Configuration d where d.id_configuration = " + id).getSingleResult();
    	}catch(NoResultException e){
    		//log ("No se encontro el rol con id: " + roleId);
    	}
    	return d;
	}
    
   
    @Transactional(readOnly = true)
    @SuppressWarnings("unchecked")
	public List<Configuration> getConfigurationList() {
		return em.createQuery("select d from Configuration d order by d.id_configuration").getResultList();
	}

    @Transactional(readOnly = false)
    @SuppressWarnings("unchecked")
	public void saveConfiguration(Configuration d) throws Exception {
    	if (this.getConfiguration(d.getId_configuration()) == null){
    		int id = (Integer) em.createQuery("select max(id_configuration) + 1 from configuration").getSingleResult();
    		d.setId_configuration(id);
    		em.merge(d);
    	}else{
    		throw new Exception("La configuración con ese id ya existe");
    	}
	}
    

    @Transactional(readOnly = false)
    @SuppressWarnings("unchecked")
	public void updateConfiguration(Configuration d) {
		em.merge(d);
	}

    @Transactional(readOnly = false)
    @SuppressWarnings("unchecked")
	public void deleteConfiguration(Configuration d) {
		em.remove(d);
	}

    @Transactional(readOnly = false)
    @SuppressWarnings("unchecked")
	public void deleteConfiguration(int id) {
		em.createQuery("delete from configuration d where d.id_configuration=" + id).executeUpdate();
	}
    

}
