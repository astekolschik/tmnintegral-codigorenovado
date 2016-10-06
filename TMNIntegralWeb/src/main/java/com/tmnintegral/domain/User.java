/**
 * 
 */
package com.tmnintegral.domain;

import java.io.File;
import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * @author Agustina
 *
 */
@Entity
@Table(name="user") 
public class User implements Serializable{

	private static final long serialVersionUID = 1L;

	@Id
    @Column(name = "user_id")
	private Integer id;
	
	private String user_name;
	private String password;
	private String email;
	private String name;
	private String last_name;
	private String address;
	private String notas;
	
	private String completePicDir;
	
	private int role_id;
	/*@ManyToOne//(cascade=CascadeType.ALL)  
    @JoinTable(name="role")  
	private Role role;
*/
	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn(name="client_id")
	private Client client;
	
	public User(){
		super();
	}
	
	public User(String username, String password, String email, String name, String lastName, Role role,
			String direccion, String notas, Client client) {
		super();
		this.user_name = username;
		this.password = password;
		this.email = email;
		this.name = name;
		this.last_name = lastName;
		this.address = direccion;
		this.notas = notas;

		this.role_id = role.getRole_id();
//		this.role = role;
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
	 * @return the password
	 */
	public String getPassword() {
		return password;
	}

	/**
	 * @param password the password to set
	 */
	public void setPassword(String password) {
		this.password = password;
	}

	/**
	 * @return the email
	 */
	public String getEmail() {
		return email;
	}

	/**
	 * @param email the email to set
	 */
	public void setEmail(String email) {
		this.email = email;
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
	 * @return the lastName
	 */
	public String getLastName() {
		return last_name;
	}

	/**
	 * @param lastName the lastName to set
	 */
	public void setLastName(String lastName) {
		this.last_name = lastName;
	}

//	/**
//	 * @return the role
//	 */
//	public Role getRole() {
//		return role;
//	}
//
//	/**
//	 * @param role the role to set
//	 */
//	public void setRole(Role role) {
//		this.role = role;
//	}

	/**
	 * @return the user_name
	 */
	public String getUser_name() {
		return user_name;
	}

	/**
	 * @param user_name the user_name to set
	 */
	public void setUser_name(String user_name) {
		this.user_name = user_name;
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
	 * @return the address
	 */
	public String getAddress() {
		return address;
	}

	/**
	 * @return the notas
	 */
	public String getNotas() {
		return notas;
	}

	/**
	 * @return the last_name
	 */
	public String getLast_name() {
		return last_name;
	}

	/**
	 * @param last_name the last_name to set
	 */
	public void setLast_name(String last_name) {
		this.last_name = last_name;
	}

	/**
	 * @param address the address to set
	 */
	public void setAddress(String address) {
		this.address = address;
	}

	/**
	 * @param notas the notas to set
	 */
	public void setNotas(String notas) {
		this.notas = notas;
	}

	public Client getClient() {
		return client;
	}

	public void setClient(Client client) {
		this.client = client;
	}

	public String getCompletePicDir() {
		return completePicDir;
	}

	public void setCompletePicDir(String completePicDir) {
		this.completePicDir = completePicDir;
	}

	public String getImagePath(){
		if(this.completePicDir != null)
			return "img" + File.separator + "users" + File.separator + this.completePicDir;
		return null;
	}
	
}
