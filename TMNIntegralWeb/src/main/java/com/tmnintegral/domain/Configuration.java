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
@Table(name="configuration") 
public class Configuration implements Serializable {
	
	private static final long serialVersionUID = 1L;

	@Id
    @Column(name = "id_configuration")
	private int id_configuration;
	private String file_name;
	private String content;
	private int id_version;
	
	public Configuration(){
		super();
	}	
	
	public Configuration(String file_name, String content, int id_version){
		
		super();
		this.file_name = file_name;
		this.content = content;
		this.id_version = id_version;
	}

	/**
	 * @return the id_configuration
	 */
	public int getId_configuration() {
		return id_configuration;
	}

	/**
	 * @param id_configuration the id_configuration to set
	 */
	public void setId_configuration(int id_configuration) {
		this.id_configuration = id_configuration;
	}

	/**
	 * @return the file_name
	 */
	public String getFile_name() {
		return file_name;
	}

	/**
	 * @param file_name the file_name to set
	 */
	public void setFile_name(String file_name) {
		this.file_name = file_name;
	}

	/**
	 * @return the content
	 */
	public String getContent() {
		return content;
	}

	/**
	 * @param content the content to set
	 */
	public void setContent(String content) {
		this.content = content;
	}

	/**
	 * @return the id_version
	 */
	public int getId_version() {
		return id_version;
	}

	/**
	 * @param id_version the id_version to set
	 */
	public void setId_version(int id_version) {
		this.id_version = id_version;
	}
	
	
	
	
}