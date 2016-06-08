<%@page import="com.User.GoodBean"%>
<%@page import="com.goodsBean.GoodBeanBO"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
GoodBeanBO gbo=new GoodBeanBO();
int pageNow=1;
String str=(String)request.getAttribute("pageNow");
if(str!=null)
{
   pageNow=Integer.parseInt(str);
}
ArrayList<GoodBean> list=new ArrayList<GoodBean>();
if(request.getAttribute("select")!=null)
{
   String name=request.getAttribute("select").toString();
    list=gbo.selectGoods(8, pageNow,name);
}
else{
    list=gbo.setPage(8, pageNow);
}
int pageCount=gbo.getPageCount();
%>
<%
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
<title>钟志苗图书商城</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<link href="css/bootstrap.css" rel='stylesheet' type='text/css' />
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<!-- start plugins -->
<script type="text/javascript" src="js/jquery-1.11.1.min.js"></script>
<script src="js/responsiveslides.min.js"></script>
<script src="js/fiter.js"></script>
<script type="text/javascript">
	$(function() {
		$("#slider").responsiveSlides({
			auto : true,
			nav : true,
			speed : 500,
			namespace : "callbacks",
			pager : true,
		});
	});
</script>
<style type="text/css">
</style>

</head>
<body>
	<div class="container"
		style="width: auto;height: auto;margin-right:5%;margin-left: 5%;margin-top: -30px">
		<div class="container_wrap">
			<div class="header_top">
				<div class="col-sm-3 logo">
					<a href="index.jsp"><img src="images/logo.png" alt="" /> </a>
				</div>
				<div class="col-sm-3 header_right" style="margin-left:550px">
					<ul class="header_right_box">
						<li><img src="images/p1.png" alt="" /></li>
						<li><p id="me1" style="display:none;">
								<a href="login.jsp">登录/注册</a>
							</p></li>
						<!--  
						<li id="li" style="display:none;"><p id="me">欢迎您:<%=userid%></p>
							<small><a href="Login?kw=exit" onclick="return out() ">[退出登录]</a>
						</small>
						</li>
						-->
						<li id="li" class="litag" style="display:none;"><p id="me">欢迎您:<%=userid%></p>
							<dl>
								<dd>
									<a href="register.jsp">我的订单</a>
								</dd>
								<dd>
									<a href="MyCart">我的购物车</a>
								</dd>
							</dl></li>
						<small><a id="li2" href="Login?kw=exit"
							onclick="return out() ">[退出登录]</a> </small>

					</ul>
				</div>
				<div class="clearfix"></div>
			</div>
			<div class="slider">
				<div class="callbacks_container">
					<ul class="rslides" id="slider">
						<li><img src="images/banner.jpg" class="img-responsive"
							alt="" />
							<div class="button">
								<a href="#" class="hvr-shutter-out-horizontal">Watch Now</a>
							</div>
						</li>
						<li><img src="images/banner1.jpg" class="img-responsive"
							alt="" />
							<div class="button">
								<a href="#" class="hvr-shutter-out-horizontal">Watch Now</a>
							</div>
						</li>
						<li><img src="images/banner2.jpg" class="img-responsive"
							alt="" />
							<div class="button">
								<a href="#" class="hvr-shutter-out-horizontal">Watch Now</a>
							</div>
						</li>
					</ul>
				</div>
			</div>
			<div class="content" style="background: white;">
				<div class="box_1">
					<h1 class="m_2">热门电影</h1>
					<div class="search">
						<form action="GoodShow?kw=select" method="post">
							<input name="select" type="text" value="查找..."
								onfocus="this.value='';"
								onblur="if (this.value == '') {this.value ='查找...';}"> <input
								type="submit" value="">
						</form>
					</div>
					<div class="clearfix"></div>
				</div>
				<div>
					<p class="abc">
						<strong>欧美电影</strong><a href=#><img
							style="margin-right:-100px" align="right" src="images/pic.png"
							alt="" /> </a>
					</p>
				</div>

				<div class="shopBanner">
					<%
						for (GoodBean gb : list) {
					%>
					<a href="GoodShow?kw=datil&id=<%=gb.getGoodsId()%>">
						<div class='x1Box'
							style=" margin-left:40px;margin-top:10px;float :left ;width:20%">
							<img src="images/<%=gb.getPhoto()%>" class="img-responsive"
								title="美国电影" />
								<h1>电影名称：<%=gb.getGoosName()%></h1>
						</div> </a>
					<%
						}
					%>
					<div class="clearfix"></div>
				</div>
				<div align="center" style="margin-top: 20px">
					<%
						//上一页实现
						if (str != null) {
							if (pageNow != 1) {
								int pN = pageNow;
								out.println("<a href=GoodShow?kw=fy&pageNow=" + (pN - 1)
										+ ">【上一页】</a>");
							}
						}
						//数字页
						int a = 1;
						if (pageNow % 5 == 0) {
							a = 1 + pageNow - 3;
						}
						for (int i = a; i <= (pageNow + 4); i++) // 页面的自我调整
						{
							if (i <= pageCount) {
								if (i == pageNow) {
									out.println("<a style=color:red href=GoodShow?kw=fy&pageNow="
											+ i + ">【" + i + "】</a>");
								} else {
									out.println("<a  href=GoodShow?kw=fy&pageNow=" + i
											+ ">【" + i + "】</a>");

								}
							}
						}
						// 下一页实现  pageCount<=1首页收缩
						if (str == null && pageCount > 1) {
							out.println("<a href=GoodShow?kw=fy&pageNow=" + (pageNow + 1)
									+ ">【下一页】</a>");
						} else {
							//System.out.println("pagecount:"+pageCount);
							if (pageNow < pageCount) {
								int pN = pageNow;
								out.println("<a href=GoodShow?kw=fy&pageNow=" + (pN + 1)
										+ ">【下一页】</a>");
							}
						}
					%>
					<div class="clearfix"></div>
				</div>
			</div>
		</div>
	</div>
	<div class="container"
		style="width: auto;height: auto;margin-right:5%;margin-left:5%;margin-top: -30px">
		<footer id="footer">
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
		</footer>
	</div>

</body>
</html>