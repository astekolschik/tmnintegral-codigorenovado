package com.tmnintegral.repository;

import java.util.Date;
import java.util.List;

import com.tmnintegral.domain.EquipmentInformation;

/**
 * @author Agustina
 *
 */
public interface ReportDao {

	public List<EquipmentInformation> getAllEquipmentInformation(int eqId);
	
	public List<EquipmentInformation> getEquipmentInformation(int eqId, Date from, Date to);
	
}
