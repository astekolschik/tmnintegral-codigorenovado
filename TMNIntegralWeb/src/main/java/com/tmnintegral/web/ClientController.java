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

import com.tmnintegral.service.ClientManager;
import com.tmnintegral.service.UserManager;

/**
 * @author Agustina
 *
 */
@Controller
public class ClientController {

	protected final Log logger = LogFactory.getLog(getClass());

	@Autowired
	private UserManager um;
	@Autowired
	private ClientManager cm;
	
	
	@RequestMapping(value="/client/clientes.htm")
    public ModelAndView listClients(HttpServletRequest request, HttpServletResponse response, HttpSession session)
            throws ServletException, IOException {

		Map<String, Object> myModel = new HashMap<String, Object>();
		myModel.put("clients", this.um.getClients());
		return new ModelAndView("dashboard/user/listClient", "model", myModel);
    }
	
	@RequestMapping(value="/client/updateClient.htm")
    public ModelAndView createClient(HttpServletRequest request, HttpServletResponse response, HttpSession session)
            throws ServletException, IOException {

		String clientId = request.getParameter("id");
		String clientDesc = request.getParameter("descripcion");

		Map<String, Object> myModel = new HashMap<String, Object>();
		try {
			this.cm.createClient(Integer.parseInt(clientId), clientDesc);
		} catch (Exception e) {
			myModel.put("error", "Error al crear el cliente. Duplicado");
		}
		
		myModel.put("clients", this.um.getClients());
		return new ModelAndView("dashboard/user/listClient", "model", myModel);

    }
	
}

