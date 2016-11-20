/**
 * 
 */
package com.tmnintegral.web;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.HashMap;
import java.util.Map;

import javax.json.JsonObject;
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

import com.tmnintegral.domain.Red;
import com.tmnintegral.domain.User;
import com.tmnintegral.service.InventoryManager;

/**
 * @author Agustina/Martin
 *
 */
@Controller
public class NetworkController {

	protected final Log logger = LogFactory.getLog(getClass());

	@Autowired
	private InventoryManager im;
	
	@RequestMapping(value="/inventory/displayNetwork.htm")
    public ModelAndView obtenerTopologias(HttpServletRequest request, HttpServletResponse response, HttpSession session)
            throws ServletException, IOException {

		
		Map<String, Object> myModel = new HashMap<String, Object>();
		JsonObject topologia = this.im.obtenerTopologiaDeRed(((User)session.getAttribute("user")).getClient().getId());
		myModel.put("networkGraph", topologia.toString().replace("\"", "'"));
		
		return new ModelAndView("dashboard/inventory/displayNetwork", "model", myModel);
    }
	
	@RequestMapping(value="/inventory/listRedes.htm")
    public ModelAndView listRed(HttpServletRequest request, HttpServletResponse response, HttpSession session)
            throws ServletException, IOException {

		Map<String, Object> myModel = new HashMap<String, Object>();
		myModel.put("redesList", this.im.getRedList(((User)session.getAttribute("user")).getClient()));
		
		return new ModelAndView("dashboard/inventory/listRed", "model", myModel);
    }
	
    public ModelAndView listRedWithErrors(HttpServletRequest request, HttpServletResponse response, HttpSession session, String error)
            throws ServletException, IOException {

		Map<String, Object> myModel = new HashMap<String, Object>();
		myModel.put("error", error);
		myModel.put("redesList", this.im.getRedList(((User)session.getAttribute("user")).getClient()));
		
		return new ModelAndView("dashboard/inventory/listRed", "model", myModel);
    }
    
    
	@RequestMapping(value="inventory/eliminarRed.htm")
	public ModelAndView borrarRed(HttpServletRequest request, HttpServletResponse response, HttpSession session)
	        throws ServletException, IOException {
		
		Integer net = Integer.parseInt(request.getParameter("rId"));
		if (!this.im.redHasElements(net)){
			this.im.eliminarRed(net);
			return this.listRed(request, response, session);
		}
		return this.listRedWithErrors(request, response, session, "La red contiene elementos. Eliminelos primero para eliminarla.");
	}
	
	@RequestMapping(value="inventory/displayRed.htm", headers="Accept=*/*", produces="application/json; charset=UTF-8")
	@ResponseBody
    public String mostrarRed(HttpServletRequest request, HttpServletResponse response, HttpSession session)
            throws ServletException, IOException {

		Red red = im.getRedById(
				Integer.parseInt((String)request.getParameter("redId")));
		return red.toJSON().toString();
    }
	
	@RequestMapping(value="inventory/updateRed.htm")
	public ModelAndView actualizarRed(HttpServletRequest request, HttpServletResponse response, HttpSession session)
	        throws ServletException, IOException {
		
		String idRed = request.getParameter("idred");
		String network = request.getParameter("network");
		String enabled = request.getParameter("enabled");
		String description = request.getParameter("description");
		
		if (idRed != null)
			this.im.modificarRed(Integer.parseInt(idRed), network, Byte.parseByte(enabled), description);
		else
			this.im.crearRed(network, Byte.parseByte(enabled), description, ((User)session.getAttribute("user")).getClient());
		
		return this.listRed(request, response, session);
	}
	
	@RequestMapping(value="inventory/callDiscoveryPgm.htm")
	public ModelAndView discoveryProgram(HttpServletRequest request, HttpServletResponse response, HttpSession session)
	        throws ServletException, IOException {
		
		
		System.out.println("Llamada al programa que ejecuta el discovery de red.");
		//ejemplo para llamar a un pograma
		/*Process process = new ProcessBuilder(
				"C:\\PathToExe\\MyExe.exe","param1","param2").start();*/

		//TODO update dir
		Process process = Runtime.getRuntime().exec("cmd /c dir C:\\Users"); 

		InputStream is = process.getInputStream();
		InputStreamReader isr = new InputStreamReader(is);
		BufferedReader br = new BufferedReader(isr);

		String line;
		while ((line = br.readLine()) != null) {
		  System.out.println(line);
		}

		
		return this.listRed(request, response, session);
	}
}