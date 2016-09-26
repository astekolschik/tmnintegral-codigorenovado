/**
 * 
 */
package com.tmnintegral.service;

import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.Set;

import javax.json.Json;
import javax.json.JsonArray;
import javax.json.JsonArrayBuilder;
import javax.json.JsonObject;
import javax.json.JsonObjectBuilder;
import javax.json.JsonValue;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

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

	/**
	 * 
	 * @return List of reports name
	 */
	public List<Object[]> getReportNames(){
		return reportDao.getReportNames();
	}
	
	public List<InterfaceStatus> getAlarmsSent(){
		return this.interfaceDao.getInterfaceAlarmed();
	}
	
	public List<InterfaceStatus> getAlarmsSentInTheLastHour(){
		return this.interfaceDao.getInterfaceAlarmedInTheLastHour();
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


	/**
	 * Obtiene la informacion para los reportes basandose en tipo de reporte, fechas y equipos seleccionados por el usuario
	 * @param tipoReporte
	 * @param equipmentList
	 * @param strings 
	 * @param dateFrom
	 * @param dateTo
	 * @return list with report information
	 */
	public JsonObject getInformationForReports(String tipoReporte, String[] equipmentList, String[] interfacesList, Date dateFrom, Date dateTo) {
//		List<Object[]> retEqList = this.reportDao.getEquipmentInformationForReports(tipoReporte, equipmentList, dateFrom, dateTo);
//		List<Object[]> retInList = this.reportDao.getInterfaceInformationForReports(tipoReporte, interfacesList, dateFrom, dateTo);
		//TODO data model
		List<Object[]> retEqList = new ArrayList<Object[]>();
		List<Object[]> retInList = new ArrayList<Object[]>();
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Calendar c = Calendar.getInstance();
		c.setTime(new Date());
		Random r = new Random();
		int maxX = 100, minX =0;
		for (int i = 0; i < 10; i++){
			String date = sdf.format(c.getTime());
			c.add(Calendar.DATE, 1);
			Object[] a = {date, "Device 1", r.nextFloat()* (maxX - minX) + minX};
			retEqList.add(a);
			Object[] b = {date, "Device 2", r.nextFloat()* (maxX - minX) + minX};
			retEqList.add(b);
			Object[] d = {date, "Interface 1", r.nextFloat()* (maxX - minX) + minX};
			retInList.add(d);
		}
		
		
		JsonObjectBuilder retObj = Json.createObjectBuilder()
				.add("cols", this.getColumnsForChart(retEqList, retInList))
				.add("rows", this.getRowsForChart(retEqList, equipmentList.length, retInList, interfacesList.length));
		return retObj.build();
	}

	/**
	 * A partir de la lista de equipos e interfaces construye el json de las columnas del grafico
	 * @param retEqList
	 * @param retInList
	 * @return
	 */
	private JsonArray getColumnsForChart(List<Object[]> retEqList, List<Object[]> retInList) {
		JsonArrayBuilder columnsBuilder = Json.createArrayBuilder()
				.add(Json.createObjectBuilder()
						.add("id", "fecha")
						.add("label", "Fecha")
						.add("type", "string").build());
		Set<String> listIncluded = new HashSet<String>();
		//Iteramos sobre los equipos posibles
		Iterator<Object[]> it = retEqList.iterator();
		while (it.hasNext()){
			Object[] curr = it.next();
			if (!listIncluded.contains(curr[1])){
				columnsBuilder.add(Json.createObjectBuilder()
						.add("id", curr[1].toString())
						.add("label", curr[1].toString())
						.add("type", "number").build());
			}
		}
		
		listIncluded = new HashSet<String>();
		//Iteramos sobre las interfaces posibles
		it = retInList.iterator();
		while (it.hasNext()){
			Object[] curr = it.next();
			if (!listIncluded.contains(curr[1])){
				columnsBuilder.add(Json.createObjectBuilder()
						.add("id", curr[1].toString())
						.add("label", curr[1].toString())
						.add("type", "number").build());
			}
		}
		
		return columnsBuilder.build();
	}
	
	/**
	 * A partir de la informacion de equipos/interfaces construye las filas de informacion para el grafico
	 * @param retEqList
	 * @param eqLength 
	 * @param retInList
	 * @param interfaceLength 
	 * @return
	 */
	private JsonArray getRowsForChart(List<Object[]> retEqList, int eqLength, List<Object[]> retInList, int interfaceLength) {
		JsonArrayBuilder rowsBuilder = Json.createArrayBuilder();
		Map<String, List<Float>> valuesMap = new HashMap<String, List<Float>>();
		//Iteramos sobre los equipos posibles
		Iterator<Object[]> it = retEqList.iterator();
		while (it.hasNext()){
			Object[] curr = it.next();
			if (!valuesMap.containsKey(curr[0]))
				valuesMap.put((String) curr[0], new ArrayList<Float>());
			((List<Float>)valuesMap.get(curr[0])).add((Float) curr[2]);
		}
		
		//Iteramos sobre las interfaces posibles
		it = retInList.iterator();
		while (it.hasNext()){
			Object[] curr = it.next();
			if (!valuesMap.containsKey(curr[0]))
				valuesMap.put((String) curr[0], new ArrayList<Float>());
			((List<Float>)valuesMap.get(curr[0])).add((Float) curr[2]);
		}
		
		Iterator<String> itMap = valuesMap.keySet().iterator();
		JsonObjectBuilder valueObj;
		JsonArrayBuilder valuesColObj;
		while (itMap.hasNext()){
			String date = itMap.next();

			valueObj = Json.createObjectBuilder();
			valuesColObj = Json.createArrayBuilder();
			valuesColObj.add(Json.createObjectBuilder().add("v", date).build());
			//Iterator<E>
			
			valueObj.add("c",valuesColObj.build());
			rowsBuilder.add(valueObj.build());
		}
		return rowsBuilder.build();
	}
}

