/**
 * 
 */
package com.tmnintegral.web;

import java.io.IOException;

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

import com.tmnintegral.service.LogManager;

/**
 * @author Usuario
 *
 */
@Controller
public class TMNController {

	protected final Log logger = LogFactory.getLog(getClass());
	
	@Autowired
	private LogManager logManager;

	@RequestMapping(value="/index.htm")
    public ModelAndView login(HttpSession session, HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

		return new ModelAndView("index");
    }

	/**
	 * @param logManager the logManager to set
	 */
	public void setLogManager(LogManager logManager) {
		this.logManager = logManager;
	}
	
}
