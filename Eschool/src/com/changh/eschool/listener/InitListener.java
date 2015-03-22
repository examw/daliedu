package com.changh.eschool.listener;

import java.util.HashMap;
import java.util.Map.Entry;
import java.util.Iterator;
import java.util.Set;
import java.util.Timer;
import java.util.TimerTask;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;


/**
 *	��������ʱ����
 * @author laien
 *
 */
public class InitListener  implements javax.servlet.ServletContextListener {
	private Timer timer;
	@Override
	public void contextDestroyed(ServletContextEvent arg0) {
		if(timer!=null){
			timer.cancel();
			timer =null;
		}
	}

	@Override
	public void contextInitialized(ServletContextEvent event) {
		System.out.println("contextInitialized������ʼ��");
		ServletContext context =  event.getServletContext();
		final HashMap<String,Long> map = new HashMap<String, Long>();
		context.setAttribute("courseOnline", map);
		//����һ���̼߳�������
		if(timer==null){
			timer = new Timer();
			timer.schedule(new TimerTask() {
				@Override
				public void run() {
					System.out.println("================��ʱ������ִ��==================");
					if(map.isEmpty()) return;
					Long now = System.currentTimeMillis();
					Iterator<String> keys = map.keySet().iterator();
				    String key = null;
				    while (keys.hasNext()){
				       key = (String) keys.next();
				       if (map.get(key)+5*60*1000<now){
				          keys.remove();
				      }
				    }
				}
			}, 1*1000, 5*60*1000);//һ���Ӻ�ִ��,ÿ�����ִ��һ��
		}
	}

}
