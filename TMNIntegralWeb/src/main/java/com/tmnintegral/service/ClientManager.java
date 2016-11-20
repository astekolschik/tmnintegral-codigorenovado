package com.tmnintegral.service;

import java.io.Serializable;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.List;
import java.util.UUID;

import javax.persistence.NoResultException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.tmnintegral.domain.Client;
import com.tmnintegral.domain.Role;
import com.tmnintegral.domain.User;
import com.tmnintegral.repository.ClientDao;
import com.tmnintegral.repository.RoleDao;
import com.tmnintegral.repository.UserDao;

/**
 * Encargado del manejo de clientes
 * @author Agustina
 * @version 1.0
 */
@Component
public class ClientManager implements Serializable{
	
	private static final long serialVersionUID = 1L;
	@Autowired
	private ClientDao clientDao;

	public Client createClient(Integer id, String description) throws Exception{
		if (!clientExists(id)){
			Client c = new Client(id, description);
			return this.clientDao.saveClient(c);
		}else
			throw new Exception("Cliente duplicado");
	}

	private boolean clientExists(Integer id) {
		try {
			if (this.clientDao.getClient(id) != null)
				return true;
		} catch (NoResultException e) {
			System.out.println("Cliente no encontrado");
		}
		return false;
	}

	/**
	 * @return the clientDao
	 */
	public ClientDao getClientDao() {
		return clientDao;
	}

	/**
	 * @param clientDao the clientDao to set
	 */
	public void setClientDao(ClientDao clientDao) {
		this.clientDao = clientDao;
	}
	
}