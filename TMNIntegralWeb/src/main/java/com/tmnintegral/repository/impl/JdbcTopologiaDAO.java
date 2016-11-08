/**
 * 
 */
package com.tmnintegral.repository.impl;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.HashSet;
import java.util.Set;

import javax.json.Json;
import javax.json.JsonArrayBuilder;
import javax.json.JsonObject;

import org.springframework.stereotype.Repository;

import com.tmnintegral.repository.TopologiaDao;

/**
 * @author Agustina
 *
 */
@Repository(value = "topologiaDao")
public class JdbcTopologiaDAO implements TopologiaDao{

	// JDBC driver name and database URL
	static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";  
	static final String DB_URL = "jdbc:mysql://localhost:3306/tmnintegral";

	//  Database credentials
	static final String USER = "root";
	static final String PASS = "";

	public JsonObject getTopologia(int clientid){
		Connection conn = null;
		Statement stmt = null;

		JsonArrayBuilder elmtIdsBuilder = Json.createArrayBuilder();
		Set<String> elmtIdsKeys = new HashSet<String>();
		JsonArrayBuilder linkIdsBuilder = Json.createArrayBuilder();
		
		try{

			conn = this.getConnection();
			stmt = conn.createStatement();

			String sql = "select distinct E.id as 'eq-origen-id',E.elementName EQUIPO_ORIGEN, " +
							" EI.id as 'in-origen-id', " +
							" EI.elementName INTERFAZ_ORIGEN ," + 
							" EI2.id as 'in-destino-id'," +
							" EI2.elementName INTERFAZ_DESTINO," + 
							" ED2.id as 'eq-destino-id'," +
							" ED2.elementName EQUIPO_DESTINO," +
							" Device_1.client_id as client_id_A," +
							" Device_2.client_id as client_id_Z" +
							" from element E                      " +                                                
							" join elementrelationship ER1 on (E.id=ER1.AEnd)" +
							" join element EI ON EI.id=ER1.ZEnd" +
							" join elementrelationship ER2 on (ER1.ZEnd=ER2.AEnd )" +
							" join element EI2 ON EI2.id=ER2.ZEnd" +
							" join elementrelationship ER3 ON ER2.ZEnd = ER3.AEnd" +
							" JOIN element ED2 on ED2.id = ER3.ZEnd" +
							" join elementvsdatasources EDS1 on E.id=EDS1.id_ele" +
							" join elementvsdatasources EDS2 on ED2.id=EDS2.id_ele" +
							" join device Device_1 ON Device_1.id = EDS1.id_device" +
							" join device Device_2 ON Device_2.id = EDS2.id_device" +
							" where E.elementClass='Device' and ER1.relationClass='Device-Interf'" + 
							" and ER2.relationClass='Interf-Interf'  and ER3.relationClass='Device-Interf'" +
							" and (Device_1.client_id =" + clientid + " or Device_2.client_id=" + clientid + " )";

			ResultSet rs = stmt.executeQuery(sql);

			while(rs.next()){
				//Elementos (equipos e interfaces)
				
				JsonObject eqOrigen = Json.createObjectBuilder()
					.add("id", rs.getInt("eq-origen-id"))
					.add("label", rs.getString("EQUIPO_ORIGEN"))
					.add("type", "equipment").build();
				/*JSONObject eqOrigen = new JSONObject();
				eqOrigen.put("id", rs.getInt("eq-origen-id"));
				eqOrigen.put("label", rs.getString("EQUIPO_ORIGEN"));
				eqOrigen.put("type", "equipment");
				if (!elmtIdsBuilder.contains(eqOrigen)) elmtIdsBuilder.add(eqOrigen);*/
				if (!elmtIdsKeys.contains(rs.getInt("eq-origen-id") + "-" + rs.getString("EQUIPO_ORIGEN") +"-equipment")){
					elmtIdsBuilder.add(eqOrigen);
					elmtIdsKeys.add(rs.getInt("eq-origen-id") + "-" + rs.getString("EQUIPO_ORIGEN") +"-equipment");
				}
				
				JsonObject eqDestino = Json.createObjectBuilder()
						.add("id", rs.getInt("eq-destino-id"))
						.add("label", rs.getString("EQUIPO_DESTINO"))
						.add("type", "equipment").build();
				/*JSONObject eqDestino = new JSONObject();
				eqDestino.put("id", rs.getInt("eq-destino-id"));
				eqDestino.put("label", rs.getString("EQUIPO_DESTINO"));
				eqDestino.put("type", "equipment");
				if (!elmtIdsBuilder.contains(eqDestino)) elmtIdsBuilder.add(eqDestino);*/
				if (!elmtIdsKeys.contains(rs.getInt("eq-destino-id") + "-" + rs.getString("EQUIPO_DESTINO") +"-equipment")){
					elmtIdsBuilder.add(eqDestino);
					elmtIdsKeys.add(rs.getInt("eq-destino-id") + "-" + rs.getString("EQUIPO_DESTINO") +"-equipment");
				}
				
				JsonObject iOrigen = Json.createObjectBuilder()
						.add("id", rs.getInt("in-origen-id"))
						.add("label", rs.getString("INTERFAZ_ORIGEN"))
						.add("type", "interface").build();
				/*JSONObject iOrigen = new JSONObject();
				iOrigen.put("id", rs.getInt("in-origen-id"));
				iOrigen.put("label", rs.getString("INTERFAZ_ORIGEN"));
				iOrigen.put("type", "interface");
				if (!elmtIdsBuilder.contains(iOrigen)) elmtIdsBuilder.add(iOrigen);*/
				if (!elmtIdsKeys.contains(rs.getInt("in-origen-id") + "-" + rs.getString("INTERFAZ_ORIGEN") +"-interface")){
					elmtIdsBuilder.add(iOrigen);
					elmtIdsKeys.add(rs.getInt("in-origen-id") + "-" + rs.getString("INTERFAZ_ORIGEN") +"-interface");
				}
				
				JsonObject iDestino = Json.createObjectBuilder()
						.add("id", rs.getInt("in-destino-id"))
						.add("label", rs.getString("INTERFAZ_DESTINO"))
						.add("type", "interface").build();
				/*JSONObject iDestino = new JSONObject();
				iDestino.put("id", rs.getInt("in-destino-id"));
				iDestino.put("label", rs.getString("INTERFAZ_DESTINO"));
				iDestino.put("type", "interface");
				if (!elmtIdsBuilder.contains(iDestino)) elmtIdsBuilder.add(iDestino);*/
				if (!elmtIdsKeys.contains(rs.getInt("in-destino-id") + "-" + rs.getString("INTERFAZ_DESTINO") +"-interface")){
					elmtIdsBuilder.add(iDestino);
					elmtIdsKeys.add(rs.getInt("in-destino-id") + "-" + rs.getString("INTERFAZ_DESTINO") +"-interface");
				}
				
				//Links entre elementos
				JsonObject linkorigen = Json.createObjectBuilder()
						.add("from", rs.getInt("eq-origen-id"))
						.add("to", rs.getString("in-origen-id"))
						.add("type", "internal").build();
				/*JSONObject linkorigen = new JSONObject();
				linkorigen.put("from", rs.getInt("eq-origen-id"));
				linkorigen.put("to", rs.getInt("in-origen-id"));
				linkorigen.put("type", "internal");*/
				linkIdsBuilder.add(linkorigen);
				
				JsonObject linkorigendestino = Json.createObjectBuilder()
						.add("from", rs.getInt("in-origen-id"))
						.add("to", rs.getString("in-destino-id"))
						.add("type", "external").build();
				/*JSONObject linkorigendestino = new JSONObject();
				linkorigendestino.put("from", rs.getInt("in-origen-id"));
				linkorigendestino.put("to", rs.getInt("in-destino-id"));
				linkorigendestino.put("type", "external");*/
				linkIdsBuilder.add(linkorigendestino);
				
				JsonObject linkdestino = Json.createObjectBuilder()
						.add("from", rs.getInt("in-destino-id"))
						.add("to", rs.getString("eq-destino-id"))
						.add("type", "internal").build();
				/*JSONObject linkdestino = new JSONObject();
				linkdestino.put("from", rs.getInt("in-destino-id"));
				linkdestino.put("to", rs.getInt("in-destino-id"));
				linkdestino.put("type", "internal");*/
				linkIdsBuilder.add(linkdestino);
			}

			rs.close();
			stmt.close();
			conn.close();
		}catch(SQLException se){
			//Handle errors for JDBC
			se.printStackTrace();
		}catch(Exception e){
			//Handle errors for Class.forName
			e.printStackTrace();
		}finally{
			//finally block used to close resources
			try{
				if(stmt!=null)
					stmt.close();
			}catch(SQLException se2){
			}// nothing we can do
			try{
				if(conn!=null)
					conn.close();
			}catch(SQLException se){
				se.printStackTrace();
			}//end finally try
		}//end try
		
		/*resJson.put("elements", elmtIdsBuilder);
		resJson.put("links", linkIdsBuilder);*/
		
		return Json.createObjectBuilder()
				.add("elements", elmtIdsBuilder.build())
				.add("links", linkIdsBuilder.build()).build();
	}
	
	public JsonObject getTopologia(){
		Connection conn = null;
		Statement stmt = null;

		JsonArrayBuilder elmtIdsBuilder = Json.createArrayBuilder();
		Set<String> elmtIdsKeys = new HashSet<String>();
		JsonArrayBuilder linkIdsBuilder = Json.createArrayBuilder();
		
		try{

			conn = this.getConnection();
			stmt = conn.createStatement();

			String sql = "select distinct"
					+ " E.id as 'eq-origen-id',E.elementName EQUIPO_ORIGEN,"
					+ " EI.id as 'in-origen-id', EI.elementName INTERFAZ_ORIGEN ,"
					+ " EI2.id as 'in-destino-id',EI2.elementName INTERFAZ_DESTINO,"
					+ " ED2.id as 'eq-destino-id',ED2.elementName EQUIPO_DESTINO"
					+ " from Element E                                                                     /* EQUIPO */"
					+ " join elementrelationship ER1 on (E.id=ER1.AEnd)                    /* EQUIPO-INTERFAZ ORIGEN */"
					+ " join Element EI ON EI.id=ER1.ZEnd                                       /* INTERFAZ ORIGEN */"
					+ " join elementrelationship ER2 on (ER1.ZEnd=ER2.AEnd )          /* INTERFAZ ORIGEN - INTERFAZ DESTINO*/"
					+ " join Element EI2 ON EI2.id=ER2.ZEnd                                    /* INTERFAZ DESTINO */"
					+ " join elementrelationship ER3 ON ER2.ZEnd = ER3.AEnd          /* EQUIPO - INTERFAZ DESTINO*/"
					+ " JOIN Element ED2 on ED2.id = ER3.ZEnd                              /* EQUIPO DESTINO*/"
					+ " where E.elementClass='Device' and"
					+ " ER1.relationClass='Device-Interf' and"
					+ " ER2.relationClass='Interf-Interf'  and"
					+ " ER3.relationClass='Device-Interf'";

			ResultSet rs = stmt.executeQuery(sql);

			while(rs.next()){
				//Elementos (equipos e interfaces)
				
				JsonObject eqOrigen = Json.createObjectBuilder()
					.add("id", rs.getInt("eq-origen-id"))
					.add("label", rs.getString("EQUIPO_ORIGEN"))
					.add("type", "equipment").build();
				/*JSONObject eqOrigen = new JSONObject();
				eqOrigen.put("id", rs.getInt("eq-origen-id"));
				eqOrigen.put("label", rs.getString("EQUIPO_ORIGEN"));
				eqOrigen.put("type", "equipment");
				if (!elmtIdsBuilder.contains(eqOrigen)) elmtIdsBuilder.add(eqOrigen);*/
				if (!elmtIdsKeys.contains(rs.getInt("eq-origen-id") + "-" + rs.getString("EQUIPO_ORIGEN") +"-equipment")){
					elmtIdsBuilder.add(eqOrigen);
					elmtIdsKeys.add(rs.getInt("eq-origen-id") + "-" + rs.getString("EQUIPO_ORIGEN") +"-equipment");
				}
				
				JsonObject eqDestino = Json.createObjectBuilder()
						.add("id", rs.getInt("eq-destino-id"))
						.add("label", rs.getString("EQUIPO_DESTINO"))
						.add("type", "equipment").build();
				/*JSONObject eqDestino = new JSONObject();
				eqDestino.put("id", rs.getInt("eq-destino-id"));
				eqDestino.put("label", rs.getString("EQUIPO_DESTINO"));
				eqDestino.put("type", "equipment");
				if (!elmtIdsBuilder.contains(eqDestino)) elmtIdsBuilder.add(eqDestino);*/
				if (!elmtIdsKeys.contains(rs.getInt("eq-destino-id") + "-" + rs.getString("EQUIPO_DESTINO") +"-equipment")){
					elmtIdsBuilder.add(eqDestino);
					elmtIdsKeys.add(rs.getInt("eq-destino-id") + "-" + rs.getString("EQUIPO_DESTINO") +"-equipment");
				}
				
				JsonObject iOrigen = Json.createObjectBuilder()
						.add("id", rs.getInt("in-origen-id"))
						.add("label", rs.getString("INTERFAZ_ORIGEN"))
						.add("type", "interface").build();
				/*JSONObject iOrigen = new JSONObject();
				iOrigen.put("id", rs.getInt("in-origen-id"));
				iOrigen.put("label", rs.getString("INTERFAZ_ORIGEN"));
				iOrigen.put("type", "interface");
				if (!elmtIdsBuilder.contains(iOrigen)) elmtIdsBuilder.add(iOrigen);*/
				if (!elmtIdsKeys.contains(rs.getInt("in-origen-id") + "-" + rs.getString("INTERFAZ_ORIGEN") +"-interface")){
					elmtIdsBuilder.add(iOrigen);
					elmtIdsKeys.add(rs.getInt("in-origen-id") + "-" + rs.getString("INTERFAZ_ORIGEN") +"-interface");
				}
				
				JsonObject iDestino = Json.createObjectBuilder()
						.add("id", rs.getInt("in-destino-id"))
						.add("label", rs.getString("INTERFAZ_DESTINO"))
						.add("type", "interface").build();
				/*JSONObject iDestino = new JSONObject();
				iDestino.put("id", rs.getInt("in-destino-id"));
				iDestino.put("label", rs.getString("INTERFAZ_DESTINO"));
				iDestino.put("type", "interface");
				if (!elmtIdsBuilder.contains(iDestino)) elmtIdsBuilder.add(iDestino);*/
				if (!elmtIdsKeys.contains(rs.getInt("in-destino-id") + "-" + rs.getString("INTERFAZ_DESTINO") +"-interface")){
					elmtIdsBuilder.add(iDestino);
					elmtIdsKeys.add(rs.getInt("in-destino-id") + "-" + rs.getString("INTERFAZ_DESTINO") +"-interface");
				}
				
				//Links entre elementos
				JsonObject linkorigen = Json.createObjectBuilder()
						.add("from", rs.getInt("eq-origen-id"))
						.add("to", rs.getString("in-origen-id"))
						.add("type", "internal").build();
				/*JSONObject linkorigen = new JSONObject();
				linkorigen.put("from", rs.getInt("eq-origen-id"));
				linkorigen.put("to", rs.getInt("in-origen-id"));
				linkorigen.put("type", "internal");*/
				linkIdsBuilder.add(linkorigen);
				
				JsonObject linkorigendestino = Json.createObjectBuilder()
						.add("from", rs.getInt("in-origen-id"))
						.add("to", rs.getString("in-destino-id"))
						.add("type", "external").build();
				/*JSONObject linkorigendestino = new JSONObject();
				linkorigendestino.put("from", rs.getInt("in-origen-id"));
				linkorigendestino.put("to", rs.getInt("in-destino-id"));
				linkorigendestino.put("type", "external");*/
				linkIdsBuilder.add(linkorigendestino);
				
				JsonObject linkdestino = Json.createObjectBuilder()
						.add("from", rs.getInt("in-destino-id"))
						.add("to", rs.getString("in-destino-id"))
						.add("type", "internal").build();
				/*JSONObject linkdestino = new JSONObject();
				linkdestino.put("from", rs.getInt("in-destino-id"));
				linkdestino.put("to", rs.getInt("in-destino-id"));
				linkdestino.put("type", "internal");*/
				linkIdsBuilder.add(linkdestino);
			}

			rs.close();
			stmt.close();
			conn.close();
		}catch(SQLException se){
			//Handle errors for JDBC
			se.printStackTrace();
		}catch(Exception e){
			//Handle errors for Class.forName
			e.printStackTrace();
		}finally{
			//finally block used to close resources
			try{
				if(stmt!=null)
					stmt.close();
			}catch(SQLException se2){
			}// nothing we can do
			try{
				if(conn!=null)
					conn.close();
			}catch(SQLException se){
				se.printStackTrace();
			}//end finally try
		}//end try
		
		/*resJson.put("elements", elmtIdsBuilder);
		resJson.put("links", linkIdsBuilder);*/
		
		return Json.createObjectBuilder()
				.add("elements", elmtIdsBuilder.build())
				.add("links", linkIdsBuilder.build()).build();
	}

	private Connection getConnection(){
		Connection conn = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(DB_URL,USER,PASS);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return conn;
	}
	
}
