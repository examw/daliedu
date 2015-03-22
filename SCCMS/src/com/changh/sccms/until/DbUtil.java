package com.changh.sccms.until;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.Properties;

import javax.sql.DataSource;

import org.apache.commons.dbcp.BasicDataSourceFactory;

public class DbUtil {
	//数据源连接池对象
	private static DataSource dataSource = null;
	//将一个对象和线程绑定
	private static ThreadLocal<Connection> connLocal = 
						new ThreadLocal<Connection>();
	
	static{
		try{
		Properties props = new Properties();
		//加载db.properties配置参数
		props.load(DbUtil.class.getClassLoader()
				.getResourceAsStream("db.properties"));
		//利用dbcp组件创建dataSource对象
		dataSource = BasicDataSourceFactory
					.createDataSource(props);
		}catch(Exception ex){
			ex.printStackTrace();
		}
	}
	
	public static Connection getConnection() throws SQLException{
		//获取和当前线程相关的connection
		Connection conn = connLocal.get();
		if(conn == null || conn.isClosed()){//如果没有,或已关闭
			conn = dataSource.getConnection();//获取新的connection
			connLocal.set(conn);
		}
		return conn;
	}
	
	public static void closeConnection(){
		//获取和当前线程相关的connection
		Connection conn = connLocal.get();
		//清除和线程绑定的conn
		connLocal.set(null);//为下一次调用getConnection要新建
		try {
			if(conn != null){
				conn.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
}
