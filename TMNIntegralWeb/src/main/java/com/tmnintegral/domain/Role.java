/**
 * 
 */
package com.tmnintegral.domain;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
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
	
//	@OneToMany(mappedBy="role", fetch=FetchType.LAZY)
//	Set<User> users;
	
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
	 * @return the name
	 */
	public String getName() {
		return role_name;
	}
	/**
	 * @param name the name to set
	 */
	public void setName(String name) {
		this.role_name = name;
	}
	/**
	 * @return the allowCreate
	 */
	public boolean isAllowCreate() {
		return allow_create;
	}
	/**
	 * @param allowCreate the allowCreate to set
	 */
	public void setAllowCreate(boolean allowCreate) {
		this.allow_create = allowCreate;
	}
	/**
	 * @return the allowDelete
	 */
	public boolean isAllowDelete() {
		return allow_delete;
	}
	/**
	 * @param allowDelete the allowDelete to set
	 */
	public void setAllowDelete(boolean allowDelete) {
		this.allow_delete = allowDelete;
	}
	/**
	 * @return the allowUpdate
	 */
	public boolean isAllowUpdate() {
		return allow_update;
	}
	/**
	 * @param allowUpdate the allowUpdate to set
	 */
	public void setAllowUpdate(boolean allowUpdate) {
		this.allow_update = allowUpdate;
	}
	/**
	 * @return the allowReports
	 */
	public boolean isAllowReports() {
		return allow_reports;
	}
	/**
	 * @param allowReports the allowReports to set
	 */
	public void setAllowReports(boolean allowReports) {
		this.allow_reports = allowReports;
	}
	
	
}
