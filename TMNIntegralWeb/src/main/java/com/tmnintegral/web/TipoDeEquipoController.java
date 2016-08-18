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

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.tmnintegral.domain.TipoEquipo;
import com.tmnintegral.service.InventoryManager;

/**
 * @author Agustina
 *
 */
@Controller
public class TipoDeEquipoController {

	protected final Log logger = LogFactory.getLog(getClass());

	@Autowired
	private InventoryManager im;
	
	@RequestMapping(value="/inventory/listTipoEquipos.htm")
    public ModelAndView listarEquipos(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

		Map<String, Object> myModel = new HashMap<String, Object>();
		myModel.put("tipoEquipoList", im.getTipoEquiposList());
		
		return new ModelAndView("dashboard/inventory/listTipoEquipos", "model", myModel);
    }
	
	@RequestMapping(value="inventory/displayTipoEquipo.htm", headers="Accept=*/*", produces="application/json; charset=UTF-8")
	@ResponseBody
    public String mostrarTipoEquipo(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

		TipoEquipo te = im.getTipoDeEquipoById(
				Integer.parseInt((String)request.getParameter("teId")));
		return te.toJSON().toString();
    }
	
	@RequestMapping(value="inventory/updateTipoEquipo.htm")
	public ModelAndView actualizarTipoEquipo(HttpServletRequest request, HttpServletResponse response)
	        throws ServletException, IOException {
		
		String idEquipo = request.getParameter("idequipo");
		String description = request.getParameter("descripcion");
		String defaultComm = request.getParameter("defaultComm");
		String defaultSNMP = request.getParameter("defaultSNMP");
		String driver= request.getParameter("driver");
		String technology = request.getParameter("technology");
		String vendor = request.getParameter("vendor");
		
		if (idEquipo != null)
			this.im.modificarTipoEquipo(Integer.valueOf(idEquipo), description, defaultComm, defaultSNMP, driver, technology, vendor);
		else
			this.im.crearTipoEquipo(description, defaultComm, defaultSNMP, driver, technology, vendor);
		
		return this.listarEquipos(request, response);
	}
	
	@RequestMapping(value="inventory/deleteTipoEquipo.htm")
	public ModelAndView borrarTipoEquipo(HttpServletRequest request, HttpServletResponse response)
	        throws ServletException, IOException {
		
		String idEquipo = request.getParameter("teId");
		
		this.im.borrarTipoEquipo(Integer.valueOf(idEquipo));
		
		return this.listarEquipos(request, response);
	}
}