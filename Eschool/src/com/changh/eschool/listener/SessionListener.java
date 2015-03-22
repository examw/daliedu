package com.changh.eschool.listener;


 import java.util.HashMap;
import java.util.Map;
import java.util.Map.Entry;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionAttributeListener;
import javax.servlet.http.HttpSessionBindingEvent;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import com.changh.eschool.entity.Student;

   

public class SessionListener implements HttpSessionListener,HttpSessionAttributeListener {      

    // ���浱ǰ��¼�������û�   

    public static Map<HttpSession, Student> loginAdmin = new HashMap<HttpSession, Student>();   

    /**  

     * session����ʱ�����������  

     */   
    public void sessionCreated(HttpSessionEvent se) {
    	// TODO Auto-generated method stub
    	 HttpSession session = se.getSession();
         ServletContext application = session.getServletContext();
         
         // ��application��Χ��һ��HashSet���������е�session
         System.out.println("==========sessionCreate============");
         Long count = (Long) application.getAttribute("onlineCount");
         if(count==null){
        	 count = 0L;
         }
         application.setAttribute("onlineCount", count+1);
    }
    /**
     * SessionʧЧ���߹��ڵ�ʱ����õ��������  
     */
    public void sessionDestroyed(HttpSessionEvent se) {
    	// TODO Auto-generated method stub
    	//�Ƴ�����û�
    	loginAdmin.remove(se.getSession());
        ServletContext application = se.getSession().getServletContext();
        Long count = (Long) application.getAttribute("onlineCount");
        if(count!=null&&count>0){
        	 application.setAttribute("onlineCount", count-1);
        }
    }
    
    /**
     *ִ��setAttribute��ʱ��, ��������Ա�����������Session��ʱ, �����������. 
     */
    
    public void attributeAdded(HttpSessionBindingEvent se) {
    	// TODO Auto-generated method stub
    	if(se.getName().equals("student"))
    	{
    		Student student = (Student) se.getValue();
    		//�Ѵ��ڣ�Ҳ�����Ѿ���½
    		if(student!=null)
    		{
    			destroyedOldSession(student);   
    		}
    		loginAdmin.put(se.getSession(), student);
    	}
    }
    
    public void attributeRemoved(HttpSessionBindingEvent se) {
    	// TODO Auto-generated method stub
    	if(se.getName().equals("student"))
    	{
    		loginAdmin.remove(se.getSession());
    	}
    }
    
    public void attributeReplaced(HttpSessionBindingEvent se) {
    	// TODO Auto-generated method stub
    	if(se.getName().equals("student"))
    	{
    		loginAdmin.put(se.getSession(), (Student)se.getValue());
    	}
    }
    /**
     * �����ǰ�û��Ѿ���¼������session����  
     */
    private void destroyedOldSession(Student student)
    {
    	for(Entry<HttpSession,Student> entry : loginAdmin.entrySet()){   
    		Student student1 = entry.getValue();
            Integer tempAdminId = student1.getStuId();   
            if(null != student1 && student.getStuId().equals(tempAdminId)){   
                HttpSession session = entry.getKey();   
                session.removeAttribute("student");   
                //session.setAttribute(SysConstant.SESSION_UDER_RE_LOGIN, SysConstant.SESSION_UDER_RE_LOGIN);   
                loginAdmin.remove(session);   
                break;
             }   
    	}
    }
}