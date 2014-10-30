package com.sevendosoft.access.service;

import java.lang.reflect.Method;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.AfterThrowing;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.stereotype.Component;
/**
 * <b>Description:</b></br> 
 * <b>Title:</b>360问医生后台管理
 * @company:7dosoft
 * @author: txd
 * @Date: 2014-9-13下午12:12:45
 * @version 1.0
 */

/**
 * 基于注解的AOP日志示例
 * @author ZYWANG 2011-3-24
 */
@Component
@Aspect
public class AopLog {/*
	
	//方法执行前调用
	@Before("execution (* com.sevendosoft.access.action.*.*(..))")
	public void before() {
		System.out.println("before");
	}
	
	//方法执行后调用
	@After("execution (* com.sevendosoft.access.action.*.*(..))")
	public void after() {
		System.out.println("after");
	}
	
	//方法执行的前后调用
	@Around("execution (* com.sevendosoft.access.action.*.*(..))")
	public Object around(ProceedingJoinPoint jp) throws Throwable{
		Object[] obj = jp.getArgs();
		for (Object object : obj)
		{
			System.out.println(object);
		}
		//获取方法名  
        String methodName = jp.getSignature().getName();  
        
		return jp.proceed() ;
	}
	
	//方法运行出现异常时调用
	@AfterThrowing(pointcut = "execution (* com.sevendosoft.access.action.*.*(..))",throwing = "ex")
	public void afterThrowing(Exception ex){
		System.out.println("afterThrowing");
		System.out.println(ex);
	}
	
	
	 *//** 
     * 使用Java反射来获取被拦截方法(insert、update)的参数值， 
     * 将参数值拼接为操作内容 
     *//*  
    public String adminOptionContent(Object[] args, String mName) throws Exception{  
  
        if (args == null) {  
            return null;  
        }  
          
        StringBuffer rs = new StringBuffer();  
        rs.append(mName);  
        String className = null;  
        int index = 1;  
        // 遍历参数对象  
        for (Object info : args) {  
              
            //获取对象类型  
            className = info.getClass().getName();  
            className = className.substring(className.lastIndexOf(".") + 1);  
            rs.append("[参数" + index + "，类型：" + className + "，值：");  
              
            // 获取对象的所有方法  
            Method[] methods = info.getClass().getDeclaredMethods();  
              
            // 遍历方法，判断get方法  
            for (Method method : methods) { 
                  
                String methodName = method.getName();  
                // 判断是不是get方法  
                if (methodName.indexOf("get") == -1) {// 不是get方法  
                    continue;// 不处理  
                }  
                  
                Object rsValue = null;  
                try {  
                      
                    // 调用get方法，获取返回值  
                    rsValue = method.invoke(info);  
                      
                    if (rsValue == null) {//没有返回值  
                        continue;  
                    }  
                      
                } catch (Exception e) {  
                    continue;  
                }  
                  
                //将值加入内容中  
                rs.append("(" + methodName + " : " + rsValue + ")");  
            }  
              
            rs.append("]");  
              
            index++;  
        }  
          
        return rs.toString();  
    }  
*/}
