/**
 * 
 */
package com.tmnintegral.repository;

import com.tmnintegral.domain.Client;

/**
 * @author Agustina
 *
 */
public interface ClientDao {

	public Client getClient(int clientId);
	
	public void saveClient(Client c) throws Exception;
	
}
