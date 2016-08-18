/**
 * 
 */
package com.tmnintegral.domain;

import java.io.Serializable;
import java.util.Set;

import javax.json.Json;
import javax.json.JsonObject;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

/**
 * @author AGustina
 *
 */
@Entity
@Table(name="device_type") 
public class TipoEquipo implements Serializable{

	private static final long serialVersionUID = 1L;

	@Id
    @Column(name = "id")
	private int id; 
	
	private String description;
	private String default_comm_read;
	private String default_snmp_version;
	private String driver; 
	private String technology;
	private String vendor;
	
	@ManyToMany(mappedBy="deviceTypes")
	private Set<Command> commands;
	
	public TipoEquipo(){
		super();
	}
	
	public TipoEquipo(int id, String description, String default_comm_read, String default_snmp_version, String driver, String technology,
			String vendor) {
		super();
		this.id = id;
		this.description = description;
		this.default_comm_read = default_comm_read;
		this.default_snmp_version = default_snmp_version;
		this.driver = driver;
		this.technology = technology;
		this.vendor = vendor;
	}
	/**
	 * @return the default_comm_read
	 */
	public String getDefault_comm_read() {
		return default_comm_read;
	}
	/**
	 * @param default_comm_read the default_comm_read to set
	 */
	public void setDefault_comm_read(String default_comm_read) {
		this.default_comm_read = default_comm_read;
	}
	/**
	 * @return the default_snmp_version
	 */
	public String getDefault_snmp_version() {
		return default_snmp_version;
	}
	/**
	 * @param default_snmp_version the default_snmp_version to set
	 */
	public void setDefault_snmp_version(String default_snmp_version) {
		this.default_snmp_version = default_snmp_version;
	}
	/**
	 * @return the driver
	 */
	public String getDriver() {
		return driver;
	}
	/**
	 * @param driver the driver to set
	 */
	public void setDriver(String driver) {
		this.driver = driver;
	}
	/**
	 * @return the technology
	 */
	public String getTechnology() {
		return technology;
	}
	/**
	 * @param technology the technology to set
	 */
	public void setTechnology(String technology) {
		this.technology = technology;
	}
	/**
	 * @return the vendor
	 */
	public String getVendor() {
		return vendor;
	}
	/**
	 * @param vendor the vendor to set
	 */
	public void setVendor(String vendor) {
		this.vendor = vendor;
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
	 * @return the commands
	 */
	public Set<Command> getCommands() {
		return commands;
	}

	/**
	 * @param commands the commands to set
	 */
	public void setCommands(Set<Command> commands) {
		this.commands = commands;
	}

	/**
	 * @return the description
	 */
	public String getDescription() {
		return description;
	}

	/**
	 * @param description the description to set
	 */
	public void setDescription(String description) {
		this.description = description;
	}

	public JsonObject toJSON(){
		JsonObject obj = Json.createObjectBuilder()
			.add("id", this.getId())
			.add("descripcion", this.getDescription())
			.add("defaultComm", this.getDefault_comm_read())
			.add("defaultSNMP", this.getDefault_snmp_version())
			.add("driver", this.getDriver())
			.add("technology", this.getTechnology())
			.add("vendor", this.getVendor()).build();
		return obj;
	}
}
