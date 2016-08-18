/**
 * 
 */
package com.tmnintegral.service;

import java.io.Serializable;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.tmnintegral.domain.Device;
import com.tmnintegral.domain.EquipmentInformation;
import com.tmnintegral.domain.InterfaceStatus;
import com.tmnintegral.repository.InterfaceDao;
import com.tmnintegral.repository.ReportDao;

/**
 * Encargado del manejo y armado de reportes
 * @author Agustina
 * @version 1.0
 */
@Component
public class ReportManager implements Serializable{
	
	private static final long serialVersionUID = 1L;
	
	@Autowired
	private ReportDao reportDao;
	@Autowired
	private InterfaceDao interfaceDao;
	@Autowired
	private InventoryManager inventoryManager;

	/**
	 * Obtiene información para el reporte de memoria disponible para una lista de equipos
	 * @param eqIds
	 * @param from
	 * @param to
	 * @return
	 */
	public String getInformationForMemoriaDisponibleReport(String[] eqIds, Date from, Date to){
		String res = "[";
		for (int i = 0; i < eqIds.length; i++){
			if (i != 0)
				res = res + ",";
			res = res + this.getInformationForMemoriaDisponibleReport(Integer.valueOf(eqIds[i]), from, to);
		}
		res += "]";
		return res;
	}
	
	/**
	 * Obtiene información para el reporte de memoria disponible x equipo
	 * @param eqID
	 * @param from
	 * @param to
	 * @return
	 */
	public String getInformationForMemoriaDisponibleReport(int eqID, Date from, Date to){
		Device d = this.inventoryManager.getDevice(eqID);
		String result = "{ Equipment : '" + d.getHostName() + "-(" + d.getIp() + ")', "
						+" Data: [";
		
		List<EquipmentInformation> eqInfo = this.getEquipmentInformationForReport(eqID, from, to);
		Iterator<EquipmentInformation> itEq = eqInfo.iterator();
		EquipmentInformation eq = null;
		while (itEq.hasNext()){
			eq = itEq.next();
			result = result +
						"{ Date: '" + eq.getTimestamp() + "',"
						+ " Value: " + eq.getMemoria_disponible()
						+ "}";
			if (itEq.hasNext())
				result = result + ",";
		}
		
		result += 	"]"
				+ "}";
		return result;
	}
	
	/**
	 * Obtiene información para el reporte de memoria utilizada para una lista de equipos
	 * @param eqIds
	 * @param from
	 * @param to
	 * @return
	 */
	public String getInformationForMemoriaUtilizadaReport(String[] eqIds, Date from, Date to){
		String res = "[";
		for (int i = 0; i < eqIds.length; i++){
			if (i != 0)
				res = res + ",";
			res = res + this.getInformationForMemoriaUtilizadaReport(Integer.valueOf(eqIds[i]), from, to);
		}
		res += "]";
		return res;
	}
	
	/**
	 * Obtiene información para el reporte de memoria utilizada x equipo
	 * @param eqID
	 * @param from
	 * @param to
	 * @return
	 */
	public String getInformationForMemoriaUtilizadaReport(int eqID, Date from, Date to){
		Device d = this.inventoryManager.getDevice(eqID);
		String result = "{ Equipment : '" + d.getHostName() + "-(" + d.getIp() + ")', "
						+" Data: [";
		
		List<EquipmentInformation> eqInfo = this.getEquipmentInformationForReport(eqID, from, to);
		Iterator<EquipmentInformation> itEq = eqInfo.iterator();
		EquipmentInformation eq = null;
		while (itEq.hasNext()){
			eq = itEq.next();
			result = result +
						"{ Date: '" + eq.getTimestamp() + "',"
						+ " Value: " + eq.getMemoria_utilizada()
						+ "}";
			if (itEq.hasNext())
				result = result + ",";
		}
		
		result += 	"]"
				+ "}";
		return result;
	}
	
	/**
	 * Obtiene información para el reporte de trafico entrante para una lista de equipos
	 * @param eqIds
	 * @param from
	 * @param to
	 * @return
	 */
	public String getInformationForTraficoEntranteReport(String[] eqIds, Date from, Date to){
		String res = "[";
		for (int i = 0; i < eqIds.length; i++){
			if (i != 0)
				res = res + ",";
			res = res + this.getInformationForTraficoEntranteReport(Integer.valueOf(eqIds[i]), from, to);
		}
		res += "]";
		return res;
	}
	
	/**
	 * Obtiene información para el reporte de trafico entrante x equipo
	 * @param eqID
	 * @param from
	 * @param to
	 * @return
	 */
	public String getInformationForTraficoEntranteReport(int eqID, Date from, Date to){
		Device d = this.inventoryManager.getDevice(eqID);
		String result = "{ Equipment : '" + d.getHostName() + "-(" + d.getIp() + ")', "
						+" Data: [";
		
		List<EquipmentInformation> eqInfo = this.getEquipmentInformationForReport(eqID, from, to);
		Iterator<EquipmentInformation> itEq = eqInfo.iterator();
		EquipmentInformation eq = null;
		while (itEq.hasNext()){
			eq = itEq.next();
			result = result +
						"{ Date: '" + eq.getTimestamp() + "',"
						+ " Value: " + eq.getTrafico_entrante()
						+ "}";
			if (itEq.hasNext())
				result = result + ",";
		}
		
		result += 	"]"
				+ "}";
		return result;
	}
	
	/**
	 * Obtiene información para el reporte de trafico saliente para una lista de equipos
	 * @param eqIds
	 * @param from
	 * @param to
	 * @return
	 */
	public String getInformationForTraficoSalienteReport(String[] eqIds, Date from, Date to){
		String res = "[";
		for (int i = 0; i < eqIds.length; i++){
			if (i != 0)
				res = res + ",";
			res = res + this.getInformationForTraficoSalienteReport(Integer.valueOf(eqIds[i]), from, to);
		}
		res += "]";
		return res;
	}
	
	/**
	 * Obtiene información para el reporte de trafico saliente x equipo
	 * @param eqID
	 * @param from
	 * @param to
	 * @return
	 */
	public String getInformationForTraficoSalienteReport(int eqID, Date from, Date to){
		Device d = this.inventoryManager.getDevice(eqID);
		String result = "{ Equipment : '" + d.getHostName() + "-(" + d.getIp() + ")', "
						+" Data: [";
		
		List<EquipmentInformation> eqInfo = this.getEquipmentInformationForReport(eqID, from, to);
		Iterator<EquipmentInformation> itEq = eqInfo.iterator();
		EquipmentInformation eq = null;
		while (itEq.hasNext()){
			eq = itEq.next();
			result = result +
						"{ Date: '" + eq.getTimestamp() + "',"
						+ " Value: " + eq.getTrafico_saliente()
						+ "}";
			if (itEq.hasNext())
				result = result + ",";
		}
		
		result += 	"]"
				+ "}";
		return result;
	}
	
	/**
	 * Obtiene información para el reporte de utilizacion de cpu para una lista de equipos
	 * @param eqIds
	 * @param from
	 * @param to
	 * @return
	 */
	public String getInformationForUtilizacionCPUReport(String[] eqIds, Date from, Date to){
		String res = "[";
		for (int i = 0; i < eqIds.length; i++){
			if (i != 0)
				res = res + ",";
			res = res + this.getInformationForUtilizacionCPUReport(Integer.valueOf(eqIds[i]), from, to);
		}
		res += "]";
		return res;
	}
	
	/**
	 * Obtiene información para el reporte de la utilizacion de cpu x equipo
	 * @param eqID
	 * @param from
	 * @param to
	 * @return
	 */
	public String getInformationForUtilizacionCPUReport(int eqID, Date from, Date to){
		Device d = this.inventoryManager.getDevice(eqID);
		String result = "{ Equipment : '" + d.getHostName() + "-(" + d.getIp() + ")', "
						+" Data: [";
		
		List<EquipmentInformation> eqInfo = this.getEquipmentInformationForReport(eqID, from, to);
		Iterator<EquipmentInformation> itEq = eqInfo.iterator();
		EquipmentInformation eq = null;
		while (itEq.hasNext()){
			eq = itEq.next();
			result = result +
						"{ Date: '" + eq.getTimestamp() + "',"
						+ " Value: " + eq.getUtilizacion_cpu()
						+ "}";
			if (itEq.hasNext())
				result = result + ",";
		}
		
		result += 	"]"
				+ "}";
		return result;
	}
	
	public List<InterfaceStatus> getAlarmsSent(){
		return this.interfaceDao.getInterfaceAlarmed();
	}
	
	public List<InterfaceStatus> getAlarmsSentInTheLastHour(){
		return this.interfaceDao.getInterfaceAlarmedInTheLastHour();
	}
	
	
	private List<EquipmentInformation> getEquipmentInformationForReport(int eqID, Date from, Date to){
		return this.reportDao.getEquipmentInformation(eqID, from, to);
	}
	
	
	/**
	 * @param reportDao the reportDao to set
	 */
	public void setReportDao(ReportDao reportDao) {
		this.reportDao = reportDao;
	}

	/**
	 * @param interfaceDao the interfaceDao to set
	 */
	public void setInterfaceDao(InterfaceDao interfaceDao) {
		this.interfaceDao = interfaceDao;
	}
	

}
