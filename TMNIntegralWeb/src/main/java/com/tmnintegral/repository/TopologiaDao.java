package com.tmnintegral.repository;

import javax.json.JsonObject;

/**
 * @author Agustina
 *
 */
public interface TopologiaDao {

	public JsonObject getTopologia();
	
	public JsonObject getTopologia(int client);
	
}
