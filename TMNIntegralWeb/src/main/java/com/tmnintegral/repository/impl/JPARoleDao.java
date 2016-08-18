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

import com.tmnintegral.domain.Role;
import com.tmnintegral.repository.RoleDao;

/**
 * @author Agustina
 *
 */
@Repository(value = "roleDao")
public class JPARoleDao implements RoleDao{

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
	public Role getRole(int roleId) throws NoResultException{
    	Role r = null;
    	try{
    		r = (Role) em.createQuery("select r from Role r where r.role_id = " + roleId).getSingleResult();
    	}catch(NoResultException e){
    		//log ("No se encontro el rol con id: " + roleId);
    	}
    	return r;
	}

    @Transactional(readOnly = true)
    @SuppressWarnings("unchecked")
	public List<Role> getRoles() {
		return em.createQuery("select r from Role r order by r.role_id").getResultList();
	}

    @Transactional(readOnly = false)
    @SuppressWarnings("unchecked")
	public void saveRole(Role r) throws Exception {
    	if (this.getRole(r.getRole_id()) == null){
    		em.merge(r);
    	}else{
    		throw new Exception("El rol con ese id ya existe");
    	}
	}

    @Transactional(readOnly = false)
    @SuppressWarnings("unchecked")
	public void updateRole(Role r) {
		em.merge(r);
	}

    @Transactional(readOnly = false)
    @SuppressWarnings("unchecked")
	public void deleteRole(Role r) {
		em.remove(r);
	}

    @Transactional(readOnly = false)
    @SuppressWarnings("unchecked")
	public void deleteRole(int roleId) {
		em.createQuery("delete from Role r where r.role_id=" + roleId).executeUpdate();
	}

}
