package com.changh.sccms.log;

import java.sql.Connection;
import java.sql.SQLException;

import org.apache.log4j.jdbc.JDBCAppender;
import org.apache.log4j.spi.LoggingEvent;
import org.hibernate.SessionFactory;

public class MyJDBCAppender extends JDBCAppender{
	private SessionFactory sessionFactory;
	
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	@Override
	protected Connection getConnection() throws SQLException {
		// TODO Auto-generated method stub
		return sessionFactory.getCurrentSession().connection();
	}
	@Override
	protected String getLogStatement(LoggingEvent event) {
		// TODO Auto-generated method stub
		return super.getLogStatement(event);
	}
	@Override
	protected void closeConnection(Connection con) {
		// TODO Auto-generated method stub
		super.closeConnection(con);
	}
}
