package com.sevendosoft.init;

import java.util.HashMap;
import java.util.List;

import com.sevendo.app.handler.io.xml.ConfigHandler;
import com.sevendo.app.handler.io.xml.pojo.Connection;
import com.sevendo.app.handler.io.xml.pojo.Root;


/**
 * 配置
 * @author acer
 *
 */
public class Config {

	private static Config config;
	
	public static void loadConfig( String file ) {
		
		config = new Config( file );
	}
	
	public static String getConfig( String name ) {
		
		return config.params.get( name );
	}
	
	public static Connection getConnection( String id ) {
		
		return config.connections.get( id );
	}
	
	private HashMap<String, String> params;
	
	private HashMap<String, Connection> connections;
	
	private Config( String file ) {
		
		List<Root> roots = ConfigHandler.readConfig( file );
		params = ConfigHandler.getParams( roots );
		connections = ConfigHandler.getConections( roots );
	}
	
}
