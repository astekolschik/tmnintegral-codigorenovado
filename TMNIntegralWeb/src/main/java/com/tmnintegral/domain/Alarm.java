/**
 * 
 */
package com.tmnintegral.domain;

import java.io.Serializable;

import javax.json.Json;
import javax.json.JsonObject;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * @author Agustina
 *
 */
@Entity
@Table(name="alarms")
public class Alarm implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -5779099993846766851L;

	@Id
    @Column(name = "id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	
	private Integer idVariable;
	
	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn(name="idDevice")
	private Device device;
	
	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn(name="idInterface")
	private Interface interfaz;
	
	private String destination;

	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn(name="client_id")
	private Client client;
	
	/**
	 * 
	 */
	public Alarm() {
		super();
	}

	/**
	 * @param id
	 * @param idVariable
	 * @param device
	 * @param interfaz
	 * @param destination
	 * @param client
	 */
	public Alarm(Integer id, Integer idVariable, Device device, Interface interfaz, String destination, Client client) {
		super();
		this.id = id;
		this.idVariable = idVariable;
		this.device = device;
		this.interfaz = interfaz;
		this.destination = destination;
		this.client = client;
	}

	/**
	 * @return the id
	 */
	public Integer getId() {
		return id;
	}

	/**
	 * @param id the id to set
	 */
	public void setId(Integer id) {
		this.id = id;
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
	 * @return the device
	 */
	public Device getDevice() {
		return device;
	}

	/**
	 * @param device the device to set
	 */
	public void setDevice(Device device) {
		this.device = device;
	}

	/**
	 * @return the interfaz
	 */
	public Interface getInterfaz() {
		return interfaz;
	}

	/**
	 * @param interfaz the interfaz to set
	 */
	public void setInterfaz(Interface interfaz) {
		this.interfaz = interfaz;
	}

	/**
	 * @return the destination
	 */
	public String getDestination() {
		return destination;
	}

	/**
	 * @param destination the destination to set
	 */
	public void setDestination(String destination) {
		this.destination = destination;
	}

	/**
	 * @return the client
	 */
	public Client getClient() {
		return client;
	}

	/**
	 * @param client the client to set
	 */
	public void setClient(Client client) {
		this.client = client;
	}

	public JsonObject toJSON(){
		JsonObject obj = Json.createObjectBuilder()
			.add("idVariable", this.getIdVariable() != null ? this.getIdVariable().toString() : "")
			.add("idDevice", this.getDevice() != null ? String.valueOf(this.getDevice().getDevice_id()) : "")
			.add("deviceName", this.getDevice() != null ? this.getDevice().getHostName() : "")
			.add("idInterface", this.getInterfaz() != null ? String.valueOf(this.getInterfaz().getId()) : "")
			.add("interfaceName", this.getInterfaz() != null ? this.getInterfaz().getName() : "")
			.add("destinatarios", this.getDestination() != null ? this.getDestination() : "").build();
		return obj;
	}
}
