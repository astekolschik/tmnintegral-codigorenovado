/**
 * 
 */
package com.tmnintegral.domain;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * @author Agustina
 *
 */
@Entity
@Table(name="equipment_information") 
public class EquipmentInformation implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Id
    @Column(name = "equipment_id")
	private int equipment_id;
	@Id
	@Column(name = "timestamp")
	@Temporal(TemporalType.TIMESTAMP)
	private Date timestamp;
	private double memoria_disponible;
	private double memoria_utilizada;
	private double trafico_entrante;
	private double trafico_saliente;
	private double utilizacion_cpu;
	
	
	
	/**
	 * @param equipment_id
	 * @param timestamp
	 * @param memoria_disponible
	 * @param memoria_utilizada
	 * @param trafico_entrante
	 * @param trafico_saliente
	 * @param utilizacion_cpu
	 */
	public EquipmentInformation(int equipment_id, Date timestamp, double memoria_disponible, double memoria_utilizada,
			double trafico_entrante, double trafico_saliente, double utilizacion_cpu) {
		super();
		this.equipment_id = equipment_id;
		this.timestamp = timestamp;
		this.memoria_disponible = memoria_disponible;
		this.memoria_utilizada = memoria_utilizada;
		this.trafico_entrante = trafico_entrante;
		this.trafico_saliente = trafico_saliente;
		this.utilizacion_cpu = utilizacion_cpu;
	}
	
	/**
	 * Constructor
	 */
	public EquipmentInformation() {
		super();
	}
	
	
	/**
	 * @return the equipment_id
	 */
	public int getEquipment_id() {
		return equipment_id;
	}
	/**
	 * @param equipment_id the equipment_id to set
	 */
	public void setEquipment_id(int equipment_id) {
		this.equipment_id = equipment_id;
	}
	/**
	 * @return the timestamp
	 */
	public Date getTimestamp() {
		return timestamp;
	}
	/**
	 * @param timestamp the timestamp to set
	 */
	public void setTimestamp(Date timestamp) {
		this.timestamp = timestamp;
	}
	/**
	 * @return the memoria_disponible
	 */
	public double getMemoria_disponible() {
		return memoria_disponible;
	}
	/**
	 * @param memoria_disponible the memoria_disponible to set
	 */
	public void setMemoria_disponible(double memoria_disponible) {
		this.memoria_disponible = memoria_disponible;
	}
	/**
	 * @return the memoria_utilizada
	 */
	public double getMemoria_utilizada() {
		return memoria_utilizada;
	}
	/**
	 * @param memoria_utilizada the memoria_utilizada to set
	 */
	public void setMemoria_utilizada(double memoria_utilizada) {
		this.memoria_utilizada = memoria_utilizada;
	}
	/**
	 * @return the trafico_entrante
	 */
	public double getTrafico_entrante() {
		return trafico_entrante;
	}
	/**
	 * @param trafico_entrante the trafico_entrante to set
	 */
	public void setTrafico_entrante(double trafico_entrante) {
		this.trafico_entrante = trafico_entrante;
	}
	/**
	 * @return the trafico_saliente
	 */
	public double getTrafico_saliente() {
		return trafico_saliente;
	}
	/**
	 * @param trafico_saliente the trafico_saliente to set
	 */
	public void setTrafico_saliente(double trafico_saliente) {
		this.trafico_saliente = trafico_saliente;
	}
	/**
	 * @return the utilizacion_cpu
	 */
	public double getUtilizacion_cpu() {
		return utilizacion_cpu;
	}
	/**
	 * @param utilizacion_cpu the utilizacion_cpu to set
	 */
	public void setUtilizacion_cpu(double utilizacion_cpu) {
		this.utilizacion_cpu = utilizacion_cpu;
	}
	
	

}
