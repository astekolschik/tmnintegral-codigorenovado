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

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
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
		
		Map<String, Object> myModel = new HashMap<>();
		myModel.put("reportList", this.reportManager.getReportNames());
		myModel.put("devices", this.inventoryManager.getDeviceList(currUser.getClient().getId()));
		
		return new ModelAndView("dashboard/reportes/parametrosReporte", "model", myModel);
    }
	
	@RequestMapping(value="monitoring/generarReporte.htm")
    public ModelAndView generarReporte(HttpSession session, HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
		
		String tipoReporte = request.getParameter("tipo-reporte");
		String eqsId = request.getParameter("lista-equipos-value");
		
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
		
		String resp = "";
		switch(tipoReporte){
			case "1"://Memoria disponible
				resp = this.reportManager.getInformationForMemoriaDisponibleReport(eqsId.split(","), dateFrom, dateTo);
				break;
			case "2"://Memoria utilizada
				resp = this.reportManager.getInformationForMemoriaUtilizadaReport(eqsId.split(","), dateFrom, dateTo);
				break;
			case "3"://Trafico entrante
				resp = this.reportManager.getInformationForTraficoEntranteReport(eqsId.split(","), dateFrom, dateTo);
				break;
			case "4"://Trafico saliente
				resp = this.reportManager.getInformationForTraficoSalienteReport(eqsId.split(","), dateFrom, dateTo);
				break;
			case "5"://Utilizacion CPU
				resp = this.reportManager.getInformationForUtilizacionCPUReport(eqsId.split(","), dateFrom, dateTo);
				break;
		}
		
		Map<String, Object> myModel = new HashMap<>();
		myModel.put("reportData", resp);
		return new ModelAndView("reportes/reporte", "model", myModel);
    }
	
	@RequestMapping(value="/monitoring/alarmas.htm")
    public ModelAndView getAlarmas(HttpSession session, HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
		
		Map<String, Object> myModel = new HashMap<>();
		myModel.put("alarmas", this.reportManager.getAlarmsSent());
		
		return new ModelAndView("dashboard/reportes/alarmas", "model", myModel);
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
