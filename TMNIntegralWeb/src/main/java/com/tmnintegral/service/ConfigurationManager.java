/**
 * 
 */
package com.tmnintegral.service;

import java.io.Serializable;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.tmnintegral.domain.Command;
import com.tmnintegral.domain.CommandKey;
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
	 * @param clientid 
	 * @return
	 */
	public List<Command> getCommandList(Integer clientid){
		return this.commandDao.getCommandList(clientid);
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
	 * Elimina el comando seleccionado
	 * @param commandKey
	 */
	public void borrarComando(CommandKey commandKey) {
		this.commandDao.deleteCommand(commandKey);
	}

	public List<Object[]> getVariablesList() {
		return this.commandDao.getVariables();
	}
}