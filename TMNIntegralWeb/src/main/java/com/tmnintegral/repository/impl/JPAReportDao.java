/**
 * 
 */
package com.tmnintegral.repository.impl;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.tmnintegral.domain.Alarm;
import com.tmnintegral.domain.AlarmSent;
import com.tmnintegral.domain.InterfaceStatus;
import com.tmnintegral.repository.ReportDao;

/**
 * @author Agustina
 *
 */
@Repository(value = "reportDao")
public class JPAReportDao implements ReportDao {

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
	public List<Object[]> getReportNames() {
    	Query q = em.createNativeQuery("SELECT a.idVariable, a.reportName FROM variable_reportname a");
    	return q.getResultList();
	}

	@Transactional(readOnly = true)
    @SuppressWarnings("unchecked")
	public List<Object[]> getEquipmentInformationForReports(String tipoReporte, String[] equipmentList, Date dateFrom,
			Date dateTo) {
		
		List<Object[]> retList = new ArrayList<Object[]>();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		for (int i = 0; i < equipmentList.length; i++){
			Query q = em.createNativeQuery(
					"select a.last_update_state, a.elementName, a.valor " +
							"from flt_interface_status a " +
							"where  	a.elementName = '" + equipmentList[i] + "'" +
							"		and a.last_update_state between '" + sdf.format(dateFrom)+ "' and '" + sdf.format(dateTo) + "' " +  
							"		and a.idVariable = " + tipoReporte + 
							" order by a.last_update_state, a.elementName"
					);
//			Query q = em.createNativeQuery(
//					"select a.last_update_state, e.elementName, a.valor " +
//							"from flt_interface_status a inner join variable b on a.idVariable=b.id " + 
//							"							 inner join element e on a.elementName=e.elementAlias " +
//							"where  	a.elementName = ( " +
//							"			select concat(hostname, '_', ip) from device where device_id = " + equipmentList[i] + " ) " +
//							"		and a.last_update_state between '" + sdf.format(dateFrom)+ "' and '" + sdf.format(dateTo) + "' " +  
//							"		and b.id = " + tipoReporte + 
//							" order by a.last_update_state, a.elementName"
//					);
			
			retList.addAll(q.getResultList());
		}
		
		return retList;
	}

	@Transactional(readOnly = true)
    @SuppressWarnings("unchecked")
	public List<Object[]> getInterfaceInformationForReports(String tipoReporte, String[] interfacesList, Date dateFrom,
			Date dateTo) {
		List<Object[]> retList = new ArrayList<Object[]>();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		for (int i = 0; i < interfacesList.length; i++){
			Query q = em.createNativeQuery(
					"select a.last_update_state, a.elementName, a.valor " +
							"from flt_interface_status a " +
							"where  	a.elementName = '" + interfacesList[i] + "'" +
							"		and a.last_update_state between '" + sdf.format(dateFrom)+ "' and '" + sdf.format(dateTo) + "' " +  
							"		and a.idVariable = " + tipoReporte + 
							" order by a.last_update_state, a.elementName"
					);
//			Query q = em.createNativeQuery(
//					"select a.last_update_state, e.elementName, a.valor " +
//					" from flt_interface_status a inner join variable b on a.idVariable=b.id" + 
//					"							inner join element e on a.elementName=e.elementAlias " +
//					"	where  a.elementName = (select concat( " + 
//					"	(select concat(ip, '_', hostName) from device where device_id=(select id_device from interface where id=" + interfacesList[i] + ")), " +
//					"	'_', name) " + 
//					" from interface where id=" + interfacesList[i] + ")" + 
//					"		and a.last_update_state between '" + sdf.format(dateFrom)+ "' and '" + sdf.format(dateTo) + "' " +  
//					"		and b.id = " + tipoReporte + 
//					" order by a.last_update_state, a.elementName"
//					);
			
			retList.addAll(q.getResultList());
		}
		
		return retList;
	}

	@Transactional(readOnly = true)
    @SuppressWarnings("unchecked")
	public List<Alarm> getAlarmsConfigured(Integer clientId) {
		return em.createQuery("select a from Alarm a where a.client.id=" + clientId).getResultList();
	}

	@Transactional(readOnly = false)
    @SuppressWarnings("unchecked")
	public void deleteAlarm(Integer id) {
		em.createQuery("delete from Alarm a where a.id=" + id).executeUpdate();
	}

	@Transactional(readOnly = false)
    @SuppressWarnings("unchecked")
	public void saveAlarm(Alarm alarm) {
		em.merge(alarm);
	}

	@Transactional(readOnly = true)
    @SuppressWarnings("unchecked")
	public Alarm getAlarm(int alarmId) {
		Alarm alarm = null;
    	try{
    		alarm = (Alarm) em.createQuery(
    				"select a from Alarm a where a.id=" + alarmId).getSingleResult();
    	}catch(NoResultException e){
    		//log ("No se encontro el usuario con id: " + userId);
    	}
    	return alarm;
	}

	@Transactional(readOnly = true)
    @SuppressWarnings("unchecked")
	public List<Alarm> getAlarmsConfigured() {
		return em.createQuery("select a from Alarm a").getResultList();
	}

	@Transactional(readOnly = true)
    @SuppressWarnings("unchecked")
	public List<InterfaceStatus> getStatus(int variableId, String elementName){
		return em.createQuery("select i from InterfaceStatus i"
				+ " where i.idVariable=" + variableId + " and i.elementName='" + elementName + "'"
				+ " order by i.last_update_state desc"
				+ " ").setMaxResults(3).getResultList();
	}

	@Transactional(readOnly = true)
    @SuppressWarnings("unchecked")
	public List<Object[]> getDevicesDown() {
		return em.createNativeQuery(
				"select concat(concat(d.ip, \"_\"),d.hostname) as \"elementName\", d.client_id from device d "
						+ "where \"test\" in (select a.elementName from (select f.elementName, sum(f.valor) as \"suma\" "
						+ "from flt_interface_status f " 
						+ "where \"suma\"=0 "
						+ "group by f.idVariable, f.elementName "
						+ "order by f.last_update_state desc "
						+ ") a)"
				).setMaxResults(3).getResultList();
	}

	@Transactional(readOnly = true)
    @SuppressWarnings("unchecked")
	public List<Object[]> getInterfacesDown() {
		//TODO review
		return em.createNativeQuery(
				"select concat(concat(d.ip, \"_\"),d.hostname) as \"elementName\", d.client_id from device d "
						+ "where \"test\" in (select a.elementName from (select f.elementName, sum(f.valor) as \"suma\" "
						+ "from flt_interface_status f " 
						+ "where \"suma\"=0 "
						+ "group by f.idVariable, f.elementName "
						+ "order by f.last_update_state desc "
						+ ") a)"
				).setMaxResults(3).getResultList();
	}

	@Transactional(readOnly = true)
    @SuppressWarnings("unchecked")
	public List<AlarmSent> getAlarmsInTheLastHour() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String eDate = sdf.format(new Date());
		Calendar cal = Calendar.getInstance();
		cal.setTime(new Date());
		cal.add(Calendar.HOUR, -1);
		String sDate = sdf.format(cal.getTime());
		return em.createQuery("select a from AlarmSent a where a.datesent between '"
				+ sDate
				+ "' and '" + eDate + "'").getResultList();
	}

	@Transactional(readOnly = true)
    @SuppressWarnings("unchecked")
	public List<AlarmSent> getAlarmsSent() {
		return em.createQuery("select a from AlarmSent a order by a.datesent desc").setMaxResults(10).getResultList();
	}

	@Transactional(readOnly = false)
    @SuppressWarnings("unchecked")
	public void saveAlarmSent(AlarmSent is) {
		em.merge(is);
	}
	
}
