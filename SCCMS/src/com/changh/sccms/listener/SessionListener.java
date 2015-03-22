package com.changh.sccms.listener;


 import java.util.HashMap;
import java.util.Map;
import java.util.Map.Entry;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionAttributeListener;
import javax.servlet.http.HttpSessionBindingEvent;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import com.changh.sccms.entity.Administrator;

   

public class SessionListener implements HttpSessionListener,HttpSessionAttributeListener {      

    // 保存当前登录的所有用户   

    public static Map<HttpSession, Administrator> loginAdmin = new HashMap<HttpSession, Administrator>();   

    /**  

     * session创建时调用这个方法  

     */   
    public void sessionCreated(HttpSessionEvent se) {
    	// TODO Auto-generated method stub
    	
    }
    /**
     * Session失效或者过期的时候调用的这个方法  
     */
    public void sessionDestroyed(HttpSessionEvent se) {
    	// TODO Auto-generated method stub
    	//移除这个用户
    	loginAdmin.remove(se.getSession());
    }
    
    /**
     *执行setAttribute的时候, 当这个属性本来不存在于Session中时, 调用这个方法. 
     */
    
    public void attributeAdded(HttpSessionBindingEvent se) {
    	// TODO Auto-generated method stub
    	if(se.getName().equals("admin"))
    	{
    		Administrator admin = (Administrator) se.getValue();
    		//已存在，也就是已经登陆
    		if(admin!=null)
    		{
    			destroyedOldSession(admin);   
    		}
    		loginAdmin.put(se.getSession(), admin);
    	}
    }
    
    public void attributeRemoved(HttpSessionBindingEvent se) {
    	// TODO Auto-generated method stub
    	if(se.getName().equals("admin"))
    	{
    		loginAdmin.remove(se.getSession());
    	}
    }
    
    public void attributeReplaced(HttpSessionBindingEvent se) {
    	// TODO Auto-generated method stub
    	if(se.getName().equals("admin"))
    	{
    		loginAdmin.put(se.getSession(), (Administrator)se.getValue());
    	}
    }
    /**
     * 如果当前用户已经登录则将其session销毁  
     */
    private void destroyedOldSession(Administrator admin)
    {
    	for(Entry<HttpSession,Administrator> entry : loginAdmin.entrySet()){   
    		Administrator admin1 = entry.getValue();
    		Integer tempAdminId = admin1.getAdmId();  	   
            if(null != admin1 && admin.getAdmId().equals(tempAdminId)){   
                HttpSession session = entry.getKey();   
                session.removeAttribute("admin");   
                //session.setAttribute(SysConstant.SESSION_UDER_RE_LOGIN, SysConstant.SESSION_UDER_RE_LOGIN);   
                loginAdmin.remove(session); 
                break;
             }   
    }
    }
}