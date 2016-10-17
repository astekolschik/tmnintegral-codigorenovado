package com.tmnintegral.domain;

import java.io.Serializable;
import java.util.Date;
import java.util.Set;

import javax.json.Json;
import javax.json.JsonObject;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * @author Usuario
 *
 */
@Entity
@Table(name="device") 
public class Device implements Serializable {
	
	private static final long serialVersionUID = 1L;

	@Id
    @Column(name = "id")
	private int device_id; 
	private String communityRead;
	private String hostName;
	private String iosType;
	private String iosVersion;
	private String ip;
	private String model;
	private String serialNumber;
	private String softwareRelease;
	
	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn(name="id_device_type")
	private TipoEquipo tipoEquipo;
	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn(name="id_network")
	private Red red;

	private String enable;
	private Date last_update_date;
	
	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn(name="client_id")
	private Client client;
	
	@OneToMany(fetch = FetchType.EAGER, mappedBy="device", cascade= {CascadeType.PERSIST, CascadeType.MERGE})
	private Set<Interface> interfaces;
	
	public Device(){
		super();
	}
	
	public Device(int idDev){
		super();
		this.device_id = idDev;
	}
	

	/**
	 * @param device_id
	 * @param communityRead
	 * @param hostName
	 * @param iosType
	 * @param iosVersion
	 * @param ip
	 * @param model
	 * @param serialNumber
	 * @param softwareRelease
	 * @param tipoEquipo
	 * @param red
	 * @param enable
	 * @param last_update_date
	 * @param client
	 * @param interfaces
	 */
	public Device(int device_id, String communityRead, String hostName, String iosType, String iosVersion, String ip,
			String model, String serialNumber, String softwareRelease, TipoEquipo tipoEquipo, Red red, String enable,
			Date last_update_date, Client client, Set<Interface> interfaces) {
		super();
		this.device_id = device_id;
		this.communityRead = communityRead;
		this.hostName = hostName;
		this.iosType = iosType;
		this.iosVersion = iosVersion;
		this.ip = ip;
		this.model = model;
		this.serialNumber = serialNumber;
		this.softwareRelease = softwareRelease;
		this.tipoEquipo = tipoEquipo;
		this.red = red;
		this.enable = enable;
		this.last_update_date = last_update_date;
		this.client = client;
		this.interfaces = interfaces;
	}

	public JsonObject toJSON(){
		JsonObject obj = Json.createObjectBuilder()
			.add("device_id", this.getDevice_id())
			.add("communityRead", this.getCommunityRead())
			.add("hostName", this.getHostName())
			.add("iosType", this.getIosType())
			.add("iosVersion", this.getIosVersion())
			.add("ip", this.getIp())
			.add("model", this.getModel())
			.add("serialNumber", this.getSerialNumber())
			.add("softwareRelease", this.getSoftwareRelease())
			.add("id_device_type", this.getTipoEquipo() == null ? "" : String.valueOf(this.getTipoEquipo().getId()))
			.add("id_network", this.getRed() == null ? "" : String.valueOf(this.getRed().getId_network()))
			.add("enable", this.getEnable())
			.add("last_update_date", this.getLast_update_date() != null ? this.getLast_update_date().toGMTString() : "").build();
		return obj;
	}


	public Client getClient() {
		return client;
	}


	public void setClient(Client client) {
		this.client = client;
	}




	/**
	 * @return the device_id
	 */
	public int getDevice_id() {
		return device_id;
	}




	/**
	 * @param device_id the device_id to set
	 */
	public void setDevice_id(int device_id) {
		this.device_id = device_id;
	}




	/**
	 * @return the communityRead
	 */
	public String getCommunityRead() {
		return communityRead;
	}




	/**
	 * @param communityRead the communityRead to set
	 */
	public void setCommunityRead(String communityRead) {
		this.communityRead = communityRead;
	}




	/**
	 * @return the hostName
	 */
	public String getHostName() {
		return hostName;
	}




	/**
	 * @param hostName the hostName to set
	 */
	public void setHostName(String hostName) {
		this.hostName = hostName;
	}




	/**
	 * @return the iosType
	 */
	public String getIosType() {
		return iosType;
	}




	/**
	 * @param iosType the iosType to set
	 */
	public void setIosType(String iosType) {
		this.iosType = iosType;
	}




	/**
	 * @return the iosVersion
	 */
	public String getIosVersion() {
		return iosVersion;
	}




	/**
	 * @param iosVersion the iosVersion to set
	 */
	public void setIosVersion(String iosVersion) {
		this.iosVersion = iosVersion;
	}




	/**
	 * @return the ip
	 */
	public String getIp() {
		return ip;
	}




	/**
	 * @param ip the ip to set
	 */
	public void setIp(String ip) {
		this.ip = ip;
	}




	/**
	 * @return the model
	 */
	public String getModel() {
		return model;
	}




	/**
	 * @param model the model to set
	 */
	public void setModel(String model) {
		this.model = model;
	}




	/**
	 * @return the serialNumber
	 */
	public String getSerialNumber() {
		return serialNumber;
	}




	/**
	 * @param serialNumber the serialNumber to set
	 */
	public void setSerialNumber(String serialNumber) {
		this.serialNumber = serialNumber;
	}




	/**
	 * @return the softwareRelease
	 */
	public String getSoftwareRelease() {
		return softwareRelease;
	}




	/**
	 * @param softwareRelease the softwareRelease to set
	 */
	public void setSoftwareRelease(String softwareRelease) {
		this.softwareRelease = softwareRelease;
	}




	/**
	 * @return the tipoEquipo
	 */
	public TipoEquipo getTipoEquipo() {
		return tipoEquipo;
	}




	/**
	 * @param tipoEquipo the tipoEquipo to set
	 */
	public void setTipoEquipo(TipoEquipo tipoEquipo) {
		this.tipoEquipo = tipoEquipo;
	}




	/**
	 * @return the red
	 */
	public Red getRed() {
		return red;
	}




	/**
	 * @param red the red to set
	 */
	public void setRed(Red red) {
		this.red = red;
	}




	/**
	 * @return the enable
	 */
	public String getEnable() {
		return enable;
	}




	/**
	 * @param enable the enable to set
	 */
	public void setEnable(String enable) {
		this.enable = enable;
	}




	/**
	 * @return the last_update_date
	 */
	public Date getLast_update_date() {
		return last_update_date;
	}




	/**
	 * @param last_update_date the last_update_date to set
	 */
	public void setLast_update_date(Date last_update_date) {
		this.last_update_date = last_update_date;
	}
}