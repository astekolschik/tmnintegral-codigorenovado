/**
 * 
 */
package com.tmnintegral.repository;

import java.util.List;

import com.tmnintegral.domain.Command;
import com.tmnintegral.domain.CommandKey;

/**
 * @author Agustina
 *
 */
public interface CommandDao {

	public Command getCommand(int commandId);
	
	public List<Command> getCommandList(Integer clientid);
	
	public void deleteCommand(CommandKey commandKey);
	
	public void deleteCommand(int cId);

	public List<Object[]> getVariables();
	
}
