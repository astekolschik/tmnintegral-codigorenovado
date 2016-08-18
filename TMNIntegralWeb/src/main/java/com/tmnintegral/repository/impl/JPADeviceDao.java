package com.tmnintegral.repository.impl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.tmnintegral.domain.Device;
import com.tmnintegral.repository.DeviceDao;

/**
 * @author Agustina
 *
 */
@Repository(value = "DeviceDao")
public class JPADeviceDao implements DeviceDao{

	private EntityManager em = null;

    /*
     * Sets the entity manager.
     */
    @PersistenceContext
    public void setEntityManager(EntityManager em) {
        this.em = em;
    }
	
    @Transactional(readOnly = true)
    @SuppressWarnings("unchecked")
	public Device getDevice(int device_id) throws NoResultException{
    	Device d = null;
    	try{
    		d = (Device) em.createQuery("select d from Device d where d.device_id = " + device_id).getSingleResult();
    	}catch(NoResultException e){
    		//log ("No se encontro el rol con id: " + roleId);
    	}
    	return d;
	}
    
    @Transactional(readOnly = true)
    @SuppressWarnings("unchecked")
	public Device getDevice(String ip) throws NoResultException{
    	Device d = null;
    	try{
    		d = (Device) em.createQuery("select d from Device d where d.ip = " + ip).getSingleResult();
    	}catch(NoResultException e){
    		//log ("No se encontro el rol con id: " + roleId);
    	}
    	return d;
	}

    @Transactional(readOnly = true)
    @SuppressWarnings("unchecked")
	public List<Device> getDeviceList() {
		return em.createQuery("select d from Device d order by d.device_id").getResultList();
	}
    
    @Transactional(readOnly = true)
    @SuppressWarnings("unchecked")
	public List<Device> getDeviceList(Integer id) {
    	return em.createQuery("select d from Device d where d.client.id=" + id + " order by d.device_id").getResultList();
	}

    @Transactional(readOnly = false)
    @SuppressWarnings("unchecked")
	public void saveDevice(Device d) throws Exception {
    	if (this.getDevice(d.getDevice_id()) == null){
    		int device_id = (Integer) em.createQuery("select max(device_id) + 1 from Device").getSingleResult();
    		d.setDevice_id(device_id);
    		em.merge(d);
    	}else{
    		throw new Exception("El Device con ese id ya existe");
    	}
	}
    

    @Transactional(readOnly = false)
    @SuppressWarnings("unchecked")
	public void updateDevice(Device d) {
		em.merge(d);
	}

    @Transactional(readOnly = false)
    @SuppressWarnings("unchecked")
	public void deleteDevice(Device d) {
		em.remove(d);
	}

    @Transactional(readOnly = false)
    @SuppressWarnings("unchecked")
	public void deleteDevice(int id_device) {
		em.createQuery("delete from Device d where d.device_id=" + id_device).executeUpdate();
	}
    
    @Transactional(readOnly = false)
    @SuppressWarnings("unchecked")
	public void deleteDevice(String ip) {
		em.createQuery("delete from Device d where d.ip=" + ip).executeUpdate();
	}

}
