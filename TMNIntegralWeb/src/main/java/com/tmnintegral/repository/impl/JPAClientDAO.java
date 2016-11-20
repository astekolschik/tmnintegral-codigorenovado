/**
 * 
 */
package com.tmnintegral.repository.impl;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.tmnintegral.domain.Client;
import com.tmnintegral.repository.ClientDao;

/**
 * @author Agustina
 *
 */
@Repository(value = "clientDao")
public class JPAClientDAO implements ClientDao{

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
	public Client getClient(int clientId) {
		return (Client) em.createQuery("select u from Client u where u.client_id= " + clientId).getSingleResult();
	}

    @Transactional(readOnly = false)
    @SuppressWarnings("unchecked")
	public Client saveClient(Client c) throws Exception {
		return em.merge(c);
	}

}
