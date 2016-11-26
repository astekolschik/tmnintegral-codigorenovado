/**
 * 
 */
package com.tmnintegral.domain;

import java.io.Serializable;
import java.util.Set;

import javax.json.Json;
import javax.json.JsonObject;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;

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
	@Transient
	private String variableName;
	
	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn(name="idDevice")
	private Device device;
	
	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn(name="idInterface")
	private Interface interfaz;
	
	private String destination;
	
	private String elementName;
	
	private Integer umbral;

	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn(name="client_id")
	private Client client;
	
	@OneToMany(fetch = FetchType.EAGER, mappedBy="alarm", cascade= {CascadeType.PERSIST, CascadeType.MERGE})
	private Set<AlarmSent> alarmSents;

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
	 * @param elementName
	 * @param umbral
	 * @param client
	 */
	public Alarm(Integer id, Integer idVariable, Device device, Interface interfaz, String destination, Client client,
			String elementName, Integer umbral) {
		super();
		this.id = id;
		this.idVariable = idVariable;
		this.device = device;
		this.interfaz = interfaz;
		this.destination = destination;
		this.elementName = elementName;
		this.umbral = umbral;
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
			.add("variableName", this.getVariableName() != null ? this.getVariableName() : "")
			.add("idDevice", this.getDevice() != null ? String.valueOf(this.getDevice().getDevice_id()) : "")
			.add("deviceName", this.getDevice() != null ? this.getDevice().getHostName() : "")
			.add("idInterface", this.getInterfaz() != null ? String.valueOf(this.getInterfaz().getId()) : "")
			.add("interfaceName", this.getInterfaz() != null ? this.getInterfaz().getName() : "")
			.add("elementName", this.getElementName() != null ? this.getElementName() : "")
			.add("umbral", this.getUmbral() != null ? String.valueOf(this.getUmbral()) : "")
			.add("destinatarios", this.getDestination() != null ? this.getDestination() : "").build();
		return obj;
	}

	/**
	 * @return the elementName
	 */
	public String getElementName() {
		return elementName;
	}

	/**
	 * @param elementName the elementName to set
	 */
	public void setElementName(String elementName) {
		this.elementName = elementName;
	}

	public Integer getUmbral() {
		return umbral;
	}

	public void setUmbral(Integer umbral) {
		this.umbral = umbral;
	}

	/**
	 * @return the alarmSents
	 */
	public Set<AlarmSent> getAlarmSents() {
		return alarmSents;
	}

	/**
	 * @param alarmSents the alarmSents to set
	 */
	public void setAlarmSents(Set<AlarmSent> alarmSents) {
		this.alarmSents = alarmSents;
	}

	/**
	 * @return the variableName
	 */
	public String getVariableName() {
		return variableName;
	}

	/**
	 * @param variableName the variableName to set
	 */
	public void setVariableName(String variableName) {
		this.variableName = variableName;
	}
}
