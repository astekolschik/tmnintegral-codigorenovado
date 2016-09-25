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
	
	
	@RequestMapping(value="/client/clientes.htm")
    public ModelAndView registerUser(HttpServletRequest request, HttpServletResponse response, HttpSession session)
            throws ServletException, IOException {

		Map<String, Object> myModel = new HashMap<String, Object>();
		
		myModel.put("clients", this.um.getClients());
		return new ModelAndView("dashboard/user/listClient", "model", myModel);
    }
	
	@RequestMapping(value="/client/updateClient.htm")
    public ModelAndView updateUser(HttpServletRequest request, HttpServletResponse response, HttpSession session)
            throws ServletException, IOException {

		Map<String, Object> myModel = new HashMap<String, Object>();
//		
//		if (request.getParameter("saveUser") == null){
//			User userobj = (User)(session.getAttribute("user"));
//			myModel.put("logs", logManager.getLastUserLogs(userobj.getId()));
//			myModel.put("userObj", userobj);
//			return new ModelAndView("dashboard/user/updateUser", "model", myModel);
//		}else{
//			String username = ((User)(session.getAttribute("user"))).getUser_name();
//			String nombre = request.getParameter("nombre");
//			String apellido = request.getParameter("apellido");
//			String email = request.getParameter("email");
//			String password = request.getParameter("password");
//			String direccion = request.getParameter("direccion");
//			String notas = request.getParameter("notas");
//			
//			
//			User userobj = this.um.modificarUsuario(nombre, apellido, email, username, password, direccion, notas);
//			userobj.setPassword(password);
//			session.setAttribute("user", userobj);
//			myModel.put("userObj", userobj);
//			myModel.put("saveMessage", "Usuario actualizado con exito.");
//			myModel.put("context", true);
			return new ModelAndView("dashboard/index", "model", myModel);
//		}
    }
	
}

