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
    }else{
       info.setIsPayed("已付款");
    }
   
   }
 %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Home</title>
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
</head>
<body>
	<div class="container" style="width: auto;height: auto;margin-right:10%;margin-left: 10%;margin-top: -30px">
		<div class="container_wrap">
			<div class="header_top">
				<div class="col-sm-3 logo">
					<a href="index.jsp"><img src="images/logo.png" alt="" />
					</a>
				</div>
				<div class="clearfix"></div>
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
								<h2>付款信息</h2>
								<div class="order-number">
									<span>订单编号：</span> <span><%=info.getOrdersId() %></span>
								</div>
								
								<div class="order-time">
									<span>下单时间：</span> <span><%=info.getDatetime()%></span>
								</div>
								<div class="pay-time">
									<span>付款时间：</span> <span><%=info.getPayDateTime() %></span>
								</div>
								<!-- 已购买产品list -->
								<table class="order-table">
									<thead>
										<tr>
											<th class="single-price" >订单编号</th>
											<th class="freight" >支付流水号</th>
											<th class="protype">联系人</th>
											<th class=" baobei">收货地址</th>
											<th class=" operate-state">联系方式</th>
											 <th class="freight">付款状态</th> 	
											<th class="all-totle-price">宝贝总价</th>
											
											
										</tr>
									</thead>

									<!-- 已购买产品list -->
									<tbody>

										<tr>
											<td class="goods-name">
											<%=info.getOrdersId() %>
											</td>
											<td rowspan="1"><%=info.getTrxId() %></td>
											<!-- 支付流水号-->
											<td><%=info.getUsername() %></td>	
											<td><%=info.getAddress() %></td>
											<td><%=info.getPhone() %></td>
											<!-- 联系方式 -->
											  <td><%=info.getIsPayed()%></td>
											<!-- 付款状态 -->
											
											<td rowspan="1"><%=info.getTotalPrice() %>元</td>
											<!-- 总价 -->	
											
											
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>


				</div>
			</div>
		</div>
	</div>

</body>
</html>
