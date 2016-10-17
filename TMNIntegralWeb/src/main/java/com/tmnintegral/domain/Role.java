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
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * @author Usuario
 *
 */
@Entity
@Table(name="role") 
public class Role implements Serializable {
	
	private static final long serialVersionUID = 1L;

	@Id
    @Column(name = "role_id")
	private int role_id; 

	private String role_name;
	private boolean allow_create;
	private boolean allow_delete;
	private boolean allow_update;
	private boolean allow_reports;

	@OneToMany(fetch = FetchType.EAGER, mappedBy="role", cascade= {CascadeType.PERSIST, CascadeType.MERGE})
	private Set<User> users;

	
	public Role(){
		super();
	}
	
	public Role(int id, String name, boolean allowCreate, boolean allowDelete, boolean allowUpdate,
			boolean allowReports) {
		super();
		this.role_id = id;
		this.role_name = name;
		this.allow_create = allowCreate;
		this.allow_delete = allowDelete;
		this.allow_update = allowUpdate;
		this.allow_reports = allowReports;
	}

	/**
	 * @return the role_id
	 */
	public int getRole_id() {
		return role_id;
	}

	/**
	 * @param role_id the role_id to set
	 */
	public void setRole_id(int role_id) {
		this.role_id = role_id;
	}

	/**
	 * @return the role_name
	 */
	public String getRole_name() {
		return role_name;
	}

	/**
	 * @param role_name the role_name to set
	 */
	public void setRole_name(String role_name) {
		this.role_name = role_name;
	}

	/**
	 * @return the allow_create
	 */
	public boolean isAllow_create() {
		return allow_create;
	}

	/**
	 * @param allow_create the allow_create to set
	 */
	public void setAllow_create(boolean allow_create) {
		this.allow_create = allow_create;
	}

	/**
	 * @return the allow_delete
	 */
	public boolean isAllow_delete() {
		return allow_delete;
	}

	/**
	 * @param allow_delete the allow_delete to set
	 */
	public void setAllow_delete(boolean allow_delete) {
		this.allow_delete = allow_delete;
	}

	/**
	 * @return the allow_update
	 */
	public boolean isAllow_update() {
		return allow_update;
	}

	/**
	 * @param allow_update the allow_update to set
	 */
	public void setAllow_update(boolean allow_update) {
		this.allow_update = allow_update;
	}

	/**
	 * @return the allow_reports
	 */
	public boolean isAllow_reports() {
		return allow_reports;
	}

	/**
	 * @param allow_reports the allow_reports to set
	 */
	public void setAllow_reports(boolean allow_reports) {
		this.allow_reports = allow_reports;
	}

	/**
	 * @return the users
	 */
	public Set<User> getUsers() {
		return users;
	}

	/**
	 * @param users the users to set
	 */
	public void setUsers(Set<User> users) {
		this.users = users;
	}

}
