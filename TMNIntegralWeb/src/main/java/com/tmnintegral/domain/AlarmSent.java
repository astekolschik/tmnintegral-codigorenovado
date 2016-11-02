/**
 * 
 */
package com.tmnintegral.domain;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * @author Agustina
 *
 */
@Entity
@Table(name="alarms_sent")
public class AlarmSent implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 2221465320627311473L;

	/**
	 * 
	 */

	@Id
    @Column(name = "id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	
	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn(name="alarmid")
	private Alarm alarm;
	
	private Date datesent;
	
	/**
	 * Constructor
	 * @param id
	 * @param alarm
	 * @param datesent
	 */
	public AlarmSent(Integer id, Alarm alarm, Date datesent) {
		super();
		this.id = id;
		this.alarm = alarm;
		this.datesent = datesent;
	}

	/**
	 * 
	 */
	public AlarmSent() {
		super();
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
	 * @return the alarm
	 */
	public Alarm getAlarm() {
		return alarm;
	}

	/**
	 * @param alarm the alarm to set
	 */
	public void setAlarm(Alarm alarm) {
		this.alarm = alarm;
	}

	/**
	 * @return the datesent
	 */
	public Date getDatesent() {
		return datesent;
	}

	/**
	 * @param datesent the datesent to set
	 */
	public void setDatesent(Date datesent) {
		this.datesent = datesent;
	}

}
