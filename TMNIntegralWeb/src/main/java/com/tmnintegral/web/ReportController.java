/**
 * 
 */
package com.tmnintegral.web;

import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.json.JsonObject;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.tmnintegral.domain.User;
import com.tmnintegral.service.InventoryManager;
import com.tmnintegral.service.LogManager;
import com.tmnintegral.service.ReportManager;

/**
 * @author Agustina
 *
 */
@Controller
public class ReportController {

	protected final Log logger = LogFactory.getLog(getClass());
	
	@Autowired
	private LogManager logManager;
	@Autowired
	private ReportManager reportManager;
	@Autowired
	private InventoryManager inventoryManager;

	@RequestMapping(value="/monitoring/parametrosReporte.htm")
    public ModelAndView parametrosReporte(HttpSession session, HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
		User currUser = (User) session.getAttribute("user");
		
		Map<String, Object> myModel = new HashMap<String, Object>();
		myModel.put("reportList", this.reportManager.getReportNames());
		myModel.put("devices", this.inventoryManager.getDeviceList(currUser.getClient().getId()));
		myModel.put("interfaces", this.inventoryManager.getInterfaceList(currUser.getClient()));
		
		return new ModelAndView("dashboard/reportes/parametrosReporte", "model", myModel);
    }
	
	@RequestMapping(value="monitoring/generarReporte.htm", headers="Accept=*/*", produces="application/json; charset=UTF-8")
	@ResponseBody
    public String generarReporte(HttpSession session, HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
		
		String tipoReporte = request.getParameter("tipo-reporte");
		String eqsId = request.getParameter("lista-equipos-value");
		String interId = request.getParameter("lista-interfaces-value");
		
		String dateFromStr = request.getParameter("fecha-desde");
		String dateToStr = request.getParameter("fecha-hasta");
		
		DateFormat sourceFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date dateFrom = null, dateTo = null;
		try {
			dateFrom = sourceFormat.parse(dateFromStr);
			dateTo = sourceFormat.parse(dateToStr);
		} catch (ParseException e) {
			System.err.println("Error al parsear las fechas");
		}
		
		JsonObject reportInfo = this.reportManager.getInformationForReports(tipoReporte, eqsId.split(","), interId.split(","), dateFrom, dateTo);
		return reportInfo.toString();
    }
	
	
	/**
	 * @param logManager the logManager to set
	 */
	public void setLogManager(LogManager logManager) {
		this.logManager = logManager;
	}

	/**
	 * @param reportManager the reportManager to set
	 */
	public void setReportManager(ReportManager reportManager) {
		this.reportManager = reportManager;
	}

	/**
	 * @param inventoryManager the inventoryManager to set
	 */
	public void setInventoryManager(InventoryManager inventoryManager) {
		this.inventoryManager = inventoryManager;
	}
	
}
