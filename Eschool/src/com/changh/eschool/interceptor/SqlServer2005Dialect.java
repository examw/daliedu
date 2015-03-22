package com.changh.eschool.interceptor;

import com.changh.eschool.dialect.SQLServer2005Dialect;

public class SqlServer2005Dialect extends SQLServer2005Dialect {
	 public SqlServer2005Dialect() {   
	        super();   
	        registerHibernateType(1, "string");   
	        registerHibernateType(-9, "string");   
	        registerHibernateType(-16, "string");   
	        registerHibernateType(3, "double");   
	    }   
}
