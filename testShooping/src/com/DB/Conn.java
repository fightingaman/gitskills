package com.DB;

import java.sql.DriverManager;

import com.mysql.jdbc.Connection;

/**
 * 得到conn链接
 * @author a
 *
 */
public class Conn {
    
	private Connection conn=null;
	public Connection getConn()
	{
		try {
		    Class.forName("com.mysql.jdbc.Driver");
		    conn=(Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/shopping?useUnicode=true&characterEncoding=UTF-8","root","123456" );
		    
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return conn;
	}
}
