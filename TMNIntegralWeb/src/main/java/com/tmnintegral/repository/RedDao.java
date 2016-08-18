package com.tmnintegral.repository;

import java.util.List;

import javax.persistence.NoResultException;

import com.tmnintegral.domain.Red;

/**
 * @author Agustina
 *
 */
public interface RedDao {

	public Red getRed(int id_red) throws NoResultException;
	
	public Red getRed(String net) throws NoResultException;
	
	public List<Red> getRedList();
	
	public List<Red> getRedList(Integer id);

	public void saveRed(Red r) throws Exception;
	
	public void updateRed(Red r);
	
	public void deleteRed(Red r);
	
	public void deleteRed(int id_red);
	
	public void deleteRed(String net);

}
