package com.sevendosoft.init;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.slf4j.LoggerFactory;


import ch.qos.logback.classic.LoggerContext;
import ch.qos.logback.classic.joran.JoranConfigurator;
import ch.qos.logback.core.joran.spi.JoranException;
import ch.qos.logback.core.util.StatusPrinter;

public class InitListener implements ServletContextListener {

	public static String baseFilePath;
	
	@Override
	public void contextDestroyed( ServletContextEvent arg0 ) {
		
	}

	@Override
	public void contextInitialized( ServletContextEvent event ) {
		
		System.out.println( "========获得系统配置路径========" );
		
		ServletContext context = event.getServletContext();
		String runWay = ServletInitUtil.getRunWay( context );
		if( runWay == null ) {
			throw new RuntimeException( "web.xml 缺少运行环境配置" );
		}
		String path = ServletInitUtil.getProjectPath( context );
		baseFilePath = path;
		
		System.out.println( "========初始化logback配置========" );
		LoggerContext lc = (LoggerContext) LoggerFactory.getILoggerFactory();
        JoranConfigurator configurator = new JoranConfigurator();
        configurator.setContext(lc);
        lc.reset();
        try {
            configurator.doConfigure( path + "/WEB-INF/config/" + runWay + "/logback.xml" );
        } catch ( JoranException e ) {
            e.printStackTrace();
        }
        StatusPrinter.printInCaseOfErrorsOrWarnings( lc );
        System.out.println( "========初始化logback配置 结束========" );
        
        System.out.println( "========读取系统配置========" );
        Config.loadConfig( path + "/WEB-INF/config/" + runWay + "/system_config.xml" );
        System.out.println( "========读取系统配置 结束========" );
	}

}
