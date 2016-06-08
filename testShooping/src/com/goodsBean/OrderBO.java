package com.goodsBean;


import java.text.SimpleDateFormat;
import java.util.*;

import com.DB.Conn;
import com.User.GoodBean;
import com.User.OrderInfo;
import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;
import com.mysql.jdbc.ResultSet;
import com.mysql.jdbc.Statement;

public class OrderBO {
	private Connection conn=null;
	private PreparedStatement sta=null;
	private ResultSet rs=null;
	/**
	 * @param 
	 * userId  用户Id 
	 * 生成订单  一起支付
	 */
	public OrderInfo orderSet(int userId,CartBO cb)
	{
		OrderInfo info=new OrderInfo();
		try {
			Date date= new Date(); 	
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String current = sdf.format(date);
			//System.out.println(current);
			UUID guid=UUID.randomUUID();               //获取guid 唯一标识符  得到订单号
			String str=guid.toString();
		    String strid=str.substring(0, 17);
			conn=new Conn().getConn();
			//conn.setAutoCommit(false);         事务非自动提交
			//conn.setTransactionIsolation(Connection.TRANSACTION_SERIALIZABLE);   事务隔离（窜行化）
			sta=(PreparedStatement) conn.prepareStatement("insert into orders(userId,datetime,payMode,isPayed,totalPrice,ordersId) values(?,?,?,?,?,?)");
			sta.setInt(1,userId );
			sta.setString(2,current); 
			sta.setString(3, "货到付款");
			sta.setString(4, "0");          //未付款
			sta.setFloat(5, cb.getPrice());
			sta.setString(6, strid);
			int a=sta.executeUpdate();
			if(a==1)
			{
				sta=(PreparedStatement) conn.prepareStatement("select ordersId from orders where ordersId='"+strid+"'");
				rs=(ResultSet) sta.executeQuery();
				String ordersId="";    
				if(rs.next())
				{
					ordersId=rs.getString(1);
				}
			 	ArrayList<GoodBean> list=cb.getGoods();
			    Statement sm= (Statement) conn.createStatement();
				for(GoodBean gb:list)
				{    //批量执行
					sm.addBatch("insert into orderdetail(ordersId,goodsId,nums,goodsPrice) VALUES('"+ordersId+"','"+gb.getGoodsId()+"','"+cb.numById(gb.getGoodsId()+"")+"','"+gb.getGoodsPrice()+"')");
					
				}
				sm.executeBatch();
				String sql="select id,username,truename, email, phone, address, grade,datetime,payMode,totalPrice,ordersId,isPayed,paydatetime from user u,orders o where o.ordersId=? and u.id=(select orders.userId from orders where orders.ordersId=?) ";
				sta=(PreparedStatement) conn.prepareStatement(sql);
				sta.setString(1,ordersId);
				sta.setString(2,ordersId );
				rs=(ResultSet) sta.executeQuery();
				if(rs.next())
				{
					info.setId(rs.getInt(1));
					info.setUsername(rs.getString(2));
					info.setTruename(rs.getString(3));
					info.setEmail(rs.getString(4));
					info.setAddress(rs.getString(6));
					info.setPhone(rs.getString(5));
					info.setDatetime(rs.getString(8));
					info.setPayMode(rs.getString(9));
					info.setTotalPrice(rs.getFloat(10));
					info.setOrdersId(rs.getString(11));
					info.setIsPayed(rs.getString(12));
					info.setPayDateTime(rs.getString(13));
				}
			//conn.commit();   事务提交	
		}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			//conn.rollback();  事务回滚
			//System.out.println();
		}finally{
			this.close();
		}
		return info;
	}
	/**
	 * 单个支付
	 */
	public OrderInfo orderSetById(int userId,CartBO cb,String goodsId)
	{
		OrderInfo info=new OrderInfo();
		try {
			Date date= new Date(); 	
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String current = sdf.format(date);
			//System.out.println(current);
			UUID guid=UUID.randomUUID();               //获取guid 唯一标识符  得到订单号
			String str=guid.toString();
		    String strid=str.substring(0, 17);
			conn=new Conn().getConn();
			sta=(PreparedStatement) conn.prepareStatement("insert into orders(userId,datetime,payMode,isPayed,totalPrice,ordersId) values(?,?,?,?,?,?)");
			sta.setInt(1,userId );
			sta.setString(2,current); 
			sta.setString(3, "货到付款");
			sta.setString(4, "0");          //未付款
			sta.setFloat(5, cb.priceById(goodsId));
			sta.setString(6, strid);
			int a=sta.executeUpdate();            //更新ordes表
			if(a==1)
			{
				sta=(PreparedStatement) conn.prepareStatement("select ordersId from orders where ordersId='"+strid+"'");
				rs=(ResultSet) sta.executeQuery();
				String ordersId="";    
				if(rs.next())
				{
					ordersId=rs.getString(1);
				}
			 	GoodBean gb=cb.getGoodsById(goodsId);
			    sta=(PreparedStatement) conn.prepareStatement("insert into orderdetail(ordersId,goodsId,nums,goodsPrice) VALUES('"+ordersId+"','"+gb.getGoodsId()+"','"+cb.numById(gb.getGoodsId()+"")+"','"+gb.getGoodsPrice()+"')");
				int b=sta.executeUpdate();
				if(b==1)
				{
				String sql="select id,username,truename, email, phone, address, grade,datetime,payMode,totalPrice,ordersId,isPayed,paydatetime from user u,orders o where o.ordersId=? and u.id=(select orders.userId from orders where orders.ordersId=?) ";
				sta=(PreparedStatement) conn.prepareStatement(sql);
				sta.setString(1,ordersId);
				sta.setString(2,ordersId );
				rs=(ResultSet) sta.executeQuery();
				if(rs.next())
				{
					info.setId(rs.getInt(1));
					info.setUsername(rs.getString(2));
					info.setTruename(rs.getString(3));
					info.setEmail(rs.getString(4));
					info.setAddress(rs.getString(6));
					info.setPhone(rs.getString(5));
					info.setDatetime(rs.getString(8));
					info.setPayMode(rs.getString(9));
					info.setTotalPrice(rs.getFloat(10));
					info.setOrdersId(rs.getString(11));
					info.setIsPayed(rs.getString(12));
					info.setPayDateTime(rs.getString(13));
				}
				}	
		}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			//conn.rollback();  事务回滚
			//System.out.println();
		}finally{
			this.close();
		}
		return info;
	}
	/**
	 * 付款更新操作
	 */
	public OrderInfo setPay(String orderId,String r2_TrxId,String payDate){
		OrderInfo info=new OrderInfo();
		try {
			conn=new Conn().getConn();
			sta=(PreparedStatement)conn.prepareStatement("UPDATE  orders set isPayed='1',payMode='易宝支付'," +
					"trxId='"+r2_TrxId+"',paydatetime='"+payDate+"'  where ordersId='"+orderId+"' ");
			int a=sta.executeUpdate();
			if(a==1)
			{
				System.out.println("更新成功！");
				sta=(PreparedStatement) conn.prepareStatement("select id,username,truename, email, phone, address, grade,datetime,payMode,totalPrice,ordersId,isPayed,trxId from user u," +
						"orders o where o.ordersId=? and u.id=(select orders.userId from orders where orders.ordersId=?)");
				sta.setString(1,orderId);
				sta.setString(2,orderId );
				rs=(ResultSet) sta.executeQuery();   
				if(rs.next())
				{
					info.setId(rs.getInt(1));
					info.setUsername(rs.getString(2));
					info.setTruename(rs.getString(3));
					info.setEmail(rs.getString(4));
					info.setAddress(rs.getString(6));
					info.setPhone(rs.getString(5));
					info.setDatetime(rs.getString(8));
					info.setPayMode(rs.getString(9));
					info.setTotalPrice(rs.getFloat(10));
					info.setOrdersId(rs.getString(11));
					info.setIsPayed(rs.getString(12));
					info.setTrxId(rs.getString(13));
				}
			}
		} catch (Exception e) {
			// TODO: handle exception
		    e.printStackTrace();
		}finally{
			this.close();
		}
		return info;
	}
	public void close()
    {
    	try {
			if(rs!=null)
			{
				rs.close();
				rs=null;
			}
			if(sta!=null)
			{
			    sta.close();
			    sta=null;
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
