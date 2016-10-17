/**
 * 
 */
package com.tmnintegral.domain;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Embeddable;

/**
 * @author Agustina
 *
 */
@Embeddable
public class CommandKey implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 5529401371974057117L;
	
	@Column(name = "idVariable", nullable = false)
	private Integer idVariable;
	@Column(name = "idDeviceType", nullable = false)
	private Integer idDeviceType;
	@Column(name = "fieldName", nullable = false)
	private String fieldName;

	
	/**
	 *Constructor 
	 */
	public CommandKey() {
		super();
	}

	/**
	 * @param idVariable
	 * @param idDeviceType
	 * @param fieldName
	 */
	public CommandKey(Integer idVariable, Integer idDeviceType, String fieldName) {
		super();
		this.idVariable = idVariable;
		this.idDeviceType = idDeviceType;
		this.fieldName = fieldName;
	}
	/**
	 * @return the idVariable
	 */
	public Integer getIdVariable() {
		return idVariable;
	}
	/**
	 * @param idVariable the idVariable to set
	 */
	public void setIdVariable(Integer idVariable) {
		this.idVariable = idVariable;
	}
	/**
	 * @return the idDeviceType
	 */
	public Integer getIdDeviceType() {
		return idDeviceType;
	}
	/**
	 * @param idDeviceType the idDeviceType to set
	 */
	public void setIdDeviceType(Integer idDeviceType) {
		this.idDeviceType = idDeviceType;
	}
	/**
	 * @return the fieldName
	 */
	public String getFieldName() {
		return fieldName;
	}
	/**
	 * @param fieldName the fieldName to set
	 */
	public void setFieldName(String fieldName) {
		this.fieldName = fieldName;
	}

	/* (non-Javadoc)
	 * @see java.lang.Object#hashCode()
	 */
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((fieldName == null) ? 0 : fieldName.hashCode());
		result = prime * result + ((idDeviceType == null) ? 0 : idDeviceType.hashCode());
		result = prime * result + ((idVariable == null) ? 0 : idVariable.hashCode());
		return result;
	}

	/* (non-Javadoc)
	 * @see java.lang.Object#equals(java.lang.Object)
	 */
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (!(obj instanceof CommandKey))
			return false;
		CommandKey other = (CommandKey) obj;
		if (fieldName == null) {
			if (other.fieldName != null)
				return false;
		} else if (!fieldName.equals(other.fieldName))
			return false;
		if (idDeviceType == null) {
			if (other.idDeviceType != null)
				return false;
		} else if (!idDeviceType.equals(other.idDeviceType))
			return false;
		if (idVariable == null) {
			if (other.idVariable != null)
				return false;
		} else if (!idVariable.equals(other.idVariable))
			return false;
		return true;
	}
	
}
