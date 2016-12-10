/**
 * 
 */
package com.tmnintegral.service;

import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.json.Json;
import javax.json.JsonArray;
import javax.json.JsonArrayBuilder;
import javax.json.JsonObject;
import javax.json.JsonObjectBuilder;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.tmnintegral.domain.Alarm;
import com.tmnintegral.domain.AlarmSent;
import com.tmnintegral.domain.InterfaceStatus;
import com.tmnintegral.domain.User;
import com.tmnintegral.repository.CommandDao;
import com.tmnintegral.repository.ReportDao;
import com.tmnintegral.repository.UserDao;

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
	private UserDao userDao;
	@Autowired
	private CommandDao commandDao;

	/**
	 * 
	 * @return List of reports name
	 */
	public List<Object[]> getReportNames(){
		return reportDao.getReportNames();
	}
	
	public void saveAlarmSent(AlarmSent is){
		this.reportDao.saveAlarmSent(is);
	}
	
	
	public List<AlarmSent> getAlarmsSent(){
		return this.reportDao.getAlarmsSent();
	}
	
	public List<AlarmSent> getAlarmsSentInTheLastHour(){
		return this.reportDao.getAlarmsInTheLastHour();
	}
	
	
	/**
	 * @param reportDao the reportDao to set
	 */
	public void setReportDao(ReportDao reportDao) {
		this.reportDao = reportDao;
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
		List<Object[]> retEqList = this.reportDao.getEquipmentInformationForReports(tipoReporte, equipmentList, dateFrom, dateTo);
		List<Object[]> retInList = this.reportDao.getInterfaceInformationForReports(tipoReporte, interfacesList, dateFrom, dateTo);
		
		
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
		Set<String> cols = new HashSet<String>();
		for (int i = 0; i < retEqList.size(); i++){
			if (!cols.contains(String.valueOf(retEqList.get(i)[1]))){
				cols.add(String.valueOf(retEqList.get(i)[1]));
				columnsBuilder.add(Json.createObjectBuilder()
						.add("id", String.valueOf(retEqList.get(i)[1]))
						.add("label", String.valueOf(retEqList.get(i)[1]))
						.add("type", "number").build());
			}
		}
		
		for (int i = 0; i < retInList.size(); i++){
			if (!cols.contains(String.valueOf(retInList.get(i)[1]))){
				cols.add(String.valueOf(retInList.get(i)[1]));
				columnsBuilder.add(Json.createObjectBuilder()
						.add("id", String.valueOf(retInList.get(i)[1]))
						.add("label", String.valueOf(retInList.get(i)[1]))
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
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		//Iteramos sobre los equipos posibles
		Iterator<Object[]> it = retEqList.iterator();
		while (it.hasNext()){
			Object[] curr = it.next();
			if (!valuesMap.containsKey(sdf.format(curr[0])))
				valuesMap.put(sdf.format(curr[0]), new ArrayList<Float>());
			((List<Float>)valuesMap.get(sdf.format(curr[0]))).add(Float.parseFloat(String.valueOf(curr[2])));
		}
		
		//Iteramos sobre las interfaces posibles
		it = retInList.iterator();
		while (it.hasNext()){
			Object[] curr = it.next();
			if (!valuesMap.containsKey(sdf.format(curr[0])))
				valuesMap.put(sdf.format(curr[0]), new ArrayList<Float>());
			((List<Float>)valuesMap.get(sdf.format(curr[0]))).add(Float.parseFloat(String.valueOf(curr[2])));
		}
		
		Iterator<String> itMap = valuesMap.keySet().iterator();
		JsonObjectBuilder valueObj;
		JsonArrayBuilder valuesColObj;
		while (itMap.hasNext()){
			String date = itMap.next();

			valueObj = Json.createObjectBuilder();
			valuesColObj = Json.createArrayBuilder();
			valuesColObj.add(Json.createObjectBuilder().add("v", date).build());
			Iterator<Float> itValues = valuesMap.get(date).iterator();
			while (itValues.hasNext()){
				valuesColObj.add(Json.createObjectBuilder().add("v", itValues.next()).build());
			}
			
			valueObj.add("c",valuesColObj.build());
			rowsBuilder.add(valueObj.build());
		}
		return rowsBuilder.build();
	}

	public List<Alarm> getAlarmsConfigured(Integer clientId) {
		return this.reportDao.getAlarmsConfigured(clientId);
	}

	public void eliminarAlarma(Integer id) {
		this.reportDao.deleteAlarm(id);
	}

	public void crearAlarma(Alarm alarm) {
		this.reportDao.saveAlarm(alarm);
	}

	public Alarm getAlarmById(int alarmId) {
		Alarm ret =this.reportDao.getAlarm(alarmId);
		ret.setVariableName(this.getVariableName(ret.getIdVariable()));
		return ret;
	}

	private String getVariableName(Integer idVariable) {
		Object[] variable = this.commandDao.getVariable(idVariable);
		if (variable != null)
			return (String) variable[1];
		return null;
	}

	public List<Alarm> getAlarmsConfigured() {
		return this.reportDao.getAlarmsConfigured();
	}
	
	public boolean getAlarmValue(Alarm a){
		List<InterfaceStatus> status = this.reportDao.getStatus(a.getIdVariable(), a.getElementName());
		//sumo los valores
		Iterator<InterfaceStatus> itStatus = status.iterator();
		Float total = new Float(0);
		while (itStatus.hasNext()){
			total += Float.valueOf(itStatus.next().getValor());
		}
		//chequeo dependiendo del tipo de alarma
		if (total >= 0 && total <=3){
			if (total == 0)
				return true;
		}else{
			if (total%3 >= a.getUmbral())
				return true;
		}
		return false;
	}
	
	public List<Object[]> getDevicesDown(){
		return this.reportDao.getDevicesDown();
	}
	
	public String getAdminDestinationsForClient(int clientid){
		List<User> adminusers = this.userDao.getAdminEmails(clientid);
		Iterator<User> itusers = adminusers.iterator();
		String emails = "";
		while (itusers.hasNext()){
			if (!emails.equals(""))
				emails += ";";
			emails += itusers.next().getEmail();
		}
		return emails;
	}

	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}

	/**
	 * @param commandDao the commandDao to set
	 */
	public void setCommandDao(CommandDao commandDao) {
		this.commandDao = commandDao;
	}
}

