/**
 * 
 */
package com.tmnintegral.domain;

import java.io.Serializable;

import javax.json.Json;
import javax.json.JsonObject;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.Table;

/**
 * @author Agustina
 *
 */
@Entity
@Table(name="variable_devicetype") 
public class Command implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -6222219832142242735L;
	@EmbeddedId
	private CommandKey key;
	private String type;
	private String regex;
	private String operation;
	private String invertir;
	private String flt_umbral;
	private String is_fault;
	private String is_performance;
	private String is_device;
	
	
	/**
	 * 
	 */
	public Command() {
		super();
	}

	
	/**
	 * @param key
	 * @param type
	 * @param regex
	 * @param operation
	 * @param invertir
	 * @param flt_umbral
	 * @param is_fault
	 * @param is_performance
	 * @param is_device
	 */
	public Command(CommandKey key, String type, String regex, String operation, String invertir, String flt_umbral,
			String is_fault, String is_performance, String is_device) {
		super();
		this.key = key;
		this.type = type;
		this.regex = regex;
		this.operation = operation;
		this.invertir = invertir;
		this.flt_umbral = flt_umbral;
		this.is_fault = is_fault;
		this.is_performance = is_performance;
		this.is_device = is_device;
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
	 * @return the regex
	 */
	public String getRegex() {
		return regex;
	}
	/**
	 * @param regex the regex to set
	 */
	public void setRegex(String regex) {
		this.regex = regex;
	}
	/**
	 * @return the operation
	 */
	public String getOperation() {
		return operation;
	}
	/**
	 * @param operation the operation to set
	 */
	public void setOperation(String operation) {
		this.operation = operation;
	}
	/**
	 * @return the invertir
	 */
	public String getInvertir() {
		return invertir;
	}
	/**
	 * @param invertir the invertir to set
	 */
	public void setInvertir(String invertir) {
		this.invertir = invertir;
	}
	/**
	 * @return the flt_umbral
	 */
	public String getFlt_umbral() {
		return flt_umbral;
	}
	/**
	 * @param flt_umbral the flt_umbral to set
	 */
	public void setFlt_umbral(String flt_umbral) {
		this.flt_umbral = flt_umbral;
	}
	/**
	 * @return the is_fault
	 */
	public String getIs_fault() {
		return is_fault;
	}
	/**
	 * @param is_fault the is_fault to set
	 */
	public void setIs_fault(String is_fault) {
		this.is_fault = is_fault;
	}
	/**
	 * @return the is_performance
	 */
	public String getIs_performance() {
		return is_performance;
	}
	/**
	 * @param is_performance the is_performance to set
	 */
	public void setIs_performance(String is_performance) {
		this.is_performance = is_performance;
	}
	/**
	 * @return the is_device
	 */
	public String getIs_device() {
		return is_device;
	}
	/**
	 * @param is_device the is_device to set
	 */
	public void setIs_device(String is_device) {
		this.is_device = is_device;
	}

	/**
	 * @return the key
	 */
	public CommandKey getKey() {
		return key;
	}

	/**
	 * @param key the key to set
	 */
	public void setKey(CommandKey key) {
		this.key = key;
	}

	public JsonObject toJSON(){
		JsonObject obj = Json.createObjectBuilder()
			.add("variableId", this.getKey().getIdVariable())
			.add("tipoequipoId", this.getKey().getIdDeviceType())
			.add("fieldname", this.getKey().getFieldName())
			.add("type", this.getType() != null ? this.getType() : "")
			.add("regex", this.getRegex() != null ? this.getRegex() : "")
			.add("operation", this.getOperation() != null ? this.getOperation() : "")
			.add("isdevice", this.getIs_device() != null ? this.getIs_device() : "").build();
		return obj;
	}

}