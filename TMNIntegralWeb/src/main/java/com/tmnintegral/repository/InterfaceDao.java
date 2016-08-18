package com.tmnintegral.repository;

import java.util.List;

import javax.persistence.NoResultException;

import com.tmnintegral.domain.Interface;
import com.tmnintegral.domain.InterfaceStatus;

/**
 * @author Martín
 *
 */
public interface InterfaceDao {

	public Interface getInterface(int id) throws NoResultException;
	
	public Interface getInterface(String name) throws NoResultException;
	
	public List<Interface> getInterfaceList();
	
	public List<Interface> getInterfaceList(Integer id);
	
	public void saveInterface(Interface i) throws Exception;
	
	public void updateInterface(Interface i);
	
	public void deleteInterface(Interface i);
	
	public void deleteInterface(String name);
	
	public void deleteInterface(int id);
	
	public List<InterfaceStatus> getInterfacesDown();
	
	public void updateInterfaceStatus(InterfaceStatus is);
	
	public List<InterfaceStatus> getInterfaceAlarmed();
	
	public List<InterfaceStatus> getInterfaceAlarmedInTheLastHour();

}
