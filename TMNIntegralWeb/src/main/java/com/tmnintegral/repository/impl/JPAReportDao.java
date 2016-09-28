/**
 * 
 */
package com.tmnintegral.repository.impl;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.persistence.TemporalType;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.tmnintegral.domain.EquipmentInformation;
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
	
    /* (non-Javadoc)
	 * @see com.tmnintegral.repository.ReportDao#getAllEquipmentInformation(int)
	 */
    @Transactional(readOnly = true)
    @SuppressWarnings("unchecked")
	public List<EquipmentInformation> getAllEquipmentInformation(int eqId) {
    	return em.createQuery("select ei from EquipmentInformation ei "
    			+ "where ei.equipment_id=" + eqId
    			+ " order by ei.timestamp").getResultList();
	}

	/* (non-Javadoc)
	 * @see com.tmnintegral.repository.ReportDao#getEquipmentInformation(int, java.util.Date, java.util.Date)
	 */
    @Transactional(readOnly = true)
    @SuppressWarnings("unchecked")
	public List<EquipmentInformation> getEquipmentInformation(int eqId, Date from, Date to) {
    	return em.createQuery("select ei from EquipmentInformation ei "
    			+ "where ei.equipment_id=" + eqId
    			+ " and ei.timestamp >= :d1"
    			+ " and ei.timestamp <= :d2"
    			+ " order by ei.timestamp").setParameter("d1", from, TemporalType.TIMESTAMP).setParameter("d2", to, TemporalType.TIMESTAMP)
    				.getResultList();
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
					"select a.last_update_state, e.elementName, a.valor " +
							"from flt_interface_status a inner join variable b on a.idVariable=b.id " + 
							"							 inner join element e on a.elementName=e.elementAlias " +
							"where  	a.elementName = ( " +
							"			select concat(hostname, '_', ip) from device where device_id = " + equipmentList[i] + " ) " +
							"		and a.last_update_state between '" + sdf.format(dateFrom)+ "' and '" + sdf.format(dateTo) + "' " +  
							"		and b.id = " + tipoReporte + 
							" order by a.last_update_state, a.elementName"
					);
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
					"select a.last_update_state, e.elementName, a.valor " +
					" from flt_interface_status a inner join variable b on a.idVariable=b.id" + 
					"							inner join element e on a.elementName=e.elementAlias " +
					"	where  a.elementName = (select concat( " + 
					"	(select concat(ip, '_', hostName) from device where device_id=(select id_device from interface where id=" + interfacesList[i] + ")), " +
					"	'_', name) " + 
					" from interface where id=" + interfacesList[i] + ")" + 
					"		and a.last_update_state between '" + sdf.format(dateFrom)+ "' and '" + sdf.format(dateTo) + "' " +  
					"		and b.id = " + tipoReporte + 
					" order by a.last_update_state, a.elementName"
					);
			retList.addAll(q.getResultList());
		}
		
		return retList;
	}

}
