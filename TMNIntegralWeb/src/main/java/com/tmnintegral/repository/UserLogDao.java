package com.tmnintegral.repository;

import java.util.List;

import javax.persistence.NoResultException;

import com.tmnintegral.domain.Role;
import com.tmnintegral.domain.UserLog;

/**
 * @author Agustina
 *
 */
public interface UserLogDao {

	public List<UserLog> getAllUserLogs();
	
	public List<UserLog> getUserLogs(int userId);
	
	public List<UserLog> getTenUserLogs(int userId);
	
	public void saveUserLog(UserLog log) throws Exception;
	
}
