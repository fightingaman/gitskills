package com.Severlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.User.GoodBean;
import com.User.OrderInfo;
import com.goodsBean.CartBO;
import com.goodsBean.GoodBeanBO;
import com.goodsBean.OrderBO;

public class Order extends HttpServlet {
	
	/**
	 * Constructor of the object.
	 */
	public Order() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {

		res.setContentType("text/html");
		res.setCharacterEncoding("utf-8");
		CartBO cb=(CartBO)req.getSession().getAttribute("cart");       //从session中获取cart
		OrderBO ob=null;
		if(req.getSession().getAttribute("userid")!=null)
		{
		String goodsId=req.getParameter("id");
		String kw=req.getParameter("kw");
		if(kw.equals("order"))
		{		
		 ob=new OrderBO();
		ArrayList<GoodBean> list=cb.getGoods();
		//判断购物车是个否为空
		if(list.size()!=0)
		{
		String name=req.getSession().getAttribute("name").toString();  
		int userId=new GoodBeanBO().getUserId(name);               //通过name获取id
		OrderInfo info=new OrderInfo();
		info=ob.orderSet(userId, cb);
		req.getSession().setAttribute("info", info);
		cb.claer();  //清空购物车
		res.sendRedirect("GoShow");
		}else{
			res.sendRedirect("fail.jsp");
		}
		}
		/**
		 * 单个下单
		 */
		else if(kw.equals("orderById"))
		{
			
		    ob=new OrderBO();
			//pandaun购物车是否为空
			ArrayList<GoodBean> list=cb.getGoods();
			if(list.size()!=0&&cb.numById(goodsId)!=null)
			{
			System.out.println("物品数量："+cb.numById(goodsId));
			String name=req.getSession().getAttribute("name").toString();  
			int userId=new GoodBeanBO().getUserId(name);               //通过name获取id
			OrderInfo info=new OrderInfo();
			info=ob.orderSetById(userId,cb,goodsId);
			req.getSession().setAttribute("info", info);
			cb.delCart(goodsId);  //删除下单的商品
			res.sendRedirect("GoShow");
			}else{
				res.sendRedirect("fail.jsp");
			}
		}
		else{
			res.sendRedirect("goodsCart.jsp");
		}
		}else{
			res.sendRedirect("login.jsp");
		}
		
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		this.doGet(request, response);
	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
