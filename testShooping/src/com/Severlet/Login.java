package com.Severlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.goodsBean.GoodBeanBO;
import com.goodsBean.UserBO;

public class Login extends HttpServlet {

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
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
		request.setCharacterEncoding("utf-8");// 解决数据库不能验证中
		if (request.getParameter("kw").equals("login")) {
			String name = request.getParameter("username");
			String pw = request.getParameter("password");
			if (new GoodBeanBO().checkUser(name, pw)) {
				HttpSession user = request.getSession();
				user.setAttribute("userid", name); // 用户存入session
				// user.setMaxInactiveInterval(3600); 设置session有效时间
				//System.out.println("验证通过了！");
				HttpSession session = request.getSession();
				session.setAttribute("name", name);
				response.sendRedirect("index.jsp");
			} else if (request.getSession().getAttribute("name") != null) {
				response.sendRedirect("index.jsp");
			} else {
				response.sendRedirect("login.jsp");
			}
		}
		if (request.getParameter("kw").equals("exit")) {
			request.getSession().invalidate();
			response.sendRedirect("index.jsp");
		}
		if (request.getParameter("kw").equals("set")) {
			UserBO ub= new UserBO();
			if(ub.setUser(request.getParameter("username"),request.getParameter("password"),
					request.getParameter("email"), request.getParameter("firstname"),request.getParameter("phone")))
			{
				response.getWriter().print("true");
				System.out.println("注册成功！");
			}
			else{
				System.out.println("登录失败！");
				response.getWriter().print("false");
			}
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

		response.setContentType("text/html");
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
