package com.tmnintegral.domain;

import java.io.Serializable;
import java.util.Date;

import javax.json.Json;
import javax.json.JsonObject;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
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
    @Column(name = "device_id")
	private int device_id; 
	private String communityRead;
	private String hostName;
	private String iosType;
	private String iosVersion;
	private String ip;
	private String model;
	private String serialNumber;
	private String softwareRelease;
	private Integer id_device_type;
	private Integer id_network;
	private Integer id_configuration;
	private Integer id_equipment_info;
	private String enable;
	private Date last_update_date;
	
	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn(name="client_id")
	private Client client;
	
	
	public Device(){
		super();
	}
	

	/**
	 * Constructor
	 * @param device_id
	 * @param communityRead
	 * @param hostName
	 * @param iosType
	 * @param iosVersion
	 * @param ip
	 * @param model
	 * @param serialNumber
	 * @param softwareRelease
	 * @param id_device_type
	 * @param id_network
	 * @param id_configuration
	 * @param id_equipment_info
	 * @param id_interface
	 * @param enable
	 * @param last_update_date
	 */
	public Device(int device_id, String communityRead, String hostName, String iosType, String iosVersion, String ip,
			String model, String serialNumber, String softwareRelease, Integer id_device_type, Integer id_network,
			Integer id_configuration, Integer id_equipment_info, String enable,
			Date last_update_date, Client client) {
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
		this.id_device_type = id_device_type;
		this.id_network = id_network;
		this.id_configuration = id_configuration;
		this.id_equipment_info = id_equipment_info;
		this.enable = enable;
		this.last_update_date = last_update_date;
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
	 * @return the id_device_type
	 */
	public Integer getId_device_type() {
		return id_device_type;
	}



	/**
	 * @param id_device_type the id_device_type to set
	 */
	public void setId_device_type(Integer id_device_type) {
		this.id_device_type = id_device_type;
	}



	/**
	 * @return the id_network
	 */
	public Integer getId_network() {
		return id_network;
	}



	/**
	 * @param id_network the id_network to set
	 */
	public void setId_network(Integer id_network) {
		this.id_network = id_network;
	}



	/**
	 * @return the id_configuration
	 */
	public Integer getId_configuration() {
		return id_configuration;
	}



	/**
	 * @param id_configuration the id_configuration to set
	 */
	public void setId_configuration(Integer id_configuration) {
		this.id_configuration = id_configuration;
	}



	/**
	 * @return the id_equipment_info
	 */
	public Integer getId_equipment_info() {
		return id_equipment_info;
	}



	/**
	 * @param id_equipment_info the id_equipment_info to set
	 */
	public void setId_equipment_info(Integer id_equipment_info) {
		this.id_equipment_info = id_equipment_info;
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
			.add("id_device_type", this.getId_device_type() == null ? "" : this.getId_device_type().toString())
			.add("id_network", this.getId_network() == null ? "" : this.getId_network().toString())
			.add("id_configuration", this.getId_configuration()  == null ? "" : this.getId_configuration().toString())
			.add("id_equipment_info", this.getId_equipment_info() == null ? "" : this.getId_equipment_info().toString())
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
}