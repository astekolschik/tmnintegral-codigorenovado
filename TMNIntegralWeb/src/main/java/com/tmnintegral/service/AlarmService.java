/**
 * 
 */
package com.tmnintegral.service;

import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;

import com.tmnintegral.domain.InterfaceStatus;
import com.tmnintegral.domain.User;
import com.tmnintegral.repository.InterfaceDao;
import com.tmnintegral.repository.UserDao;

/**
 * @author Agustina
 * @version 1.0
 */
public class AlarmService {
	
	@Autowired
	private InterfaceDao interfaceDao;
	@Autowired
	private UserDao userDao;

	/**
	 * Chequea las alarmas 
	 */
	@Scheduled(cron="* */20 * * * ?")
	public void triggerAlarm(){
		List<InterfaceStatus> downList = this.interfaceDao.getInterfacesDown();
		String destList = this.getMailList();
		Iterator<InterfaceStatus> it = downList.iterator();
		while (it.hasNext()){
			InterfaceStatus is = it.next();
			MailManager.sendAlarmMail(is.getElementName(), destList);
			this.interfaceDao.updateInterfaceStatus(is);
		}
	}
	
	private String getMailList(){
		String mailList = "";
		List<User> adminUsers = this.userDao.getAdministratorUsers();
		Iterator<User> itUser = adminUsers.iterator();
		while(itUser.hasNext()){
			User u = itUser.next();
			mailList = mailList + u.getEmail() + ",";
		}
		return mailList;
	}
	
	/**
	 * 
	 */
	private void checkConfiguredAlarms(){
		
	}
	
	/**
	 * @param interfaceDao the interfaceDao to set
	 */
	public void setInterfaceDao(InterfaceDao interfaceDao) {
		this.interfaceDao = interfaceDao;
	}

	/**
	 * @param userDao the userDao to set
	 */
	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}

}
