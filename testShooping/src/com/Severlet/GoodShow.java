package com.Severlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.User.GoodBean;
import com.goodsBean.GoodBeanBO;

public class GoodShow extends HttpServlet {

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
		req.setCharacterEncoding("utf-8");
		if(req.getParameter("kw").equals("datil"))
		{
			//System.out.println("鎵ц浜�);
		int id=Integer.parseInt(req.getParameter("id"));
		GoodBeanBO gbo=new GoodBeanBO();
		GoodBean gb=new GoodBean();
		gb=gbo.getGoods(id);
		//System.out.println(gb.getPhoto());
		req.setAttribute("good", gb);
		req.getRequestDispatcher("showGood.jsp").forward(req, res);
		}
		if(req.getParameter("kw").equals("fy"))
		{
			String pageNow=req.getParameter("pageNow");
			req.setAttribute("pageNow",pageNow);
			req.getRequestDispatcher("index.jsp").forward(req, res);
		}
		if(req.getParameter("kw").equals("select"))
		{
			if(req.getParameter("select")!=null)
			{
			if(!req.getParameter("select").equals("查找..."))
			{
			String goodsName=req.getParameter("select");
			//System.out.println("select锛�+goodsName);
			req.setAttribute("select", goodsName);          
			req.getRequestDispatcher("index.jsp").forward(req, res);
			}
			else{
				res.sendRedirect("index.jsp");
			}
			}
			else{
				res.sendRedirect("index.jsp");
			}
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

}
