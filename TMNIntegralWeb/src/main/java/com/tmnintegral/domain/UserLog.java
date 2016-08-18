/**
 * 
 */
package com.tmnintegral.domain;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * @author Agustina
 *
 */
@Entity
@Table(name="user_log") 
public class UserLog implements Serializable{

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
    @Column(name = "id")
	private Integer id;
	
	private Integer user;
	private String log_desc;
	private Date date;
	
	public UserLog(){
		super();
	}
	
	public UserLog(Integer user, String log_desc, Date logDate) {
		super();
		this.user = user;
		this.log_desc = log_desc;
		this.date = logDate;
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
	 * @return the user
	 */
	public Integer getUser() {
		return user;
	}
	/**
	 * @param user the user to set
	 */
	public void setUser(Integer user) {
		this.user = user;
	}
	/**
	 * @return the log_desc
	 */
	public String getLog_desc() {
		return log_desc;
	}
	/**
	 * @param log_desc the log_desc to set
	 */
	public void setLog_desc(String log_desc) {
		this.log_desc = log_desc;
	}

	/**
	 * @return the date
	 */
	public Date getDate() {
		return date;
	}

	/**
	 * @param date the date to set
	 */
	public void setDate(Date date) {
		this.date = date;
	}
	
}
