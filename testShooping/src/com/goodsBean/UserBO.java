package com.goodsBean;

import com.DB.Conn;
import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;
import com.mysql.jdbc.ResultSet;

public class UserBO {

	private Connection conn=null;
	private PreparedStatement sta=null;
	private ResultSet rs=null;
	/**
	 * 用户注册
	 * 
	 */
	public boolean setUser(String username,String pw,String email,String turename,String phone)
	{
		try {
			conn=new Conn().getConn();
			sta=(PreparedStatement) conn.prepareStatement("INSERT into `user`(username,password,truename,email,phone) VALUES('"+username+"','"+pw+"','"+turename+"','"+email+"','"+phone+"')");
			int a= sta.executeUpdate();
			if(a==1)
			{
				return true;
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally{
			this.close();
		}
		return false;
	}
	public boolean checkUsername(String username)
	{
		 try {
			 conn=new Conn().getConn();
			sta=(PreparedStatement) conn.prepareStatement("select username from user where username='"+username+"'");
			rs=(ResultSet) sta.executeQuery();
			if(rs.next())
			{
				return true;
			}else{
				return false;
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally{
			this.close();
		}
		 return false;
	}
	public void close(){
		try {
			if(rs!=null)
			{
				rs.close();
				rs=null;        //置为空,垃圾回收机制回收
			}
			if(sta!=null)
			{
				sta.close();
				rs=null;
			}
			if(conn!=null)
			{
				conn.close();
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
	
}
