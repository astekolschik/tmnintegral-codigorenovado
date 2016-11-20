/**
 * 
 */
package com.tmnintegral.domain;

import java.io.Serializable;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * @author Agustina
 *
 */
@Entity
@Table(name="client") 
public class Client implements Serializable{


	/**
	 * 
	 */
	private static final long serialVersionUID = -4696093390191357610L;

	@Id
    @Column(name = "id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	
	private Integer client_id;
	private String name;

	@OneToMany(fetch = FetchType.EAGER, mappedBy="client", cascade= {CascadeType.PERSIST, CascadeType.MERGE})
	private Set<User> users;

	@OneToMany(fetch = FetchType.EAGER, mappedBy="client", cascade= {CascadeType.PERSIST, CascadeType.MERGE})
	private Set<Device> devices;

	@OneToMany(fetch = FetchType.EAGER, mappedBy="client", cascade= {CascadeType.PERSIST, CascadeType.MERGE})
	private Set<Interface> interfaces;

	@OneToMany(fetch = FetchType.EAGER, mappedBy="client", cascade= {CascadeType.PERSIST, CascadeType.MERGE})
	private Set<Red> redes;

	/**
	 * constructor
	 */
	public Client(){
		super();
	}
	
	
	/**
	 * Construcctor
	 * @param client_id
	 * @param name
	 */
	public Client(Integer client_id, String name) {
		super();
		this.client_id = client_id;
		this.name = name;
	}



	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getClient_id() {
		return client_id;
	}

	public void setClient_id(Integer client_id) {
		this.client_id = client_id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Set<User> getUsers() {
		return users;
	}

	public void setUsers(Set<User> users) {
		this.users = users;
	}

	public Set<Device> getDevices() {
		return devices;
	}

	public void setDevices(Set<Device> devices) {
		this.devices = devices;
	}

	public Set<Interface> getInterfaces() {
		return interfaces;
	}

	public void setInterfaces(Set<Interface> interfaces) {
		this.interfaces = interfaces;
	}

}