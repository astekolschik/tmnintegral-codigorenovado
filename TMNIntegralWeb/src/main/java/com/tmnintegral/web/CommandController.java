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
import org.springframework.web.servlet.ModelAndView;

import com.tmnintegral.domain.Command;
import com.tmnintegral.service.ConfigurationManager;
import com.tmnintegral.service.InventoryManager;

/**
 * @author Agustina
 *
 */
@Controller
public class CommandController {

	protected final Log logger = LogFactory.getLog(getClass());

	@Autowired
	private ConfigurationManager cm;
	@Autowired
	private InventoryManager im;
	
	@RequestMapping(value="/listComandos.htm")
    public ModelAndView listarComandos(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

		Map<String, Object> myModel = new HashMap<String, Object>();
		myModel.put("commandList", cm.getCommandList());
		
		return new ModelAndView("configurationManager/listComandos", "model", myModel);
    }
	
	@RequestMapping(value="/displayComando.htm")
    public ModelAndView mostrarComando(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

		Map<String, Object> myModel = new HashMap<String, Object>();
		Command c = cm.getCommandById(
				Integer.parseInt((String)request.getParameter("cId")));
		myModel.put("commandObj", c);
		myModel.put("deviceTypes", im.getTipoEquiposList());
		
		if (((String)request.getParameter("edit")).equals("true")){
			myModel.put("edit", true);
			myModel.put("displayEdit", "");
		}else{
			myModel.put("edit", false);
			myModel.put("displayEdit", "none");
		}
		
		return new ModelAndView("configurationManager/displayComando", "model", myModel);
    }
	
	@RequestMapping(value="/nuevoComando.htm")
	public ModelAndView nuevoComando(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
		
		Map<String, Object> myModel = new HashMap<String, Object>();
		Command c = new Command();
		myModel.put("commandObj", c);
		myModel.put("edit", true);
		myModel.put("displayEdit", "");
		return new ModelAndView("configurationManager/displayComando", "model", myModel);
	}
	
	@RequestMapping(value="/updateComando.htm")
	public ModelAndView actualizarComando(HttpServletRequest request, HttpServletResponse response)
	        throws ServletException, IOException {
		
		String idComando = request.getParameter("idCommand");
		String nombrecomando = request.getParameter("nameComm");
		String comando = request.getParameter("defaultComm");
		String tipoComando = request.getParameter("tipocomando");
		
		String[] dtValues = null;
		if (request.getParameter("dtValues") != null)
			dtValues = request.getParameter("dtValues").split(",");
		
		if (idComando != null)
			this.cm.modificarComando(Integer.parseInt(idComando), comando, tipoComando, dtValues);
		else
			this.cm.crearComando(nombrecomando, comando, tipoComando, dtValues);
		
		return this.listarComandos(request, response);
	}
	
	
	@RequestMapping(value="/deleteComando.htm")
	public ModelAndView borrarComando(HttpServletRequest request, HttpServletResponse response)
	        throws ServletException, IOException {
		
		String idComando = request.getParameter("cId");
		
		this.cm.borrarComando(Integer.valueOf(idComando));
		
		return this.listarComandos(request, response);
	}
}