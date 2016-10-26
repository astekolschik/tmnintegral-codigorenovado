/**
 * 
 */
package com.tmnintegral.service;

import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;

import com.tmnintegral.domain.Alarm;

/**
 * @author Agustina
 * @version 1.0
 */
public class AlarmService {
	
	@Autowired
	private ReportManager ReportManager;

	/**
	 * Chequea las alarmas 
	 */
	@Scheduled(cron="* */50 * * * ?")
	public void triggerAlarm(){
		processConfiguredAlarms();
		processGeneralAlarms();
	}

	/**
	 * 
	 */
	private void processGeneralAlarms() {
		List<Object[]> devDown = this.ReportManager.getDevicesDown();
		Iterator<Object[]> itDevs = devDown.iterator();
		while (itDevs.hasNext()){
			Object[] dev = itDevs.next();
			MailManager.sendAlarmMail(String.valueOf(dev[0]), this.getAdminEmailForClient(Integer.parseInt(String.valueOf(dev[1]))));
		}
	}

	private String getAdminEmailForClient(Integer client) {
		return this.ReportManager.getAdminDestinationsForClient(client);
	}

	/**
	 * 
	 */
	private void processConfiguredAlarms() {
		List<Alarm> alarms = this.ReportManager.getAlarmsConfigured();
		Iterator<Alarm> itAlarms = alarms.iterator();
		Alarm a;
		while (itAlarms.hasNext()){
			a = itAlarms.next();
			this.processAlarm(a);
		}
	}
	
	/**
	 * 
	 * @param alarm
	 */
	private void processAlarm(Alarm a){
		if (this.ReportManager.getAlarmValue(a)){
			MailManager.sendAlarmMail(a.getElementName(), a.getDestination());
		}
	}
	

	/**
	 * @return the reportManager
	 */
	public ReportManager getReportManager() {
		return ReportManager;
	}

	/**
	 * @param reportManager the reportManager to set
	 */
	public void setReportManager(ReportManager reportManager) {
		ReportManager = reportManager;
	}

}
