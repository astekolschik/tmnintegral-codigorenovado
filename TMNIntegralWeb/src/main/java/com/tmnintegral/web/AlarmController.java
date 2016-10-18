/**
 * 
 */
package com.tmnintegral.web;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

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
import com.tmnintegral.domain.Command;
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
		myModel.put("alarmasList", this.reportManager.getAlarmsConfigured(((User)session.getAttribute("user")).getClient().getId()));
		myModel.put("variablesList", this.configurationManager.getVariablesList());
		myModel.put("deviceList", this.inventoryManager.getDeviceList(((User)session.getAttribute("user")).getClient().getId()));
		myModel.put("interfacesList", this.inventoryManager.getInterfaceList(((User)session.getAttribute("user")).getClient()));
		
		return new ModelAndView("dashboard/reportes/listAlarmas", "model", myModel);
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
		
		Integer varId = request.getParameter("idVar") != null ? Integer.parseInt(request.getParameter("idVar")) : null;
		Integer eId = request.getParameter("idDev") != null? Integer.parseInt(request.getParameter("idDev")) : null;
		Device d = null;
		if (eId != null)
			d = new Device(eId);
		Integer iId = request.getParameter("idInt") != null ? Integer.parseInt(request.getParameter("idInt")) : null;
		Interface i = null;
		if (iId != null)
			i = new Interface(iId);
		String dest = request.getParameter("dest");

		Alarm alarm = new Alarm(null, varId, d, i, dest, ((User)session.getAttribute("user")).getClient());
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
	
}
