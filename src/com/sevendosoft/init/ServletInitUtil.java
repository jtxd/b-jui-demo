package com.sevendosoft.init;

import javax.servlet.ServletContext;

public class ServletInitUtil {
	
	static String getRunWay( ServletContext context ) {
		
		return context.getInitParameter( "running_way" );
	}
	
	static String getProjectPath( ServletContext context ) {
		
		 String path = context.getRealPath( "/" );
		 return path.substring( 0, path.length() - 1 );
	}
	
}
