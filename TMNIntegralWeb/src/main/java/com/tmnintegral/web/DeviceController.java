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

import com.tmnintegral.domain.Device;
import com.tmnintegral.domain.User;
import com.tmnintegral.service.InventoryManager;

@Controller
public class DeviceController {
	
	protected final Log logger = LogFactory.getLog(getClass());

	@Autowired
	private InventoryManager im;
	

    @RequestMapping(value="/inventory/listDevice.htm")
    public ModelAndView listDevice(HttpServletRequest request, HttpServletResponse response, HttpSession session)
            throws ServletException, IOException {

		Map<String, Object> myModel = new HashMap<String, Object>();
		User currUser = (User) session.getAttribute("user");
		myModel.put("deviceList", im.getDeviceList(currUser.getClient().getId()));
		myModel.put("tipoEquipoList", this.im.getTipoEquiposList());
		myModel.put("redesList", this.im.getRedList(currUser.getClient()));
		
		return new ModelAndView("dashboard/inventory/listDevice", "model", myModel);
    }
    
    
	@RequestMapping(value="/inventory/eliminarEquipo.htm")
	public ModelAndView borrarDevice(HttpServletRequest request, HttpServletResponse response, HttpSession session)
	        throws ServletException, IOException {
		
		Integer id = Integer.parseInt(request.getParameter("dId"));
		this.im.eliminarDevice(id);
		return this.listDevice(request, response, session);
	}
	
	@RequestMapping(value="/inventory/displayDevice.htm", headers="Accept=*/*", produces="application/json; charset=UTF-8")
	@ResponseBody
    public String mostrarEquipo(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

		Device d = im.getDevice(
				Integer.parseInt((String)request.getParameter("dId")));
		
		return d.toJSON().toString();
    }
	
	@RequestMapping(value="/inventory/updateEquipo.htm")
	public ModelAndView actualizarEquipo(HttpServletRequest request, HttpServletResponse response, HttpSession session)
	        throws ServletException, IOException {
		
		String idDevice = request.getParameter("idDevice");
		String communityRead = request.getParameter("communityRead");
		String hostName = request.getParameter("hostName");
		String iosType = request.getParameter("iosType");
		String iosVersion = request.getParameter("iosVersion");
		String ip = request.getParameter("ip");
		String model = request.getParameter("model");
		String serialNumber = request.getParameter("serialNumber");
		String softwareRelease = request.getParameter("softwareRelease");
		Integer id_device_type = Integer.parseInt(request.getParameter("id_device_type"));
		Integer id_network = Integer.parseInt(request.getParameter("id_network"));
		Integer id_configuration = Integer.parseInt(request.getParameter("id_configuration"));
		String enable = request.getParameter("enable");
		
		if (idDevice != null)
			this.im.modificarDevice(Integer.parseInt(idDevice), communityRead, hostName, iosType, iosVersion, ip, model, serialNumber, 
					softwareRelease,id_device_type, id_network, id_configuration, enable);
		else
			this.im.crearDevice(communityRead, hostName, iosType, iosVersion, ip, model, serialNumber, softwareRelease,
					id_device_type, id_network, id_configuration, enable, ((User)session.getAttribute("user")).getClient());
		
		return this.listDevice(request, response, session);
	}
}



