/**
 * 
 */
package com.tmnintegral.repository.impl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.tmnintegral.domain.Command;
import com.tmnintegral.domain.CommandKey;
import com.tmnintegral.repository.CommandDao;

/**
 * @author Agustina
 *
 */
@Repository(value = "commandDao")
public class JPACommandDao implements CommandDao{

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
	public Command getCommand(int varid, int te, String fieldname) {
    	Command command = null;
    	try{
    		command = (Command) em.createQuery(
    				"select c from Command c where c.key.idVariable=" + varid
    						+ " and c.key.idDeviceType=" + te
    						+ " and c.key.fieldName='" + fieldname + "'").getSingleResult();
    	}catch(NoResultException e){
    		//log ("No se encontro el usuario con id: " + userId);
    	}
    	return command;
	}

    @Transactional(readOnly = true)
    @SuppressWarnings("unchecked")
	public List<Command> getCommandList(Integer clientId) {
    	return em.createQuery("select c from Command c").getResultList();
	}

    @Transactional(readOnly = false)
    @SuppressWarnings("unchecked")
	public void deleteCommand(CommandKey key) {
    	em.createQuery("delete from Command c where c.key.idVariable=" + key.getIdVariable()
    					+ " and c.key.idDeviceType=" + key.getIdDeviceType() 
    					+ " and c.key.fieldName='" + key.getFieldName() + "'").executeUpdate();
	}

    @Transactional(readOnly = false)
    @SuppressWarnings("unchecked")
	public void deleteCommand(int cId) {
    	em.createQuery("delete from Command c where c.id_command =" + cId).executeUpdate();
	}

    @Transactional(readOnly = true)
    @SuppressWarnings("unchecked")
    public List<Object[]> getVariables() {
    	Query q = em.createNativeQuery("SELECT a.id, a.variableName FROM variable a");
    	return q.getResultList();
	}

    @Transactional(readOnly = false)
    @SuppressWarnings("unchecked")
    public void crearComando(Command newCommand) {
    	em.merge(newCommand);
	}
    
    @Transactional(readOnly = false)
    @SuppressWarnings("unchecked")
	public void updateComando(Command newCommand) {
		em.merge(newCommand);
	}

}
