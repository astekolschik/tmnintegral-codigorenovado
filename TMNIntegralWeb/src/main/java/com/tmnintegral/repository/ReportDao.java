package com.tmnintegral.repository;

import java.util.Date;
import java.util.List;

import com.tmnintegral.domain.Alarm;

/**
 * @author Agustina
 *
 */
public interface ReportDao {

	public List<Object[]> getReportNames();

	public List<Object[]> getEquipmentInformationForReports(String tipoReporte, String[] equipmentList, Date dateFrom,
			Date dateTo);

	public List<Object[]> getInterfaceInformationForReports(String tipoReporte, String[] interfacesList, Date dateFrom,
			Date dateTo);

	public List<Alarm> getAlarmsConfigured(Integer clientId);

	public void deleteAlarm(Integer id);

	public void saveAlarm(Alarm alarm);

	public Alarm getAlarm(int alarmId);
	
}
