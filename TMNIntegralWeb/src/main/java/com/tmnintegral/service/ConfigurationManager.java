/**
 * 
 */
package com.tmnintegral.service;

import java.io.Serializable;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.tmnintegral.domain.Command;
import com.tmnintegral.domain.TipoEquipo;
import com.tmnintegral.repository.CommandDao;

/**
 * @author Agustina
 *
 */
@Component
public class ConfigurationManager implements Serializable{

	private static final long serialVersionUID = 1L;

	@Autowired
	private CommandDao commandDao;

	/**
	 * @param commandDao the commandDao to set
	 */
	public void setCommandDao(CommandDao commandDao) {
		this.commandDao = commandDao;
	}
	
	/**
	 * Devuelve la lista de comandos
	 * @return
	 */
	public List<Command> getCommandList(){
		return this.commandDao.getCommandList();
	}
	
	/**
	 * Devuelve el comando seleccionado en el id
	 * @param commandid
	 * @return
	 */
	public Command getCommandById(int command){
		return this.commandDao.getCommand(command);
	}

	/**
	 * Modifica el objeto command
	 * @param commadId
	 * @param command
	 * @param commandType
	 */
	public void modificarComando(int commadId, String command, String commandType, String[] deviceTypes){
		Command c = this.getCommandById(commadId);
		if(c != null){
			if (!c.getCommand().equals(command))
				c.setCommand(command);
			if (!c.getCommand_type().equals(commandType))
				c.setCommand_type(commandType);
			
			c.setDeviceTypes(this.getTipoEquipos(deviceTypes));
			
			this.commandDao.updateCommand(c);
		}
	}

	/**
	 * Crea un nuevo comando
	 * @param nombreComando
	 * @param comando
	 * @param tipoComando
	 */
	public void crearComando(String nombreComando, String comando, String tipoComando, String[] deviceTypes) {
		Command c = new Command(null, nombreComando, comando, tipoComando);
		c.setDeviceTypes(this.getTipoEquipos(deviceTypes));
		try {
			this.commandDao.saveCommand(c);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}
	
	private Set<TipoEquipo> getTipoEquipos(String[] dt){
		Set<TipoEquipo> te = new HashSet<TipoEquipo>();
		if (dt != null){
			for (int i = 0; i < dt.length; i++){
				TipoEquipo t = new TipoEquipo();
				t.setId(Integer.valueOf(dt[i]));
				te.add(t);
			}
		}
		return te;
	}

	/**
	 * Elimina el comando seleccionado
	 * @param cId
	 */
	public void borrarComando(Integer cId) {
		this.commandDao.deleteCommand(cId);
	}
}