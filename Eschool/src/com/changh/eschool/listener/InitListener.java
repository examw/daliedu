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
 *	容器启动时监听
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
		System.out.println("contextInitialized容器初始化");
		ServletContext context =  event.getServletContext();
		final HashMap<String,Long> map = new HashMap<String, Long>();
		context.setAttribute("courseOnline", map);
		//启动一个线程监听数据
		if(timer==null){
			timer = new Timer();
			timer.schedule(new TimerTask() {
				@Override
				public void run() {
					System.out.println("================定时程序在执行==================");
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
			}, 1*1000, 5*60*1000);//一分钟后执行,每五分钟执行一次
		}
	}

}
