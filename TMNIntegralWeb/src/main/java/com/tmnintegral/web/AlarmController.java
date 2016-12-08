/**
 * 
 */
package com.tmnintegral.web;

import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.json.Json;
import javax.json.JsonArray;
import javax.json.JsonArrayBuilder;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.tmnintegral.domain.Alarm;
import com.tmnintegral.domain.Device;
import com.tmnintegral.domain.Interface;
import com.tmnintegral.domain.User;
import com.tmnintegral.service.ConfigurationManager;
import com.tmnintegral.service.InventoryManager;
import com.tmnintegral.service.ReportManager;

/**
 * @author Agustina
 *
 */
@Controller
public class AlarmController {
	
	@Autowired
	private ReportManager reportManager;
	@Autowired
	private ConfigurationManager configurationManager;
	@Autowired
	private InventoryManager inventoryManager;
	
	
	
	@RequestMapping(value="/monitoring/listadoAlarmasEnviadas.htm")
    public ModelAndView getAlarmas(HttpSession session, HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
		
		Map<String, Object> myModel = new HashMap<String, Object>();
		myModel.put("alarmas", this.reportManager.getAlarmsSent());
		
		return new ModelAndView("dashboard/reportes/alarmas", "model", myModel);
    }
	
	@RequestMapping(value="/monitoring/configurarAlarmas.htm")
    public ModelAndView configurarAlarmas(HttpSession session, HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
		
		Map<String, Object> myModel = new HashMap<String, Object>();
		List<Alarm> alarms = this.reportManager.getAlarmsConfigured(((User)session.getAttribute("user")).getClient().getId());
		List<Object[]> variables = this.configurationManager.getVariablesList();
		this.completeVariableName(alarms, variables);
		myModel.put("alarmasList", alarms);
		myModel.put("variablesList", variables);
		myModel.put("deviceList", this.inventoryManager.getDeviceList(((User)session.getAttribute("user")).getClient().getId()));
		myModel.put("interfacesList", this.inventoryManager.getInterfaceList(((User)session.getAttribute("user")).getClient()));
		
		return new ModelAndView("dashboard/reportes/listAlarmas", "model", myModel);
    }
	
	@RequestMapping(value="monitoring/getDeviceInterfaces.htm", headers="Accept=*/*", produces="application/json; charset=UTF-8")
	@ResponseBody
    public String obtenerInterfacesDeEquipo(HttpSession session, HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
		
		String deviceId = request.getParameter("deviceId");
		List<Interface> interfaces =  this.inventoryManager.getInterfaceListByDevice(Integer.parseInt(deviceId));
		
		return this.toJson(interfaces).toString();
    }
	
	
	/**
	 * Convierte la lista en un json
	 */
	private JsonArray toJson(List<Interface> interfaces) {
		JsonArrayBuilder lista = Json.createArrayBuilder();
		Iterator<Interface> it = interfaces.iterator();
		while (it.hasNext()){
			lista.add(it.next().toJSON());
		}
		return lista.build();
	}

	@RequestMapping(value="/monitoring/eliminarAlarma.htm")
	public ModelAndView borrarAlarma(HttpServletRequest request, HttpServletResponse response, HttpSession session)
	        throws ServletException, IOException {
		
		Integer id = Integer.parseInt(request.getParameter("alarmId"));
		this.reportManager.eliminarAlarma(id);
		return this.configurarAlarmas(session, request, response);
	}
	
	@RequestMapping(value="monitoring/createAlarm.htm")
	public ModelAndView createAlarm(HttpServletRequest request, HttpServletResponse response, HttpSession session)
	        throws ServletException, IOException {
		
		String elementName = "";
		Integer varId = request.getParameter("idVar") != null ? Integer.parseInt(request.getParameter("idVar")) : null;
		String eId = request.getParameter("idDev");
		Device d = null;
		if (eId != null){
			String[] dev = eId.split(",");
			d = new Device(Integer.parseInt(dev[0]));
			elementName = dev[1];
		}
		String iId = request.getParameter("idInt");
		Interface i = null;
		if (iId != null){
			String[] interf = iId.split(",");
			i = new Interface(Integer.parseInt(interf[0]));
			elementName = interf[1];
		}
		String dest = request.getParameter("dest");
		Integer umbral = request.getParameter("umbral") != null ? Integer.parseInt(request.getParameter("umbral")) : null;

		Alarm alarm = new Alarm(null, varId, d, i, dest, ((User)session.getAttribute("user")).getClient(), elementName, umbral);
		this.reportManager.crearAlarma(alarm);
		
		return this.configurarAlarmas(session, request, response);
	}
	
	@RequestMapping(value="monitoring/displayAlarm.htm", headers="Accept=*/*", produces="application/json; charset=UTF-8")
	@ResponseBody
    public String mostrarAlarma(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

		Alarm a = this.reportManager.getAlarmById(
				Integer.parseInt((String)request.getParameter("id")));
		return a.toJSON().toString();
    }
	

	/**
	 * @return the reportManager
	 */
	public ReportManager getReportManager() {
		return reportManager;
	}

	/**
	 * @param reportManager the reportManager to set
	 */
	public void setReportManager(ReportManager reportManager) {
		this.reportManager = reportManager;
	}

	/**
	 * @return the configurationManager
	 */
	public ConfigurationManager getConfigurationManager() {
		return configurationManager;
	}

	/**
	 * @param configurationManager the configurationManager to set
	 */
	public void setConfigurationManager(ConfigurationManager configurationManager) {
		this.configurationManager = configurationManager;
	}

	/**
	 * @return the inventoryManager
	 */
	public InventoryManager getInventoryManager() {
		return inventoryManager;
	}

	/**
	 * @param inventoryManager the inventoryManager to set
	 */
	public void setInventoryManager(InventoryManager inventoryManager) {
		this.inventoryManager = inventoryManager;
	}
	
	/**
	 * Completa el nombre de las variables
	 * @param alarms
	 * @param variables
	 */
	private void completeVariableName(List<Alarm> alarms, List<Object[]> variables) {
		Iterator<Alarm> itAlarms = alarms.iterator();
		Alarm current;
		while (itAlarms.hasNext()){
			current = itAlarms.next();
			current.setVariableName(this.getVariableName(current.getIdVariable(), variables));
		}
		
	}

	/**
	 * Compara variables y sus ids para obtener el nombre
	 * @param idVariable
	 * @param variables
	 * @return
	 */
	private String getVariableName(Integer idVariable, List<Object[]> variables) {
		Iterator<Object[]> itVar = variables.iterator();
		Object[] current;
		while(itVar.hasNext()){
			current = itVar.next();
			if ((Integer)current[0] == idVariable)
				return (String) current[1];
		}
		return null;
	}
}
