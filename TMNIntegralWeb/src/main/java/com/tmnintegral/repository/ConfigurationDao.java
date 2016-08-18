package com.tmnintegral.repository;

import java.util.List;

import javax.persistence.NoResultException;

import com.tmnintegral.domain.Configuration;

/**
 * @author Agustina
 *
 */
public interface ConfigurationDao {

	public Configuration getConfiguration(int id_configuration) throws NoResultException;
	
	public List<Configuration> getConfigurationList();
	
	public void saveConfiguration(Configuration d) throws Exception;
	
	public void updateConfiguration(Configuration d);
	
	public void deleteConfiguration(Configuration d);
	
	public void deleteConfiguration(int id);
	
}
