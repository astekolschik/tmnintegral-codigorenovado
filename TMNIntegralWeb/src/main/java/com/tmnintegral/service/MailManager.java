package com.tmnintegral.service;

import java.io.Serializable;
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

import org.springframework.stereotype.Component;

/**
 * Encargado del manejo de usuarios
 * @author Agustina
 * @version 1.0
 */
@Component
public class MailManager implements Serializable{
	
	private static final long serialVersionUID = 1L;
	private static String username = "contacto.tmnintegral@gmail.com";
	private static String password = "caece2015";

	
	public static boolean sendPasswordMail(String name, String email, String motivo, String text){    

      // Get system properties
      Properties props = MailManager.getMailProperties();
      
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
	                  InternetAddress.parse(email,false));
			msg.setSubject(motivo);
			msg.setText(text);
			msg.setSentDate(new Date());
			Transport.send(msg);
			
			System.out.println("Message to the user sent.");

      }catch (MessagingException mex) {
         mex.printStackTrace();
         return false;
      }
      
      return true;
   }
	
	public static boolean sendAlarmMail(String interfaceName, String emailsDest){    

      // Get system properties
      Properties props = MailManager.getMailProperties();
      
      try{
    	  	Session session = Session.getDefaultInstance(props, 
					new Authenticator(){
						protected PasswordAuthentication getPasswordAuthentication() {
							return new PasswordAuthentication(username, password);
						}});
    	  	
    	  	Message msg = new MimeMessage(session);
			msg.setFrom(new InternetAddress(username));
			msg.setRecipients(Message.RecipientType.CC, 
	                  InternetAddress.parse(emailsDest));
			msg.setSubject("Alarma de caída de equipo: " + interfaceName);
			msg.setText("El equipo " + interfaceName + " se encuentra momentaneamente caído.\n"
						+ "Hora de la alarma: " + new Date() + "\n"
						+ "Muchas gracias.");
			msg.setSentDate(new Date());
			Transport.send(msg);
			
			System.out.println("Message to the administrators sent.");

      }catch (MessagingException mex) {
         mex.printStackTrace();
         return false;
      }
      
      return true;
   }
	
	
	
	private static Properties getMailProperties(){
		Properties props = new Properties();
		props.setProperty("mail.smtp.ssl.enable", "true");
		props.setProperty("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.auth", "true");
		props.put("mail.debug", "true");
		props.put("mail.store.protocol", "pop3");
		props.put("mail.transport.protocol", "smtp");
		return props;
	}
}