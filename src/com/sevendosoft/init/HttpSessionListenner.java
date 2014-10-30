package com.sevendosoft.init;

import java.io.File;

import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.sevendo.framework.util.spring.ApplicationContextHolder;
import com.sevendosoft.access.action.LoginAction;


/**
 * 监听session过期
 * @author crs
 *
 */
public class HttpSessionListenner implements HttpSessionListener {

	private Logger logger = LoggerFactory.getLogger( HttpSessionListenner.class );
	
	@Override
	public void sessionCreated( HttpSessionEvent arg0 ) {
	}

	@Override
	public void sessionDestroyed( HttpSessionEvent event ) {
		
		String sessionId = event.getSession().getId();
		
		LoginAction loginAction = (LoginAction) ApplicationContextHolder.getBean( "loginAction" );
		loginAction.logOutDtail( event.getSession() ) ;
		
		logger.info( "session " + sessionId + " 过期,删除该session的临时文件" );
		String dir = InitListener.baseFilePath + Config.getConfig( "image_upload_temp_path" ) + event.getSession().getId();
		File f = new File( dir );
		this.deleteFile( f );
		logger.debug( "session " + sessionId + " 临时文件删除完成" );
	}
	
	
	private void deleteFile( File file ) {
		
		if (file.exists()) {
			if (file.isFile()) {
				file.delete();
			} else if (file.isDirectory()) {
				File files[] = file.listFiles();
				for (int i = 0; i < files.length; i++) {
					this.deleteFile(files[i]);
				}
			}
			file.delete();
		} else {
			logger.info( "所删除的文件不存在！" + file.getPath() + "/" + file.getName() );
		}
	}


}
