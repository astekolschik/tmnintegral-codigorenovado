package com.tmnintegral.repository;

import java.util.Date;
import java.util.List;

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
	
}
