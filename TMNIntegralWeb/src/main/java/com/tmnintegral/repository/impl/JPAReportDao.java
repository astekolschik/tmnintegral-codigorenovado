/**
 * 
 */
package com.tmnintegral.repository.impl;

import java.util.Date;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
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

}
