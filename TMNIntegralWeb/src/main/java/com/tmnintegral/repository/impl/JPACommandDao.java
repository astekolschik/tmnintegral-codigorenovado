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

import com.tmnintegral.domain.Command;
import com.tmnintegral.domain.TipoEquipo;
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
	public Command getCommand(int commandId) {
    	Command command = null;
    	try{
    		command = (Command) em.createQuery("select c from Command c where c.id_command = " + commandId).getSingleResult();
    	}catch(NoResultException e){
    		//log ("No se encontro el usuario con id: " + userId);
    	}
    	return command;
	}

    @Transactional(readOnly = true)
    @SuppressWarnings("unchecked")
	public List<Command> getCommandList() {
    	return em.createQuery("select c from Command c order by c.id_command").getResultList();
	}

    @Transactional(readOnly = false)
    @SuppressWarnings("unchecked")
	public Command saveCommand(Command c) throws Exception {
    	int cId = (Integer)em.createQuery("select max(id_command) + 1 from Command").getSingleResult();
    	c.setId_command(cId);
    	em.merge(c);
    	return c;
	}

    @Transactional(readOnly = false)
    @SuppressWarnings("unchecked")
	public void updateCommand(Command c) {
    	em.merge(c);
	}

    @Transactional(readOnly = false)
    @SuppressWarnings("unchecked")
	public void deleteCommand(Command c) {
    	em.remove(c);
	}

    @Transactional(readOnly = false)
    @SuppressWarnings("unchecked")
	public void deleteCommand(int cId) {
    	em.createQuery("delete from Command c where c.id_command =" + cId).executeUpdate();
	}

}
