package com.changh.eschool.log;

import org.aspectj.lang.ProceedingJoinPoint;

import com.changh.eschool.entity.Student;
import com.changh.eschool.until.LogUtil;
import com.changh.eschool.until.PropertiesUtil;
import com.opensymphony.xwork2.ActionContext;

public class Log4jHandlerAOP {
	//记录操作日志
		public Object mylogger(ProceedingJoinPoint pjp) throws Throwable{
			Object retVal = pjp.proceed();//调用目标对象方法
		
			//获取要调用的类名
			String className = pjp.getTarget()
								.getClass().getSimpleName();
			//获取要调用的方法名
			String methodName = pjp.getSignature().getName();
			String key = className+"."+methodName;
			String val = PropertiesUtil.getOptValue(key);
			//获得session
			Student student = (Student) ActionContext.getContext().getSession().get("student");
			if(student!=null&&!val.equals(""))LogUtil.logger.warn("\""+student.getStuName()+"\" 执行了 "+val);
			return retVal;
		}
}
