/**
 * 购物车实现
 */
package com.goodsBean;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;

import com.DB.Conn;
import com.User.GoodBean;
import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;
import com.mysql.jdbc.ResultSet;

public class CartBO {
	private HashMap<String, Integer> hm=new HashMap<String, Integer>();
	private Connection conn=null;
	private PreparedStatement sta=null;
	private ResultSet rs=null;
	private float allPrice=0.0f;
	//获取物品数量
	public Integer numById(String id)
	{
		return hm.get(id);
	}
	//获取单个物品总价
	public float priceById(String id)
	{
		int num=this.numById(id);
		float price=0.0f;
		try {
			String sql="select goodsPrice from goods where goodsId='"+id+"'";
			conn=new Conn().getConn();
			sta=(PreparedStatement) conn.prepareStatement(sql);
			rs=(ResultSet) sta.executeQuery();
			if(rs.next())
			{
				price=rs.getFloat(1);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally{
			this.close();
		}
		return num*price;
	}
	//获取总价
	public float getPrice()
	{
		return allPrice;
	}
	//添加货物
    public void addCart(String id,int num )
    {
    	Iterator<String> it=hm.keySet().iterator();
    	boolean mit=false;
    	if(it.hasNext())
    	{                                     //有相同商品时加一
    		if(it.next().equals(id))
    		{
    			mit=true;
    		}
    	}
    	if(mit){
    		hm.put(id,hm.get(id)+1);
    	}else
    	{
    	hm.put(id, num);
    	}
    }
    //删除货物
    public void delCart(String id)
    {
    	hm.remove(id);
    }
    //更新货物
    public void upCart(String id,int num)
    {
    	try {
    		 int fil=0;
    		 conn=new Conn().getConn();
  		     sta=(PreparedStatement) conn.prepareStatement("select goodsNum from goods where goodsId='"+id+"'");
  		     rs=(ResultSet) sta.executeQuery();
  		     if(rs.next())
  		     {
  		    	 fil=rs.getInt(1);
  		     }
  		     if(num>fil)
  		     {
  		    	 num=fil;
  		     }
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally{
			this.close();
		}
    	hm.put(id, num);
    }
    //清空
    public void claer()
    {
    	hm.clear();
    }
    /**
     * 购物车获取
     * @return List
     */
    public ArrayList<GoodBean> getGoods()
    {
    	ArrayList<GoodBean> list=new ArrayList<GoodBean>();
    	try {
    		String sql= "select * from goods where goodsId in";
    		Iterator<String> it=hm.keySet().iterator();
    		String str="(";
    		int i=0;
    		while(it.hasNext())
    		{
    			i++;
    			String str1=it.next();
    			if(it.hasNext())
    			{
    			str+=str1+",";
    			}
    			else{
    				str+=str1+")";
    			}
    			
    		}
    		sql+=str;
    		allPrice=0.0f;
    		if(i>0)
    		{
		   conn=new Conn().getConn();
		   sta=(PreparedStatement) conn.prepareStatement(sql);
		   System.out.println(sql);
		   rs=(ResultSet) sta.executeQuery();
		   while(rs.next())
		   {
			    GoodBean gb=new GoodBean();
			    int id=rs.getInt(1);
		    	gb.setGoodsId(id);
				gb.setGoosName(rs.getString(2));
				gb.setGoodsIntro(rs.getString(3));
				float price=rs.getFloat(4);
				gb.setGoodsPrice(price);
				int num=rs.getInt(5);
				gb.setGoodsNum(num);
				gb.setPublisher(rs.getString(6));
				gb.setPhoto(rs.getString(7));				
				gb.setType(rs.getString(8));				
				this.allPrice=this.allPrice+price*this.numById(id+"");  //获取总价
				list.add(gb);
		   }
    	}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally{
			this.close();
		}
    	return list;
    }
    /**
     * 单个商品获取
     */
    public GoodBean getGoodsById(String id)
    {
    	GoodBean gb=null;
    	try {
		   conn=new Conn().getConn();
		   sta=(PreparedStatement) conn.prepareStatement("select * from goods where goodsId =?");
		   sta.setString(1, id);
		   rs=(ResultSet) sta.executeQuery();
		   if(rs.next())
		   {
			    gb=new GoodBean();
			    int goodsId=rs.getInt(1);
		    	gb.setGoodsId(goodsId);
				gb.setGoosName(rs.getString(2));
				gb.setGoodsIntro(rs.getString(3));
				float price=rs.getFloat(4);
				gb.setGoodsPrice(price);
				int num=rs.getInt(5);
				gb.setGoodsNum(num);
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
     * 资源关闭
     */
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
