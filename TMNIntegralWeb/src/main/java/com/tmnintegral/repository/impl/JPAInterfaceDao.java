package com.tmnintegral.repository.impl;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.tmnintegral.domain.Interface;
import com.tmnintegral.domain.InterfaceStatus;
import com.tmnintegral.repository.InterfaceDao;

/**
 * @author Martín
 *
 */
@Repository(value = "InterfaceDao")
public class JPAInterfaceDao implements InterfaceDao{

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
	public Interface getInterface(int id) throws NoResultException{
    	Interface i = null;
    	try{
    		i = (Interface) em.createQuery("select i from Interface i where i.id = " + id).getSingleResult();
    	}catch(NoResultException e){
    		//log ("No se encontro el rol con id: " + roleId);
    	}
    	return i;
	}
    
    @Transactional(readOnly = true)
    @SuppressWarnings("unchecked")
	public Interface getInterface(String name) throws NoResultException{
    	Interface i = null;
    	try{
    		i = (Interface) em.createQuery("select i from Interface i where i.name = " + name).getSingleResult();
    	}catch(NoResultException e){
    		//log ("No se encontro el rol con id: " + roleId);
    	}
    	return i;
	}

    @Transactional(readOnly = true)
    @SuppressWarnings("unchecked")
	public List<Interface> getInterfaceList() {
		return em.createQuery("select i from Interface i order by i.id").getResultList();
	}

    @Transactional(readOnly = false)
    @SuppressWarnings("unchecked")
	public void saveInterface(Interface i) throws Exception {
    	if (this.getInterface(i.getId()) == null){
    		int id= (Integer) em.createQuery("select max(id) + 1 from Interface").getSingleResult();
    		i.setId(id);
    		em.merge(i);
    	}else{
    		throw new Exception("La Interface con ese id ya existe");
    	}
	}
    

    @Transactional(readOnly = false)
    @SuppressWarnings("unchecked")
	public void updateInterface(Interface i) {
		em.merge(i);
	}

    @Transactional(readOnly = false)
    @SuppressWarnings("unchecked")
	public void deleteInterface(Interface i) {
		em.remove(i);
	}

    @Transactional(readOnly = false)
    @SuppressWarnings("unchecked")
	public void deleteInterface(int id) {
		em.createQuery("delete from Interface i where i.id=" + id).executeUpdate();
	}
    
    @Transactional(readOnly = false)
    @SuppressWarnings("unchecked")
	public void deleteInterface(String name) {
		em.createQuery("delete from Interface i where i.name=" + name).executeUpdate();
	}

    @Transactional(readOnly = true)
    @SuppressWarnings("unchecked")
	public List<InterfaceStatus> getInterfacesDown() {
		return em.createQuery("select i from InterfaceStatus i where i.valor='down' order by i.id").getResultList();
	}

    @Transactional(readOnly = false)
    @SuppressWarnings("unchecked")
	public void updateInterfaceStatus(InterfaceStatus is) {
    	em.merge(is);
	}

    @Transactional(readOnly = true)
    @SuppressWarnings("unchecked")
	public List<InterfaceStatus> getInterfaceAlarmed() {
		return em.createQuery("select i from InterfaceStatus i where i.valor='down' order by i.id").getResultList();
	}
    
    @Transactional(readOnly = true)
    @SuppressWarnings("unchecked")
	public List<InterfaceStatus> getInterfaceAlarmedInTheLastHour() {
    	SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
    	Calendar cal = Calendar.getInstance();
    	cal.setTime(new Date());
    	cal.add(Calendar.HOUR, -1);
    	Date oneHourBack = cal.getTime();
		return em.createQuery("select i from InterfaceStatus i where i.valor='down' and last_update_state > " + sdf.format(oneHourBack)).getResultList();
	}

    @Transactional(readOnly = true)
    @SuppressWarnings("unchecked")
	public List<Interface> getInterfaceList(Integer id) {
		return em.createQuery("select i from Interface i where i.client.id=" + id + " order by i.id").getResultList();
	}

    @Transactional(readOnly = true)
    @SuppressWarnings("unchecked")
	public List<Interface> getInterfacesByDevice(int deviceId) {
    	return em.createQuery("select i from Interface i where i.device.device_id=" + deviceId + " order by i.id").getResultList();
	}

}
