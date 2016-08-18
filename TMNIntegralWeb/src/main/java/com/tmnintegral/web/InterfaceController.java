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

import com.tmnintegral.domain.Interface;
import com.tmnintegral.domain.User;
import com.tmnintegral.service.InventoryManager;



@Controller
public class InterfaceController {
	
	protected final Log logger = LogFactory.getLog(getClass());

	@Autowired
	private InventoryManager im;

    @RequestMapping(value="inventory/listInterface.htm")
    public ModelAndView listInterface(HttpServletRequest request, HttpServletResponse response, HttpSession session)
            throws ServletException, IOException {

		Map<String, Object> myModel = new HashMap<String, Object>();
		myModel.put("interfaceList", im.getInterfaceList(((User)session.getAttribute("user")).getClient()));
		
		return new ModelAndView("dashboard/inventory/listInterface", "model", myModel);
    }
    
    @RequestMapping(value="/altaInterface.htm")
	public ModelAndView nuevaInterface(HttpServletRequest request, HttpServletResponse response, HttpSession session)
            throws ServletException, IOException {
		
		Map<String, Object> myModel = new HashMap<String, Object>();
		Interface i = new Interface();
		myModel.put("interfaceObj", i);
		myModel.put("edit", true);
		myModel.put("displayEdit", "");
		myModel.put("listEquipos", this.im.getDeviceList());
		return new ModelAndView("inventory/altaInterface", "model", myModel);
	}
    
    @RequestMapping(value="inventory/displayInterface.htm", headers="Accept=*/*", produces="application/json; charset=UTF-8")
    @ResponseBody
    public String mostrarInterface(HttpServletRequest request, HttpServletResponse response, HttpSession session)
            throws ServletException, IOException {

		Interface i = im.getInterface(
				Integer.parseInt((String)request.getParameter("iId")));
		return i.toJSON().toString();
    }
    
    
    @RequestMapping(value="inventory/updateInterface.htm")
	public ModelAndView actualizarInterface(HttpServletRequest request, HttpServletResponse response, HttpSession session)
	        throws ServletException, IOException {
		
		Integer idInterfaz = (request.getParameter("idInterfaz")!= null)?Integer.parseInt(request.getParameter("idInterfaz")):null;
		String status = request.getParameter("status");
		String alias = request.getParameter("alias");
		String name = request.getParameter("name");
		Integer shelf= (request.getParameter("shelf")!= "")?Integer.parseInt(request.getParameter("shelf")):null;
		Integer slot = (request.getParameter("slot")!= "")?Integer.parseInt(request.getParameter("slot")):null;
		Integer port = (request.getParameter("port")!= "")?Integer.parseInt(request.getParameter("port")):null;
		Integer subport = (request.getParameter("subport")!= "")?Integer.parseInt(request.getParameter("subport")):null;
		String type = request.getParameter("type");
		Integer device = (request.getParameter("device")!= "")?Integer.parseInt(request.getParameter("device")):null;
		Integer ifIndex = (request.getParameter("ifIndex")!= "")?Integer.parseInt(request.getParameter("ifIndex")):null;
		String ipAdEntIfIndex = request.getParameter("ipAdEntIfIndex");
		String mac = request.getParameter("mac");
		Integer ip_next_hop = (request.getParameter("ip_next_hop")!= "")?Integer.parseInt(request.getParameter("ip_next_hop")):null;
		String mac_next_hop = request.getParameter("mac_next_hop");
		
		
		if (idInterfaz != null)
			this.im.modificarInterface(idInterfaz, status, alias, name, shelf, slot, port, subport, type, 
					device, ifIndex, ipAdEntIfIndex, mac, ip_next_hop, mac_next_hop);
		else
			this.im.crearInterface(status, alias, name, shelf, slot, port, subport, type, device,
					ifIndex, ipAdEntIfIndex, mac, ip_next_hop, mac_next_hop, ((User)session.getAttribute("user")).getClient());
		
		return this.listInterface(request, response, session);
	}
	
	@RequestMapping(value="inventory/eliminarInterface.htm")
	public ModelAndView eliminarInterface(HttpServletRequest request, HttpServletResponse response, HttpSession session)
	        throws ServletException, IOException {
		
		Integer interfaceId = Integer.parseInt(request.getParameter("iId"));
		
		this.im.eliminarInterface(interfaceId);
		
		return this.listInterface(request, response, session);
	}
}



