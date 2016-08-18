/**
 * 
 */
package com.tmnintegral.repository;

import java.util.List;

import com.tmnintegral.domain.TipoEquipo;

/**
 * @author Agustina
 *
 */
public interface TipoEquipoDao {

	public TipoEquipo getTipoEquipo(int tipoEquipoId);
	
	public List<TipoEquipo> getTipoEquiposList();
	
	public TipoEquipo saveTipoEquipo(TipoEquipo te) throws Exception;
	
	public void updateTipoEquipo(TipoEquipo te);
	
	public void deleteTipoEquipo(TipoEquipo te);
	
	public void deleteTipoEquipo(int teId);
	
}
