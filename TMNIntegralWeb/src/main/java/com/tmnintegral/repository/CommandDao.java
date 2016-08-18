/**
 * 
 */
package com.tmnintegral.repository;

import java.util.List;

import com.tmnintegral.domain.Command;

/**
 * @author Agustina
 *
 */
public interface CommandDao {

	public Command getCommand(int commandId);
	
	public List<Command> getCommandList();
	
	public Command saveCommand(Command c) throws Exception;
	
	public void updateCommand(Command c);
	
	public void deleteCommand(Command c);
	
	public void deleteCommand(int cId);
	
}
