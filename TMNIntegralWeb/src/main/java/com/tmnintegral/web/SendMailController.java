package com.tmnintegral.web;

import java.io.IOException;
import java.util.Date;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class SendMailController {

    protected final Log logger = LogFactory.getLog(getClass());

	final static String SSL_FACTORY = "javax.net.ssl.SSLSocketFactory";
	private static String username = "contacto.tmnintegral@gmail.com";
	private static String password = "caece2015";

    
    @RequestMapping(value="/contacto.htm")
    public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        this.sendMail(request.getParameter("name"), 
        		request.getParameter("email"), 
        		request.getParameter("motivo"),
        		request.getParameter("message"));
        
        return new ModelAndView("");

    }
    
    
	private boolean sendMail(String name, String email, String motivo, String text){    

	      // Get system properties
	      Properties props = new Properties();
	      props.setProperty("mail.smtp.ssl.enable", "true");
	      props.setProperty("mail.smtp.host", "smtp.gmail.com");
	      props.put("mail.smtp.auth", "true");
	      props.put("mail.debug", "true");
	      props.put("mail.store.protocol", "pop3");
	      props.put("mail.transport.protocol", "smtp");
	      
	      try{
	    	  	Session session = Session.getDefaultInstance(props, 
						new Authenticator(){
							protected PasswordAuthentication getPasswordAuthentication() {
								return new PasswordAuthentication(username, password);
							}});
	    	  	
	    	  	//Message from the client to contact the prod
	    	  	Message msg = new MimeMessage(session);

				msg.setFrom(new InternetAddress(username));
				msg.setRecipients(Message.RecipientType.TO, 
	                  InternetAddress.parse(username,false));
				msg.setSubject("Contacto: " + name);
				msg.setText("Mensaje de consulta<br/>" +
							"Nombre: " + name + "<br/>" +
							"Email: " + email + "<br/>" +
							"Motivo:" + motivo + "<br/>" +
							"Mensaje:" + text);
				msg.setSentDate(new Date());
				Transport.send(msg);
				
				System.out.println("Message to the contact list sent.");
				
				msg = new MimeMessage(session);

				msg.setFrom(new InternetAddress(username));
				msg.setRecipients(Message.RecipientType.TO, 
	                  InternetAddress.parse(email,false));
				msg.setSubject("Gracias por contactarnos!");
				msg.setText("Responderemos a la brevedad su consulta!");
				msg.setSentDate(new Date());
				Transport.send(msg);
				
				System.out.println("Message to the user sent.");

	      }catch (MessagingException mex) {
	         mex.printStackTrace();
	         return false;
	      }
	      
	      return true;
	   }
}