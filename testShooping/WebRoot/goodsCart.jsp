<%@page import="com.User.GoodBean"%>
<%@ page language="java" import="java.util.*,com.goodsBean.*"
	pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()
	+ path + "/";
	 ArrayList<GoodBean> list=new ArrayList<GoodBean>();		
	if(request.getAttribute("list")!=null)
	{
		 
	 list = (ArrayList<GoodBean>) request.getAttribute("list");
	}
	CartBO cb = (CartBO) session.getAttribute("cart");
	//System.out.println("dahg"+cb.numById("1"));
%>
<%
	//session获取
	String userid = "";
	if (session.getAttribute("userid") != null) {
		userid = session.getAttribute("userid").toString();
		System.out.println(userid);
	}
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>我的购物车</title>
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
<script src="js/fiter.js"></script>
<script type="text/javascript" src="js/chinaCity.js"></script>
<!-- start plugins -->
<script type="text/javascript" src="js/jquery-1.11.1.min.js"></script>
<script type="text/javascript">
function setOrder(){
var list="<%=list%>";
if(list!=null&&list!="[]")
{
if(document.getElementById("county").value!='市、县级市、县')
{
	   if(confirm("确认下单吗？"))
	   {
	      document.form2.submit();
	   }
	   else{
	      return false;
	   }
	   }
	   else{
	    alert('请先确认收货地址！');
	    return false;
	   }
	   }
	   else{
	    alert('亲，先去选购喜爱的商品吧！');
	    return false;
	   }
	}

	</script>
</head>
<body>

	<div class="container"
		style="width: auto;height: auto;margin-right:5%;margin-left: 5%;margin-top: -30px">
		<div class="container_wrap">
			<div class="header_top">
				<div class="col-sm-3 logo">
					<a href="index.jsp"><img src="images/logo.png" alt="" /> </a>
				</div>
				<div class="col-sm-3 header_right" style="margin-left: 520px">
					<ul class="header_right_box">
						<li><img src="images/p1.png" alt="" /></li>
						<li><p id="me1" style="display:none;">
								<a href="login.jsp">登录/注册</a>
							</p></li>
						<!--  
						<li id="li" style="display:none;"><p id="me">欢迎您:<%=userid%></p>
							<small><a href="Login?kw=exit" onclick="return out()">[退出登录]</a>
						</small>
						</li>
						-->
						<li id="li" class="litag" style="display:none;"><p id="me">
								欢迎您:<%=userid%></p>
							<dl>
								<dd>
									<a href="register.jsp">我的订单</a>
								</dd>
								<dd>
									<a href="MyCart">我的购物车</a>
								</dd>
							</dl></li>
						<small><a id=li2 " href="Login?kw=exit"
							onclick="return out() ">[退出登录]</a> </small>
					</ul>
				</div>
				<div class="clearfix"></div>
			</div>
			<!-- 防止刷新传参 -->
			<form action="Order?kw=order" method="post" name="form2">
				<input type="hidden" value="" name="goodsId">
			</form>
			<form action="MyCart?kw=mon" method="post" name="form1">
				<div class="content" style="background:white;">
					<div style="text-align: center;">
						<img src="images/cart1.gif" />
					</div>

					<div class="order-info" style="width:950px;margin:20px auto;">
						<ul class="tabpanel">
							<li class="current"><span><h2>购物车信息</h2> </span></li>
						</ul>
						<div class="order-info-content">

							<div class="order-main-info clearfix">
								<h2>购物车信息</h2>
								<div>
									<strong>配送至: </strong> <select name="province" id="province">
									</select> <select name="city" id="city">
									</select> <select name="county" id="county">
									</select>
								</div>
								<!-- 已购买产品list -->
								<table class="order-table">
									<thead>
										<tr>
											<th class="baobei">电影名称</th>
											<th class="freight">电影类型</th>
											<!-- <th class="baobei-number">邮编</th> -->
											<th class="all-totle-price">单价(元)</th>
											<th class="baobei" colspan="3">操作</th>
											<th class="baobei-number">小计</th>
										</tr>
									</thead>

									<!-- 已购买产品list -->
									<tbody>
										<%
											for (GoodBean gb : list) {
										%>
										<tr>
											<td id="tr1"><%=gb.getGoosName()%></td>
											<td><%=gb.getType()%></td>
											<td><%=gb.getGoodsPrice()%>元</td>
											<!-- 联系方式 -->
											<!--  <td></td>-->
											<!-- 邮编 -->
											<td><input type="hidden" name="id"
												value="<%=gb.getGoodsId()%>"><input id="text"
												name="num" type="text" style="width:40px"
												value="<%=cb.numById(gb.getGoodsId() + "")%>" /> 张</td>
											<td><a href="MyCart?kw=del&id=<%=gb.getGoodsId()%>">删除</a>
											</td>
											<td><a href="Order?kw=orderById&id=<%=gb.getGoodsId()%>" onclick="return setOrder()">下单</a>
											</td>
											<td><%=cb.priceById(gb.getGoodsId()+"")%></td>
										</tr>
										<%
											}
										%>
									</tbody>
								</table>
							</div>
						</div>
					</div>

					<!--  
					<table
						style="margin-right: auto;margin-left: auto;margin-top: 50px"
						border="1">
						<tr align="center">
							<td width="200px">电影名称</td>
							<td width="200px">电影类型</td>
							<td width="100px">单价</td>
							<td width="220px" colspan="3">操作</td>
						</tr>
						<%for (GoodBean gb : list) {%>
						<tr align="center">
							<td><%=gb.getGoosName()%></td>
							<td><%=gb.getType()%></td>
							<td><%=gb.getGoodsPrice()%>元</td>
							<td><input type="hidden" name="id"
								value="<%=gb.getGoodsId()%>"><input id="text" name="num"
								type="text" style="width:40px"
								value="<%=cb.numById(gb.getGoodsId() + "")%>" />
							</td>
							<td><a href="MyCart?kw=del&id=<%=gb.getGoodsId()%>">删除</a>
							</td>
							<td><a href="GoodShow?kw=datil&id=<%=gb.getGoodsId()%>">下单</a>
							</td>
						</tr>
						<%}%>

					</table>
					-->
					<p
						style=" margin-left:10%;margin-top:20px;font-size: 20px;color: red;">
						<strong>总计:</strong><%=cb.getPrice()%>元
					</p>
					<a class="btn1" style="margin-left:85%" onclick="return setOrder()">结算</a>
					<div style="text-align: center;">
						<a class="btn1" href="MyCart?kw=dall" onclick="return reset()">清空购物车</a>
						<!-- submit功能 -->
						<a class="btn1" onclick="document.form1.submit()">更新购物车</a>
					</div>
					<p class="m_4" style="text-align: center">
						还需购买,点击<a href="index.jsp">此处</a>返回首页
					</p>
				</div>
			</form>
		</div>
	</div>
	<script type="text/javascript">
 setup();
</script>
	<div class="container"
		style="width: auto;height: auto;margin-right:5%;margin-left: 5%">
		<div id="footer-3d">
			<div class="gp-container">
				<span class="first-widget-bend"></span>
			</div>
		</div>
		<div id="footer-widgets" class="gp-footer-larger-first-col">
			<div class="gp-container">
				<div class="footer-widget footer-1">
					<div class="wpb_wrapper">
						<img src="images/f_logo.png" alt="" />
					</div>
					<br>
					<p>欢迎来到白菜影院.悠久的历史和极佳的观赏体验让你爱不释手</p>
				</div>
				<div class="footer_box">
					<div class="col_1_of_3 span_1_of_3">
						<h3>电影类型</h3>
						<ul class="first">
							<li><a href="#">国产电影</a></li>
							<li><a href="#">欧美大片</a></li>
							<li><a href="#">爱情电影</a></li>
						</ul>
					</div>
					<div class="col_1_of_3 span_1_of_3">
						<h3>信息</h3>
						<ul class="first">
							<li><a href="#">New products</a></li>
							<li><a href="#">top sellers</a></li>
							<li><a href="#">Specials</a></li>
						</ul>
					</div>
					<div class="col_1_of_3 span_1_of_3">
						<h3>关于我们</h3>
						<ul class="first">
							<li><a href="#">QQ</a></li>
							<li><a href="#">人人网</a></li>
							<li><a href="#">微信</a></li>
						</ul>

					</div>
					<div class="clearfix"></div>
				</div>
				<div class="clearfix"></div>
			</div>
		</div>
	</div>
</body>
</html>
