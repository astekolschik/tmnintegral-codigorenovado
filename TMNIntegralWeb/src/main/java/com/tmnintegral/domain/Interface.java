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
	private Integer id_device;  //en la base de datos tiene un id device//
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
	

	/**
	 * 
	 * @param id
	 * @param adminStatus
	 * @param alias
	 * @param name
	 * @param shelf
	 * @param slot
	 * @param port
	 * @param subPort
	 * @param type
	 * @param id_device
	 * @param ifIndex
	 * @param ipAdEntIfIndex
	 * @param mac
	 * @param ip_next_hop
	 * @param mac_next_hop
	 * @param last_update_date
	 * @param client
	 */
	public Interface(int id, String adminStatus, String alias, String name, Integer shelf, Integer slot, Integer port,
			Integer subPort, String type, Integer id_device, Integer ifIndex, String ipAdEntIfIndex, String mac,
			Integer ip_next_hop, String mac_next_hop, Date last_update_date, Client client) {
		super();
		this.id = id;
		this.adminStatus = adminStatus;
		this.alias = alias;
		this.name = name;
		this.shelf = shelf;
		this.slot = slot;
		this.port = port;
		this.subPort = subPort;
		this.type = type;
		this.id_device = id_device;
		this.ifIndex = ifIndex;
		this.ipAdEntIfIndex = ipAdEntIfIndex;
		this.mac = mac;
		this.ip_next_hop = ip_next_hop;
		this.mac_next_hop = mac_next_hop;
		this.last_update_date = last_update_date;
		this.client = client;
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
		return adminStatus==null?"":adminStatus;
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
		return alias==null?"":alias;
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
		return name==null?"":name;
	}

	/**
	 * @param name the name to set
	 */
	public void setName(String name) {
		this.name = name;
	}

	/**
	 * @return the shelf
	 */
	public Integer getShelf() {
		return shelf;
	}

	/**
	 * @param shelf the shelf to set
	 */
	public void setShelf(int shelf) {
		this.shelf = shelf;
	}

	/**
	 * @return the slot
	 */
	public Integer getSlot() {
		return slot;
	}

	/**
	 * @param slot the slot to set
	 */
	public void setSlot(int slot) {
		this.slot = slot;
	}

	/**
	 * @return the port
	 */
	public Integer getPort() {
		return port;
	}

	/**
	 * @param port the port to set
	 */
	public void setPort(int port) {
		this.port = port;
	}

	/**
	 * @return the subPort
	 */
	public Integer getSubPort() {
		return subPort;
	}

	/**
	 * @param subPort the subPort to set
	 */
	public void setSubPort(int subPort) {
		this.subPort = subPort;
	}

	/**
	 * @return the type
	 */
	public String getType() {
		return type==null?"":type;
	}

	/**
	 * @param type the type to set
	 */
	public void setType(String type) {
		this.type = type;
	}

	/**
	 * @return the id_device
	 */
	public Integer getId_device() {
		return id_device;
	}

	/**
	 * @param id_device the id_device to set
	 */
	public void setId_device(int id_device) {
		this.id_device = id_device;
	}


	/**
	 * @return the ipAdEntIfIndex
	 */
	public String getIpAdEntIfIndex() {
		return ipAdEntIfIndex==null?"":ipAdEntIfIndex;
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
		return mac==null?"":mac;
	}

	/**
	 * @param mac the mac to set
	 */
	public void setMac(String mac) {
		this.mac = mac;
	}

	/**
	 * @return the ip_next_hop
	 */
	public Integer getIp_next_hop() {
		return ip_next_hop;
	}

	/**
	 * @param ip_next_hop the ip_next_hop to set
	 */
	public void setIp_next_hop(int ip_next_hop) {
		this.ip_next_hop = ip_next_hop;
	}

	/**
	 * @return the mac_next_hop
	 */
	public String getMac_next_hop() {
		return mac_next_hop==null?"":mac_next_hop;
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
	 * @return the ifIndex
	 */
	public Integer getIfIndex() {
		return ifIndex;
	}



	/**
	 * @param ifIndex the ifIndex to set
	 */
	public void setIfIndex(int ifIndex) {
		this.ifIndex = ifIndex;
	}

	
	/*private String adminStatus;
	private String alias;
	private String name;
	private Integer shelf;
	private Integer slot;
	private Integer port;
	private Integer subPort;
	private String type;
	private Integer id_device;  //en la base de datos tiene un id device//
	private Integer ifIndex;
	private String ipAdEntIfIndex;
	private String mac;
	private Integer ip_next_hop;
	private String mac_next_hop;
	private Date last_update_date;*/
	
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
			.add("id_device", this.getId_device() == null ? "" : this.getId_device().toString())
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

	public void setId_device(Integer id_device) {
		this.id_device = id_device;
	}

	public void setIfIndex(Integer ifIndex) {
		this.ifIndex = ifIndex;
	}

	public void setIp_next_hop(Integer ip_next_hop) {
		this.ip_next_hop = ip_next_hop;
	}
	
}