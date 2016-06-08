package com.Severlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.User.GoodBean;
import com.goodsBean.CartBO;

public class MyCart extends HttpServlet {

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
	 * @param request
	 *            the request send by the client to the server
	 * @param response
	 *            the response send by the server to the client
	 * @throws ServletException
	 *             if an error occurred
	 * @throws IOException
	 *             if an error occurred
	 */
	public void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {

		res.setContentType("text/html");
		req.setCharacterEncoding("utf-8");
		//System.out.println(""+req.getParameter("province"));
		if (req.getSession().getAttribute("userid") != null) {
			String id = req.getParameter("id");
			String kw = req.getParameter("kw");
			CartBO cb = (CartBO) req.getSession().getAttribute("cart"); // 获取存在session中的对象
			if (cb == null) {
				cb = new CartBO(); // 创建对象，放入session中
				req.getSession().setAttribute("cart", cb);
			}
			if(kw!=null)
			{
			if (kw.equals("ad")) {
				cb.addCart(id, 1); // 添加货物
			}
			if (kw.equals("del")) {
				cb.delCart(id); // 删除购物车货物
			}
			if (kw.equals("dall")) {
				cb.claer();
			}
			if (kw.equals("mon")) {
				String goodsid[] = req.getParameterValues("id");
				String num[] = req.getParameterValues("num");
				if (goodsid != null) {
					for (int i = 0; i < goodsid.length; i++) {
						//System.out.println("标号：" + goodsid[i] + " 数量：" + num[i]);
						cb.upCart(goodsid[i], Integer.parseInt(num[i]));
					}
				}
			}
			}
			// ArrayList<GoodBean> list=cb.getGoods();
			// req.setAttribute("list",list);
			// req.getRequestDispatcher("goodsCart.jsp").forward(req, res);
			res.sendRedirect("Goods");
		} else {
			res.sendRedirect("login.jsp");
		}
	}

	/**
	 * The doPost method of the servlet. <br>
	 * 
	 * This method is called when a form has its tag value method equals to
	 * post.
	 * 
	 * @param request
	 *            the request send by the client to the server
	 * @param response
	 *            the response send by the server to the client
	 * @throws ServletException
	 *             if an error occurred
	 * @throws IOException
	 *             if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		this.doGet(request, response);
	}

	/**
	 * Initialization of the servlet. <br>
	 * 
	 * @throws ServletException
	 *             if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
