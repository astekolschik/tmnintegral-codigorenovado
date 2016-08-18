/**
 * 
 */
package com.tmnintegral.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * @author Agustina
 *
 */
@Controller
public class EnProgresoController {

	protected final Log logger = LogFactory.getLog(getClass());

	
	@RequestMapping(value="/enProgreso.htm")
    public ModelAndView listarComandos(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
		return new ModelAndView("/enProgreso");
    }
	
}