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
import org.springframework.web.servlet.ModelAndView;

import com.tmnintegral.domain.CommandKey;
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
	
}