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

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.tmnintegral.domain.Command;
import com.tmnintegral.domain.CommandKey;
import com.tmnintegral.domain.TipoEquipo;
import com.tmnintegral.domain.User;
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
	
	@RequestMapping(value="/configuration/listComandos.htm")
    public ModelAndView listarComandos(HttpServletRequest request, HttpServletResponse response, HttpSession session)
            throws ServletException, IOException {

		Map<String, Object> myModel = new HashMap<String, Object>();
		myModel.put("commandList", cm.getCommandList(((User)session.getAttribute("user")).getClient().getId()));
		myModel.put("tipoEquipoList", this.im.getTipoEquiposList());
		myModel.put("variablesList", this.cm.getVariablesList());
		
		return new ModelAndView("dashboard/configurationManager/listComandos", "model", myModel);
    }
	
	@RequestMapping(value="configuration/deleteComando.htm")
	public ModelAndView deleteComando(HttpServletRequest request, HttpServletResponse response, HttpSession session)
	        throws ServletException, IOException {
		
		String[] commandKey= request.getParameter("commandId").split(",");
		
		this.cm.borrarComando(new CommandKey(Integer.parseInt(commandKey[0]), Integer.parseInt(commandKey[1]), commandKey[2]));
		
		return this.listarComandos(request, response, session);
	}
	
	@RequestMapping(value="configuration/createCommand.htm")
	public ModelAndView createComando(HttpServletRequest request, HttpServletResponse response, HttpSession session)
	        throws ServletException, IOException {
		
		Integer varId = Integer.parseInt(request.getParameter("variable"));
		Integer teId = Integer.parseInt(request.getParameter("tipoequipo"));
		String fieldname = request.getParameter("fieldname");
		String type = request.getParameter("type");
		String regex = request.getParameter("regex");
		String operation = request.getParameter("operation");
		String device = request.getParameter("device");
		
		Command newCommand = new Command(new CommandKey(varId, teId, fieldname), type, regex, operation, null, null, null, null, device);
		
		this.cm.crearComando(newCommand);
		
		return this.listarComandos(request, response, session);
	}
	
	@RequestMapping(value="configuration/displayComando.htm", headers="Accept=*/*", produces="application/json; charset=UTF-8")
	@ResponseBody
    public String mostrarComando(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

		Command c = this.cm.getCommandById(
				Integer.parseInt((String)request.getParameter("idVar")),
				Integer.parseInt((String)request.getParameter("idTE")),
				(String)request.getParameter("fieldName"));
		return c.toJSON().toString();
    }
	
	@RequestMapping(value="configuration/updateComando.htm")
	public ModelAndView actualizarComando(HttpServletRequest request, HttpServletResponse response, HttpSession session)
	        throws ServletException, IOException {
		
		Integer idVariable = Integer.parseInt(request.getParameter("variable"));
		Integer idTipoEquipo = Integer.parseInt(request.getParameter("tipoequipo"));
		String fieldName = request.getParameter("fieldname");
		String type = request.getParameter("type");
		String regex = request.getParameter("regex");
		String operation = request.getParameter("operation");
		String isDevice = request.getParameter("device");
		
		this.cm.actualizarComando(idVariable, idTipoEquipo, fieldName, type, regex, operation, isDevice);
		
		return this.listarComandos(request, response, session);
	}

}
