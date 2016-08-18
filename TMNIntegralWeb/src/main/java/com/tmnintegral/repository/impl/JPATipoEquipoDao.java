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

import com.tmnintegral.domain.TipoEquipo;
import com.tmnintegral.repository.TipoEquipoDao;

/**
 * @author Usuario
 *
 */
@Repository(value = "tipoEquipoDao")
public class JPATipoEquipoDao implements TipoEquipoDao {

	private EntityManager em = null;

    /*
     * Sets the entity manager.
     */
    @PersistenceContext
    public void setEntityManager(EntityManager em) {
        this.em = em;
    }
	
	
	/* (non-Javadoc)
	 * @see com.tmnintegral.repository.TipoEquipoDao#getTipoEquipo(int)
	 */
    @Transactional(readOnly = true)
    @SuppressWarnings("unchecked")
	public TipoEquipo getTipoEquipo(int tipoEquipoId) {
    	TipoEquipo tipoEquipo = null;
    	try{
    		tipoEquipo = (TipoEquipo) em.createQuery("select te from TipoEquipo te where te.id= " + tipoEquipoId).getSingleResult();
    	}catch(NoResultException e){
    		//log ("No se encontro el usuario con id: " + userId);
    	}
    	return tipoEquipo;
	}

	/* (non-Javadoc)
	 * @see com.tmnintegral.repository.TipoEquipoDao#getTipoEquiposList()
	 */
    @Transactional(readOnly = true)
    @SuppressWarnings("unchecked")
	public List<TipoEquipo> getTipoEquiposList() {
    	return em.createQuery("select te from TipoEquipo te order by te.id").getResultList();
	}

	/* (non-Javadoc)
	 * @see com.tmnintegral.repository.TipoEquipoDao#saveTipoEquipo(com.tmnintegral.domain.TipoEquipo)
	 */
    @Transactional(readOnly = false)
    @SuppressWarnings("unchecked")
	public TipoEquipo saveTipoEquipo(TipoEquipo te) throws Exception {
    	int teId = (Integer)em.createQuery("select max(id) + 1 from TipoEquipo").getSingleResult();
    	te.setId(teId);
    	em.merge(te);
    	return te;
	}

	/* (non-Javadoc)
	 * @see com.tmnintegral.repository.TipoEquipoDao#updateTipoEquipo(com.tmnintegral.domain.TipoEquipo)
	 */
    @Transactional(readOnly = false)
    @SuppressWarnings("unchecked")
	public void updateTipoEquipo(TipoEquipo te) {
    	em.merge(te);
	}

	/* (non-Javadoc)
	 * @see com.tmnintegral.repository.TipoEquipoDao#deleteTipoEquipo(com.tmnintegral.domain.TipoEquipo)
	 */
    @Transactional(readOnly = false)
    @SuppressWarnings("unchecked")
	public void deleteTipoEquipo(TipoEquipo te) {
		em.remove(te);
	}

	/* (non-Javadoc)
	 * @see com.tmnintegral.repository.TipoEquipoDao#deleteTipoEquipo(int)
	 */
    @Transactional(readOnly = false)
    @SuppressWarnings("unchecked")
	public void deleteTipoEquipo(int teId) {
    	em.createQuery("delete from TipoEquipo te where te.id=" + teId).executeUpdate();
	}

}
