package com.Severlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.goodsBean.UserBO;

public class Userset extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public Userset() {
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
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");
		//PrintWriter out = response.getWriter();
		String str=request.getParameter("username");
		//System.out.println(str);
		UserBO bo=new UserBO();
		//防止乱码
		//byte []  cc = str.getBytes("iso-8859-1");
		//String username=new String(cc,"utf-8");
		//System.out.println(str);
		if(bo.checkUsername(str))
		{
			//System.out.println("111");
		    response.getWriter().print("true");
		}
		else{
			//System.out.println("112");
			response.getWriter().print("false");
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
