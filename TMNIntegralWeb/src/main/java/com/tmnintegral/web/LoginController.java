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
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.tmnintegral.domain.User;
import com.tmnintegral.service.LogManager;
import com.tmnintegral.service.ReportManager;
import com.tmnintegral.service.UserManager;

/**
 * @author Agustina
 *
 */
@Controller
public class LoginController {

	protected final Log logger = LogFactory.getLog(getClass());
	
	@Autowired
	private UserManager um;
	@Autowired
	private LogManager logManager;
	@Autowired
	private ReportManager reportManager;

	@RequestMapping(value="/login.htm")
    public ModelAndView login(HttpSession session, HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

		Map<String, Object> myModel = new HashMap<String, Object>();
        
		if (request.getParameter("usuario") == null)
			return new ModelAndView("index/login");
		else{
			
			String user = request.getParameter("usuario");
			String password = request.getParameter("password");
			
	        try {
	        	User u = um.autenticarUsuario(user, password);
				if (u != null){
					session.setAttribute("user", u);
					logManager.saveLoginLog(u.getId());
					
					myModel.put("alarms", reportManager.getAlarmsSentInTheLastHour());
					myModel.put("logs", logManager.getLastUserLogs(u.getId()));
					
					return new ModelAndView("dashboard/index", "model", myModel);
				}else{
					myModel.put("status", "Error en el usuario/contraseña. Intente nuevamente.");
					return new ModelAndView("index/login", "model", myModel);
				}
			} catch (Exception e) {
				System.out.println(e.getMessage());
				myModel.put("status", "Usuario inexistente. Intente nuevamente.");
				return new ModelAndView("index/login", "model", myModel);
			}
		}

    }
	
	@RequestMapping(value="/olvidePass.htm")
    public ModelAndView resetPassword(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

		Map<String, Object> myModel = new HashMap<String, Object>();
        
		if (request.getParameter("usuario") == null){
			myModel.put("status", "Ingrese el usuario.");
			return new ModelAndView("index/olvidePass", "model", myModel);
		}else{
			String username = request.getParameter("usuario");
	        try {
				if (um.resetearContrasena(username)){
					this.logManager.saveResetPassLog(username);
					myModel.put("status", "Su nueva contraseña fue enviada por email.");
					return new ModelAndView("index/login", "model", myModel);
				}else{
					myModel.put("status", "El usuario es inexistente.");
					return new ModelAndView("index/olvidePass", "model", myModel);
				}
			} catch (Exception e) {
				System.out.println(e.getMessage());
				myModel.put("status", "El usuario es inexistente.");
				return new ModelAndView("index/olvidePass", "model", myModel);
			}
		}
    }
	
	@RequestMapping(value="/logout.htm")
    public ModelAndView logout(HttpSession session, SessionStatus status)
            throws ServletException, IOException {
		
		logManager.saveLogoutLog(((User)session.getAttribute("user")).getId());
		
		status.setComplete();
		session.removeAttribute("user");
		return new ModelAndView("index");
    }
	
	@RequestMapping(value="/dashboard/index.htm")
	public ModelAndView redirectDashboardIndex(HttpSession session, SessionStatus status)
            throws ServletException, IOException {
		Map<String, Object> myModel = new HashMap<String, Object>();
	    myModel.put("context", true);
		return new ModelAndView("dashboard/index", "model", myModel);
	}
	
	

	/**
	 * @param um the um to set
	 */
	public void setUm(UserManager um) {
		this.um = um;
	}

	/**
	 * @param logManager the logManager to set
	 */
	public void setLogManager(LogManager logManager) {
		this.logManager = logManager;
	}
	
}
