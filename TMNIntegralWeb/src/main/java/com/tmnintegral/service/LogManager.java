package com.tmnintegral.service;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.tmnintegral.domain.UserLog;
import com.tmnintegral.repository.UserLogDao;

/**
 * Encargado del manejo de logs
 * @author Agustina
 * @version 1.0
 */
@Component
public class LogManager implements Serializable{
	
	private static final long serialVersionUID = 1L;
	
	@Autowired
	private UserLogDao userLogDao;
	
	public void saveLoginLog(int userId){
		UserLog ul = new UserLog(userId, "El usuario ingreso a la plataforma", new Date());
		this.saveLog(ul);
	}
	
	public void saveLogoutLog(int userId){
		UserLog ul = new UserLog(userId, "El usuario salió de la plataforma", new Date());
		this.saveLog(ul);
	}
	
	public void saveResetPassLog(String username){
		UserLog ul = new UserLog(null, "El usuario " + username + " pidió un reset de contraseña", new Date());
		this.saveLog(ul);
	}

	public List<UserLog> getUserLogs(int userid){
		return userLogDao.getUserLogs(userid);
	}
	
	public List<UserLog> getLastUserLogs(int userid){
		return userLogDao.getTenUserLogs(userid);
	}
	
	private void saveLog(UserLog ul){
		try {
			userLogDao.saveUserLog(ul);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}
	/**
	 * @param userLogDao the userLogDao to set
	 */
	public void setUserLogDao(UserLogDao userLogDao) {
		this.userLogDao = userLogDao;
	}
}