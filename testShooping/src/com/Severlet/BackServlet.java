package com.Severlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.User.OrderInfo;
import com.goodsBean.OrderBO;
import com.yeepay.ConfigInfo;
import com.yeepay.DigestUtil;
import com.yeepay.PaymentForOnlineService;

public class BackServlet extends HttpServlet {

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
	public void doGet(HttpServletRequest req, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		response.setCharacterEncoding("GBK");
		PrintWriter out=response.getWriter();
		String hmac=req.getParameter("hmac");  // MD5签名数据  
		String p1_MerId=ConfigInfo.getVlaue("p1_MerId"); // 商户编号
		String r0_Cmd=req.getParameter("r0_Cmd");   // 业务类型
		String r1_Code=req.getParameter("r1_Code");  // 支付结果  1为成功
		String r2_TrxId=req.getParameter("r2_TrxId");  // 易宝支付交易流水号
		String r3_Amt=req.getParameter("r3_Amt");  // 支付金额
		String r4_Cur=req.getParameter("r4_Cur");  // 交易币种
		String r5_Pid=req.getParameter("r5_Pid");   // 商品名称
		String r6_Order=req.getParameter("r6_Order");   // 商户订单号
		String r7_Uid=req.getParameter("r7_Uid");  // 易宝支付会员ID
		String r8_MP=req.getParameter("r8_MP");// 商户扩展信息
		String r9_BType= req.getParameter("r9_BType");// 交易结果返回类型
		String keyValue=ConfigInfo.getVlaue("keyValue");  // 商家密钥
		String rp_PayData=req.getParameter("rp_PayDate");   //银行支付时间
		boolean isOK=PaymentForOnlineService.verifyCallback( hmac, p1_MerId,r0_Cmd, r1_Code,  r2_TrxId,  r3_Amt,
		r4_Cur,  r5_Pid,  r6_Order,  r7_Uid,r8_MP,  r9_BType,  keyValue);
		if(isOK) {
			//在接收到支付结果通知后，判断是否进行过业务逻辑处理，不要重复进行业务逻辑处理
			if(r1_Code.equals("1")) {
				//付款标致打1
				OrderBO ob=new OrderBO();
				OrderInfo info=ob.setPay(r6_Order,r2_TrxId,rp_PayData);
				req.setAttribute("info", info);
				
				// 产品通用接口支付成功返回-浏览器重定向
				if(r9_BType.equals("1")) {
					System.out.println("浏览器重定向");
					// 产品通用接口支付成功返回-服务器点对点通讯
				} else if(r9_BType.equals("2")) {
					// 如果在发起交易请求时	设置使用应答机制时，必须应答以"success"开头的字符串，大小写不敏感
					System.out.println("内部应答机制");
				  // 产品通用接口支付成功返回-电话支付返回		
				}
				req.getRequestDispatcher("orders.jsp").forward(req, response);
				// 下面页面输出是测试时观察结果使用
				out.println("<br>交易成功!<br>商家订单号:" + r6_Order + "<br>支付金额:" + r3_Amt + "<br>易宝支付交易流水号:" + r2_TrxId);
			}
		} else {
			req.setAttribute("message", "交易签名被篡改!");
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

		response.setContentType("text/html");
		this.doGet(request,response);
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
