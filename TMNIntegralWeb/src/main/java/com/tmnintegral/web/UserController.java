/**
 * 
 */
package com.tmnintegral.web;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.tmnintegral.domain.User;
import com.tmnintegral.service.LogManager;
import com.tmnintegral.service.UserManager;

/**
 * @author Agustina
 *
 */
@Controller
@MultipartConfig
public class UserController {

	protected final Log logger = LogFactory.getLog(getClass());

	@Autowired
	private UserManager um;
	@Autowired
	private LogManager logManager;
	
	private static int PENDING_ROLE = 4;
	private static int REGISTER_ROLE = 3;
	private static int USER_ROLE = 2;
	private static int ADMIN_ROLE = 1;
	
	@RequestMapping(value="/register.htm")
    public ModelAndView registerUser(HttpServletRequest request, HttpServletResponse response, HttpSession session)
            throws ServletException, IOException {

		Map<String, Object> myModel = new HashMap<String, Object>();
		
		if (request.getParameter("usuario") == null){
			myModel.put("clients", this.um.getClients());
			return new ModelAndView("index/register", "model", myModel);
		}else{
			
			String user = request.getParameter("usuario");
			String password = request.getParameter("password");
			String email = request.getParameter("email");
			String nombre = request.getParameter("nombre");
			String apellido = request.getParameter("apellido");
			String direccion = request.getParameter("direccion");
			String notas = request.getParameter("notas");
			String client = request.getParameter("client");
			
	        try {
				um.crearUsuario(user, nombre, apellido, email, password, PENDING_ROLE, 
						direccion, notas, client);
				myModel.put("status", "Usuario creado con éxito!");
				myModel.put("statusType", "OK");
			} catch (Exception e) {
				System.out.println(e.getMessage());
				myModel.put("status", e.getMessage());
				myModel.put("statusType", "ERROR");
				return new ModelAndView("index/register", "model", myModel);
			}
		}
		return new ModelAndView("index/register", "model", myModel);

    }
	
	@RequestMapping(value="/dashboard/user/updateUser.htm")
	 public ModelAndView dashboardUpdateUser(HttpServletRequest request, HttpServletResponse response, HttpSession session)
	            throws ServletException, IOException {
		return this.updateUser(request, response, session);
	}
	
	@RequestMapping(value="/user/updateUser.htm")
    public ModelAndView updateUser(HttpServletRequest request, HttpServletResponse response, HttpSession session)
            throws ServletException, IOException {

		Map<String, Object> myModel = new HashMap<String, Object>();
		User userobj;
		if (request.getParameter("saveUser") == null){
			userobj = (User)(session.getAttribute("user"));
			myModel.put("userObj", userobj);
		}else{
			String username = ((User)(session.getAttribute("user"))).getUser_name();
			String nombre = request.getParameter("nombre");
			String apellido = request.getParameter("apellido");
			String email = request.getParameter("email");
			String password = request.getParameter("password");
			String direccion = request.getParameter("direccion");
			String notas = request.getParameter("notas");
			
			
			userobj = this.um.modificarUsuario(nombre, apellido, email, username, password, direccion, notas);
			userobj.setPassword(password);
			session.setAttribute("user", userobj);
			myModel.put("userObj", userobj);
			myModel.put("saveMessage", "Usuario actualizado con exito.");
			myModel.put("context", true);
		}
		myModel.put("logs", logManager.getLastUserLogs(userobj.getId()));
		
		return new ModelAndView("dashboard/user/updateUser", "model", myModel);
    }
	
	@RequestMapping(value="user/deleteUser.htm")
    public ModelAndView deleteUsers(HttpServletRequest request, HttpServletResponse response, HttpSession session)
            throws ServletException, IOException {

		Map<String, Object> myModel = new HashMap<String, Object>();
		
		if (request.getParameter("deleteUserList") == null){
			User u = (User) session.getAttribute("user");
			List<User> userList = this.um.getUserList(u.getClient().getId());
			myModel.put("userList", userList);
		}else{
			String userList = request.getParameter("deleteUserList");
			String[] usersToDel = userList.split(",");
			for (int i=0; i<usersToDel.length; i++){
				this.um.eliminarUsuario(usersToDel[i]);
			}
			List<User> newUserList = this.um.getUserList();
			myModel.put("userList", newUserList);
		}
		return new ModelAndView("dashboard/user/deleteUser", "model", myModel);
    }

	@RequestMapping(value="user/enableUser.htm")
    public ModelAndView enableUsers(HttpServletRequest request, HttpServletResponse response, HttpSession session)
            throws ServletException, IOException {

		Map<String, Object> myModel = new HashMap<String, Object>();
		User user = (User) session.getAttribute("user");
		List<User> userList = this.um.getUserList(user.getClient().getId());
		myModel.put("userList", userList);
		
		if (request.getParameter("adminUserList") != null){
			String[] adminUserList = request.getParameter("adminUserList").split(",");
			String[] enableUserList = request.getParameter("userList").split(",");
			String[] reportUserList = request.getParameter("reportList").split(",");
			
			Iterator<User> uIterator = userList.iterator();
			while (uIterator.hasNext()){
				User u = uIterator.next();
				if (isInList(reportUserList, u.getUser_name()))
					u.setRole(this.um.getRoleById(REGISTER_ROLE));
				if (isInList(enableUserList, u.getUser_name()))
					u.setRole(this.um.getRoleById(USER_ROLE));
				if (isInList(adminUserList, u.getUser_name()))
					u.setRole(this.um.getRoleById(ADMIN_ROLE));
				this.um.updateUser(u);
			}
		}
		return new ModelAndView("dashboard/user/enableUser", "model", myModel);
    }

	
	@RequestMapping(value="user/allowUser.htm")
    public ModelAndView allowUsers(HttpServletRequest request, HttpServletResponse response, HttpSession session)
            throws ServletException, IOException {

		Map<String, Object> myModel = new HashMap<String, Object>();
		User user = (User) session.getAttribute("user");
		List<User> userList = this.um.getDisabledUserList(user.getClient().getId());
		myModel.put("userList", userList);
		
		if (request.getParameter("enabledUserList") != null){
			String[] enableUserList = request.getParameter("enabledUserList").split(",");
			
			Iterator<User> uIterator = userList.iterator();
			while (uIterator.hasNext()){
				User u = uIterator.next();
				if (isInList(enableUserList, u.getUser_name()))
					u.setRole(this.um.getRoleById(REGISTER_ROLE));
				this.um.updateUser(u);
			}
			userList = this.um.getDisabledUserList(user.getClient().getId());
			myModel.put("userList", userList);
		}
		return new ModelAndView("dashboard/user/allowUser", "model", myModel);
    }
	
	
	@RequestMapping(value="user/updateUserImage.htm",headers="Accept=*/*", produces="application/json; charset=UTF-8", method=RequestMethod.POST)
	@ResponseBody
	public String updateUserImage(@RequestParam("newImage") MultipartFile file, HttpServletRequest request, HttpSession session)
            throws ServletException, IOException {
		User user = (User)session.getAttribute("user");
		if (!file.isEmpty()) {
			try {
				byte[] bytes = file.getBytes();

				// Creating the directory to store file
				String rootPath = request.getServletContext().getRealPath("/");
				File dir = new File(rootPath + File.separator + "img" + File.separator + "users");
				if (!dir.exists())
					dir.mkdirs();

				// Create the file on server
				File serverFile = new File(dir.getAbsolutePath()
						+ File.separator + (user.getId() + "-" + file.getOriginalFilename()));
				BufferedOutputStream stream = new BufferedOutputStream(
						new FileOutputStream(serverFile));
				stream.write(bytes);
				stream.close();

				user.setCompletePicDir(user.getId() + "-" + file.getOriginalFilename());
 				this.um.updateUserImgPath(user);
				session.setAttribute("user", user);
			} catch (Exception e) {
				return "Error al subir el archivo => " + e.getMessage();
			}
		} else {
			return "El archivo esta vacio";
		}
		
		return user.getImagePath();
	}

	private boolean isInList(String[] list, String value){
		for (int i=0; i<list.length; i++){
			if (list[i].equals(value))
				return true;
		}
		return false;
	}
}

