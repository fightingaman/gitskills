<%@ page language="java" import="java.util.*,com.User.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%

OrderInfo info=new OrderInfo();
if(request.getAttribute("info")!=null)
{
    info=(OrderInfo)request.getAttribute("info");
    if(info.getIsPayed().equals("0"))
    {
        info.setIsPayed("未付款");
    }
    if(info.getIsPayed().equals("1")){
       info.setIsPayed("已付款");
    }
   System.out.println("shijian"+info.getDatetime());
   }
   //session获取
   String userid="";
   if(session.getAttribute("userid")!=null){
    userid=session.getAttribute("userid").toString();
   //System.out.println(userid);
   }
 %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>用户订单</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords"
	content="Movie_store Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<link href="css/bootstrap.css" rel='stylesheet' type='text/css' />
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<link href="css/order1.css" rel="stylesheet" type="text/css" media="all" />
<link href="css/order2.css" rel="stylesheet" type="text/css" media="all" />
<link href="css/order3.css" rel="stylesheet" type="text/css" media="all" />
<script type="text/javascript" src="js/jquery-1.11.1.min.js"></script>
<script src="js/responsiveslides.min.js"></script>
<script src="js/fiter.js"></script>
</head>
<body>
	<div class="container" style="width: auto;height: auto;margin-right:5%;margin-left: 5%;margin-top: -30px">
		<div class="container_wrap">
			<div class="header_top">
				<div class="col-sm-3 logo">
					<a href="index.jsp"><img src="images/logo.png" alt="" />
					</a>
				</div>
				<div class="col-sm-3 header_right" style="margin-left:550px">
					<ul class="header_right_box">
						<li><img src="images/p1.png" alt="" />
						</li>
						<li><p id="me1" style="display:none;">
								<a href="login.jsp">登录/注册</a>
							</p>
						</li>
						<!-- 
						<li id="li" style="display:none;"><p id="me">欢迎您:<%=userid%></p>
							<small><a href="Login?kw=exit" onclick="return out()">[退出登录]</a>
						</small>
						</li>
						 -->
						 <li id="li" class="litag" style="display:none;"><p id="me">欢迎您:<%=userid%></p>
							<dl>
								<dd>
									<a href="register.jsp">我的订单</a>
								</dd>
								<dd>
									<a  href="MyCart">我的购物车</a>
								</dd>
							</dl>
							</li>
							<small><a id="li2" href="Login?kw=exit" onclick="return out() ">[退出登录]</a>
						</small>

					</ul>
				</div>
			</div>
			<div class="content" style="background:white;">
				<div class="register">
				<div class="content">
					<div style="text-align: center;">
						<img src="images/cart3.gif" />
					</div>
					</div>
					<div class="order-info" style="width:950px;margin:20px auto;">
						<ul class="tabpanel">
							<li class="current"><span><h2>订单信息</h2>
							</span>
							</li>
						</ul>
						<div class="order-info-content">
							<div class="order-main-info clearfix">
								<h2>订单信息</h2>
								<div class="order-number">
									<span>订单编号：</span> <span><%=info.getOrdersId() %></span>
								</div>				
								<div class="order-time">
									<span>下单时间：</span> <span><%=info.getDatetime() %></span>
									
								</div>
								<!--  
								<div class="pay-time">
									<span>付款时间：</span> <span>2015-12-20 18:17:12</span>
								</div>
								-->
								<!-- 已购买产品list -->
								<table class="order-table">
									<thead>
										<tr>
											<th class="single-price" >订单编号</th>
											<th class="protype">联系人</th>
											<th class=" baobei">收货地址</th>
											<th class=" operate-state">联系方式</th>
											 <th class="freight">付款状态</th> 	
											<th class="all-totle-price">宝贝总价</th>
											<th class="freight" >电子邮件</th>
										</tr>
									</thead>
									<!-- 已购买产品list -->
									<tbody>

										<tr>
											<td class="goods-name">
											<%=info.getOrdersId() %>
											</td>
											<td><%=info.getUsername() %></td>	
											<td><%=info.getAddress() %></td>
											<td><%=info.getPhone() %></td>
											<!-- 联系方式 -->
											  <td><%=info.getIsPayed()%></td>
											<!-- 邮编 -->							
											<td rowspan="1"><%=info.getTotalPrice() %>元</td>
											<!-- 总价 -->	
											<td rowspan="1"><%=info.getEmail() %></td>
											<!-- 电子邮件-->											
										</tr>
									</tbody>
								</table>
							<form method="post" action="reqpay.jsp" name="form1" >
			<div style="display: none">商品订单号:<input type="hidden" name="p2_Order" id="p2_Order" value="<%=info.getOrdersId()%>"/></div>
			<div style="display: none">支付金额:<input type="hidden" name="p3_Amt" id="p3_Amt" value="<%=info.getTotalPrice() %>" />&nbsp;<span style="color:#FF0000;font-weight:100;">*</span></div>
			<div style="display: none">商品名称:<input type="hidden" name="p5_Pid" id="p5_Pid" value="productname" /></div>
			<div style="display: none">商品种类:<input type="hidden" name="p6_Pcat" id="p6_Pcat" value="producttype" /></div>
			<div style="display: none">商品描述:<input type="hidden" name="p7_Pdesc" id="p7_Pdesc" value="productdesc" /></div>
			<div style="display: none">商户接收支付成功数据的地址:<input type="text" name="p8_Url" id="p8_Url" value="http://localhost:8888/testShooping/BackServlet"/>&nbsp;<span style="color:#FF0000;font-weight:100;">*</span></div>
			<!--<div>
				是否需要送货地址:<select name="p9_SAF" id="p9_SAF">
					<option value="0" >不需要
					</option>
					<option value="1">需要
					</option>
				</select>
			</div>
			-->
			<div style="display: none">商家扩展信息:<input type="hidden" name="pa_MP" id="pa_MP" value="userId or other" /></div>
			<div style="display: none">支付通道编码:<input type="hidden" name="pd_FrpId" id="pd_FrpId" /><!--֧��ͨ���������ױ�֧����Ʒ(HTML��)ͨ�ýӿ�ʹ��˵����--></div>
			
			<div style="display: none"><input type="submit" value="付款" /></div>
			</form>
			<div class="down_btn" style="float:right;">
						<a class="btn1" onclick="document.form1.submit()">付款</a>
					</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>