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
@Table(name="interface") 
public class Interface implements Serializable {
	
	private static final long serialVersionUID = 1L;

	@Id
    @Column(name = "id")
	private int id; 
	private String adminStatus;
	private String alias;
	private String name;
	private Integer shelf;
	private Integer slot;
	private Integer port;
	private Integer subPort;
	private String type;
	
	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn(name="id_device")
	private Device device;
	
	private Integer ifIndex;
	private String ipAdEntIfIndex;
	private String mac;
	private Integer ip_next_hop;
	private String mac_next_hop;
	private Date last_update_date;
	
	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn(name="client_id")
	private Client client;

	
	public Interface(){
		super();
	}
	

	public JsonObject toJSON(){
		JsonObject obj = Json.createObjectBuilder()
			.add("id", this.getId())
			.add("adminStatus", this.getAdminStatus() == null ? "" : this.getAdminStatus())
			.add("alias", this.getAlias() == null ? "" : this.getAlias())
			.add("name", this.getName() == null ? "" : this.getName())
			.add("shelf", this.getShelf() == null ? "" : this.getShelf().toString())
			.add("slot", this.getSlot() == null ? "" :  this.getSlot().toString())
			.add("port", this.getPort() == null ? "" : this.getPort().toString())
			.add("subport", this.getSubPort() == null ? "" :  this.getSubPort().toString())
			.add("type", this.getType() == null ? "" : this.getType())
			.add("id_device", this.getDevice() == null ? "" : String.valueOf(this.getDevice().getDevice_id()))
			.add("ifIndex", this.getIfIndex() == null ? "" : this.getIfIndex().toString())
			.add("ipAdEntIfIndex", this.getIpAdEntIfIndex() == null ? "" : this.getIpAdEntIfIndex())
			.add("mac", this.getMac() == null ? "" : this.getMac())
			.add("ip_next_hop", this.getIp_next_hop() == null ? "" : this.getIp_next_hop().toString())
			.add("mac_next_hop", this.getMac_next_hop() == null ? "" : this.getMac_next_hop())
			.add("last_update_date", this.getLast_update_date() == null ? "" : this.getLast_update_date().toGMTString()).build();
		return obj;
	}

	public Client getClient() {
		return client;
	}

	public void setClient(Client client) {
		this.client = client;
	}

	public void setShelf(Integer shelf) {
		this.shelf = shelf;
	}

	public void setSlot(Integer slot) {
		this.slot = slot;
	}

	public void setPort(Integer port) {
		this.port = port;
	}

	public void setSubPort(Integer subPort) {
		this.subPort = subPort;
	}


	public void setIfIndex(Integer ifIndex) {
		this.ifIndex = ifIndex;
	}

	public void setIp_next_hop(Integer ip_next_hop) {
		this.ip_next_hop = ip_next_hop;
	}


	/**
	 * @return the id
	 */
	public int getId() {
		return id;
	}


	/**
	 * @param id the id to set
	 */
	public void setId(int id) {
		this.id = id;
	}


	/**
	 * @return the adminStatus
	 */
	public String getAdminStatus() {
		return adminStatus;
	}


	/**
	 * @param adminStatus the adminStatus to set
	 */
	public void setAdminStatus(String adminStatus) {
		this.adminStatus = adminStatus;
	}


	/**
	 * @return the alias
	 */
	public String getAlias() {
		return alias;
	}


	/**
	 * @param alias the alias to set
	 */
	public void setAlias(String alias) {
		this.alias = alias;
	}


	/**
	 * @return the name
	 */
	public String getName() {
		return name;
	}


	/**
	 * @param name the name to set
	 */
	public void setName(String name) {
		this.name = name;
	}


	/**
	 * @return the type
	 */
	public String getType() {
		return type;
	}


	/**
	 * @param type the type to set
	 */
	public void setType(String type) {
		this.type = type;
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
	 * @return the ipAdEntIfIndex
	 */
	public String getIpAdEntIfIndex() {
		return ipAdEntIfIndex;
	}


	/**
	 * @param ipAdEntIfIndex the ipAdEntIfIndex to set
	 */
	public void setIpAdEntIfIndex(String ipAdEntIfIndex) {
		this.ipAdEntIfIndex = ipAdEntIfIndex;
	}


	/**
	 * @return the mac
	 */
	public String getMac() {
		return mac;
	}


	/**
	 * @param mac the mac to set
	 */
	public void setMac(String mac) {
		this.mac = mac;
	}


	/**
	 * @return the mac_next_hop
	 */
	public String getMac_next_hop() {
		return mac_next_hop;
	}


	/**
	 * @param mac_next_hop the mac_next_hop to set
	 */
	public void setMac_next_hop(String mac_next_hop) {
		this.mac_next_hop = mac_next_hop;
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


	/**
	 * @return the shelf
	 */
	public Integer getShelf() {
		return shelf;
	}


	/**
	 * @return the slot
	 */
	public Integer getSlot() {
		return slot;
	}


	/**
	 * @return the port
	 */
	public Integer getPort() {
		return port;
	}


	/**
	 * @return the subPort
	 */
	public Integer getSubPort() {
		return subPort;
	}


	/**
	 * @return the ifIndex
	 */
	public Integer getIfIndex() {
		return ifIndex;
	}


	/**
	 * @return the ip_next_hop
	 */
	public Integer getIp_next_hop() {
		return ip_next_hop;
	}
	
}