package com.tmnintegral.repository;

import java.util.List;

import javax.persistence.NoResultException;

import com.tmnintegral.domain.Device;

/**
 * @author Agustina
 *
 */
public interface DeviceDao {

	public Device getDevice(int id_device) throws NoResultException;
	
	public Device getDevice(String ip) throws NoResultException;
	
	public List<Device> getDeviceList();
	
	public List<Device> getDeviceList(Integer id);

	public void saveDevice(Device d) throws Exception;
	
	public void updateDevice(Device d);
	
	public void deleteDevice(Device d);
	
	public void deleteDevice(String ip);
	
	public void deleteDevice(int id_device);

	
}
