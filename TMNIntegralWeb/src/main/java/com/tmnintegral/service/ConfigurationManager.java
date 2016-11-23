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
	 * @param fieldname 
	 * @param te 
	 * @param commandid
	 * @return
	 */
	public Command getCommandById(int varid, int te, String fieldname){
		return this.commandDao.getCommand(varid, te, fieldname);
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

	public void crearComando(Command newCommand) {
		this.commandDao.crearComando(newCommand);		
	}

	/**
	 * 
	 * @param idVariable
	 * @param idTipoEquipo
	 * @param fieldName
	 * @param type
	 * @param regex
	 * @param operation
	 * @param isDevice
	 */
	public void actualizarComando(Integer idVariable, Integer idTipoEquipo, String fieldName, String type, String regex,
			String operation, String isDevice) {
		Command oldCommand = this.getCommandById(idVariable, idTipoEquipo, fieldName);
		if (oldCommand.getType() != null && oldCommand.getType() != type)
			oldCommand.setType(type);
		if (oldCommand.getRegex() != null && oldCommand.getRegex() != regex)
			oldCommand.setRegex(regex);
		if (oldCommand.getOperation() != null && oldCommand.getOperation() != operation)
			oldCommand.setOperation(operation);
		if (oldCommand.getIs_device() != null && oldCommand.getIs_device() != isDevice)
			oldCommand.setIs_device(isDevice);
		
		this.commandDao.updateComando(oldCommand);
	}
}