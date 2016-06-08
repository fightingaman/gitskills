package com.goodsBean;

import java.util.ArrayList;

import com.DB.Conn;
import com.User.GoodBean;
import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;
import com.mysql.jdbc.ResultSet;

public class GoodBeanBO {

	private Connection conn=null;
	private PreparedStatement sta=null;
	private ResultSet rs=null;
	private int pageCount=0;      //共有几页
	public int getPageCount() {
		//System.out.println(pageCount);       
		return pageCount;
	}
	public void setPageCount(int pageCount) {
		this.pageCount = pageCount;
	}
	/**
	 * 用户验证
	 * 
	 */
	public boolean checkUser(String name,String pw)
	{
		try {
			conn=new Conn().getConn();
			sta=(PreparedStatement) conn.prepareStatement("select password from user where username='"+name+"' limit 1");
			rs=(ResultSet) sta.executeQuery();
			if(rs.next())
			{
				String str=rs.getString(1);
				if(str.equals(pw))
				{
					return true;
				}
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return false;
	}
	/**
	 * 获取用户id
	 */
	public int getUserId(String username)
	{
		int userId=0;
		try {
			conn=new Conn().getConn();
			sta=(PreparedStatement) conn.prepareStatement("select id from user where username='"+username+"' limit 1");
			rs=(ResultSet) sta.executeQuery();
			if(rs.next())
			{
				userId=rs.getInt(1);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		finally{
			this.close();
		}
		return userId;
	}
	/**
	 * 首页搜索
	 */
	public ArrayList<GoodBean> selectGoods(int pageSize,int pageNow,String name)
	{
		int rowCount=0;                   //数据库记录条数
		ArrayList<GoodBean> list=new ArrayList<GoodBean>();
		Conn co=new Conn();
		try{
		conn=co.getConn();
		sta=(PreparedStatement) conn.prepareStatement("select count(*) from goods where goodsName like ('%"+name+"%')");
		rs=(ResultSet) sta.executeQuery();
		if(rs.next())
		{
			rowCount=rs.getInt(1);
		}
		if(rowCount%pageSize==0)
	 	{
	 		pageCount=rowCount/pageSize;
	 	}
	 	else{
	 		pageCount=rowCount/pageSize+1;
	 	}
	    sta=(PreparedStatement) conn.prepareStatement("select * from goods where goodsName like ('%"+name+"%') limit "+(pageNow-1)*pageSize+","+pageSize+" ");
	    rs=(ResultSet) sta.executeQuery();
	    while(rs.next())
	    {
	    	GoodBean gb=new GoodBean();
	    	gb.setGoodsId(rs.getInt(1));
			gb.setGoosName(rs.getString(2));
			gb.setGoodsIntro(rs.getString(3));
			gb.setGoodsPrice(rs.getFloat(4));
			gb.setGoodsNum(rs.getInt(5));
			gb.setPublisher(rs.getString(6));
			gb.setPhoto(rs.getString(7));				
			gb.setType(rs.getString(8));
			list.add(gb);
	
	    }
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally{
			this.close();
		}
		return list;
	}
	/**
	 * 物品详细显示
	 * @param id
	 * @return
	 */
	public GoodBean getGoods(int id)
	{
		GoodBean gb=new GoodBean();
		try {
			conn=new Conn().getConn();
			sta=(PreparedStatement) conn.prepareStatement("select * from goods where goodsId='"+id+"'");
			//sta.setInt(1,id);
			rs=(ResultSet) sta.executeQuery();
			if(rs.next())
			{
				gb.setGoodsId(rs.getInt(1));
				gb.setGoosName(rs.getString(2));
				gb.setGoodsIntro(rs.getString(3));
				gb.setGoodsPrice(rs.getFloat(4));
				gb.setGoodsNum(rs.getInt(5));
				gb.setPublisher(rs.getString(6));
				gb.setPhoto(rs.getString(7));				
				gb.setType(rs.getString(8));
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally{
			this.close();
		}
		return gb;
	}
	/**
	 * 分页
	 */
public ArrayList<GoodBean> setPage(int pageSize,int pageNow){
		
		int rowCount=0;                   //数据库记录条数
		ArrayList<GoodBean> list=new ArrayList<GoodBean>();
		Conn co=new Conn();
		try{
		conn=co.getConn();
		sta=(PreparedStatement) conn.prepareStatement("select count(*) from goods");
		rs=(ResultSet) sta.executeQuery();
		if(rs.next())
		{
			rowCount=rs.getInt(1);
		}
		if(rowCount%pageSize==0)
	 	{
	 		pageCount=rowCount/pageSize;
	 	}
	 	else{
	 		pageCount=rowCount/pageSize+1;
	 	}
	    sta=(PreparedStatement) conn.prepareStatement("select * from goods limit "+(pageNow-1)*pageSize+","+pageSize+" ");
	    rs=(ResultSet) sta.executeQuery();
	    while(rs.next())
	    {
	    	GoodBean gb=new GoodBean();
	    	gb.setGoodsId(rs.getInt(1));
			gb.setGoosName(rs.getString(2));
			gb.setGoodsIntro(rs.getString(3));
			gb.setGoodsPrice(rs.getFloat(4));
			gb.setGoodsNum(rs.getInt(5));
			gb.setPublisher(rs.getString(6));
			gb.setPhoto(rs.getString(7));				
			gb.setType(rs.getString(8));
			list.add(gb);
	
	    }
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally{
			this.close();
		}
		return list;
	}
/**
 *  资源关闭
 */
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
