/**
 * 
 */
package com.tmnintegral.repository;

import java.util.List;

import com.tmnintegral.domain.Client;
import com.tmnintegral.domain.User;

/**
 * @author Agustina
 *
 */
public interface UserDao {

	public User getUser(int userId);
	
	public User getUser(String username);
	
	public List<User> getUsersList();
	
	public void saveUser(User u) throws Exception;
	
	public void updateUser(User u);
	
	public void deleteUser(User u);
	
	public void deleteUser(int userId);
	
	public void deleteUser(String username);
	
	public List<User> getAdministratorUsers();

	public List<User> getUsersList(int clientId);
	
	public List<Client> getClientList();

	public List<User> getDisabledUserList(Integer clientId);

	public void updateUserImgPath(User user);
	
	public List<User> getAdminEmails(int client);
	
}
