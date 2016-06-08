<%@ page language="java" import="java.util.*,com.User.*"
	pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	GoodBean gb = (GoodBean) request.getAttribute("good");
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
<title>Single</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords"
	content="Movie_store Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<link href="css/bootstrap.css" rel='stylesheet' type='text/css' />
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<!-- start plugins -->
<script type="text/javascript" src="js/chinaCity.js"></script>
<script type="text/javascript" src="js/jquery-1.11.1.min.js"></script>
<script src="js/fiter.js"></script>
	<script type="text/javascript">   
	function checkUer(){
    var id='<%=userid%>'; 
    if(id==""||id==null)
    {
      if(confirm("请先登录")){
      window.open("login.jsp","_self");
      }
      return false;
    }else if(document.getElementById("county").value=='市、县级市、县')
      {
        alert('请先选着地址！');
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
					<a href="index.jsp"><img src="images/logo.png" alt="" />
					</a>
				</div>
				<div class="col-sm-3 header_right" style="margin-left: 550px">
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
				<div class="clearfix"></div>
			</div>
			<div class="content">
				<div class="movie_top">
					<div class="col-md-9 movie_box">
						<div class="grid images_3_of_2" style="width:29%">
							<div class="movie_image">
								<img src="images/<%=gb.getPhoto()%>" class="img-responsive"
									alt="" />
							</div>

						</div>
						<div class="desc1 span_3_of_2">
							<p class="movie_option"></p>
							<p class="movie_option"></p>
							<p class="movie_option"></p>
							<p class="movie_option"></p>
							<p class="movie_option">
								<strong>电影名称： </strong><a href=#><%=gb.getGoosName()%></a>
							</p>
							<p class="movie_option">
								<strong>发行商: </strong><%=gb.getPublisher()%></p>
							<p class="movie_option">
								<strong>剩余数量: </strong><a href="#"><%=gb.getGoodsNum()%></a>
							</p>
							<p class="movie_option">
								<strong>详细介绍: </strong><%=gb.getGoodsIntro()%></p>
							<p class="movie_option">
								<strong>单价: </strong><a href="#"><%=gb.getGoodsPrice()%>元</a>
							</p>
							<form name="form1" action="MyCart?kw=ad&id=<%=gb.getGoodsId()%>" method="post">
							<!-- <p class="movie_option">
							<strong>配送至: </strong>
								<select name="province" id="province">
								</select> <select name="city" id="city">
								</select> <select name="county" id="county">
								</select>			
							</p>
							 -->
                           </form>
							<div class="down_btn">
								<a class="btn1" href="javascript:document.form1.submit()"
									onclick="return checkUer()"><span></span>购买</a> <a class="btn1"
									href="javascript:document.form1.submit()" onclick="return checkUer()"><span></span>加入购物车</a>
							</div>
						</div>
						<div class="clearfix"></div>
						<p class="m_4">There are many variations of passages of Lorem
							Ipsum available, but the majority have suffered alteration in
							some form, by injected humour, or randomised words which don't
							look even slightly believable. If you are going to use a passage
							of Lorem Ipsum, you need to be sure there isn't anything
							embarrassing hidden in the middle of text. All the Lorem Ipsum
							generators on the Internet tend to repeat predefined chunks as
							necessary, making this the first true generator on the Internet.</p>
						<form method="post" action="contact-post.html">
							<div class="to">
								<input type="text" class="text" value="Name" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Name';}">
								<input type="text" class="text" value="Email"
									onfocus="this.value = '';"
									onblur="if (this.value == '') {this.value = 'Email';}"
									style="margin-left:3%">
							</div>
							<div class="text">
								<textarea  value="Message:" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Message';}">Message:</textarea>
							</div>
							<div class="form-submit1">
								<input name="submit" type="submit" id="submit"
									value="Submit Your Message"><br>
							</div>
							<div class="clearfix"></div>
						</form>
						<div class="single">
							<h1>10 Comments</h1>
							<ul class="single_list">
								<li>
									<div class="preview">
										<a href="#"><img src="images/2.jpg" class="img-responsive"
											alt="">
										</a>
									</div>
									<div class="data">
										<div class="title">
											Movie / 2 hours ago / <a href="#">reply</a>
										</div>
										<p>Lorem ipsum dolor sit amet, consectetuer adipiscing
											elit, sed diam nonummy nibh euismod tincidunt ut laoreet
											dolore magna aliquam erat volutpat. Ut wisi enim ad minim
											veniam, quis nostrud exerci tation ullamcorper suscipit
											lobortis nisl ut aliquip ex ea commodo consequat.</p>
									</div>
									<div class="clearfix"></div></li>
								<li>
									<div class="preview">
										<a href="#"><img src="images/3.jpg" class="img-responsive"
											alt="">
										</a>
									</div>
									<div class="data">
										<div class="title">
											Wernay / 2 hours ago / <a href="#">reply</a>
										</div>
										<p>Duis autem vel eum iriure dolor in hendrerit in
											vulputate velit esse molestie consequat, vel illum dolore eu
											feugiat nulla facilisis at vero eros et accumsan et iusto
											odio dignissim qui blandit praesent luptatum zzril delenit
											augue duis dolore te feugait nulla facilisi. Nam liber tempor
											cum soluta nobis eleifend option congue nihil imperdiet
											doming id quod mazim placerat facer possim assum. Typi non
											habent</p>
									</div>
									<div class="clearfix"></div></li>
								<li>
									<div class="preview">
										<a href="#"><img src="images/4.jpg" class="img-responsive"
											alt="">
										</a>
									</div>
									<div class="data">
										<div class="title">
											mr.dev / 2 hours ago / <a href="#">reply</a>
										</div>
										<p>Claritas est etiam processus dynamicus, qui sequitur
											mutationem consuetudium lectorum. Mirum est notare quam
											littera gothica, quam nunc putamus parum claram, anteposuerit
											litterarum formas humanitatis per seacula quarta decima et
											quinta decima. Eodem modo typi, qui nunc nobis videntur parum
											clari, fiant sollemnes in futurum. qui sequitur mutationem
											consuetudium lectorum. Mirum est notare quam littera gothica,
											quam nunc putamus parum claram,</p>
									</div>
									<div class="clearfix"></div></li>
								<li class="middle">
									<div class="preview">
										<a href="#"><img src="images/5.jpg" class="img-responsive"
											alt="">
										</a>
									</div>
									<div class="data-middle">
										<div class="title">
											Wernay / 2 hours ago / <a href="#">reply</a>
										</div>
										<p>Pellentesque habitant morbi tristique senectus et netus
											et malesuada fames ac turpis egestas.</p>
									</div>
									<div class="clearfix"></div></li>
								<li class="last-comment">
									<div class="preview">
										<a href="#"><img src="images/6.jpg" class="img-responsive"
											alt="">
										</a>
									</div>
									<div class="data-last">
										<div class="title">
											mr.dev / 2 hours ago / <a href="#">reply</a>
										</div>
										<p>Lorem ipsum dolor sit amet, consectetuer adipiscing
											elit, sed diam nonummy nibh euismod tincidunt ut laoreet
											dolore magna aliquam erat volutpat. Ut wisi enim ad minim
											veniam, quis nostrud exerci tation ullamcorper suscipit</p>
									</div>
									<div class="clearfix"></div></li>
								<li>
									<div class="preview">
										<a href="#"><img src="images/7.jpg" class="img-responsive"
											alt="">
										</a>
									</div>
									<div class="data">
										<div class="title">
											denpro / 2 hours ago / <a href="#">reply</a>
										</div>
										<p>Pellentesque habitant morbi tristique senectus et netus
											et malesuada fames ac turpis egestas.Pellentesque habitant
											morbi tristique senectus et netus et malesuada fames ac
											turpis egestas.Pellentesque habitant morbi tristique senectus
											et netus et malesuada fames ac turpis egestas.Pellentesque
											habitant morbi tristique senectus et netus et malesuada fames
											ac turpis egestas.Pellentesque habitant morbi tristique
											senectus et netus et malesuada fames ac turpis egestas.</p>
									</div>
									<div class="clearfix"></div></li>
							</ul>
						</div>
					</div>
					<div class="col-md-3">
						<div class="movie_img">
							<div class="grid_2">
								<img src="images/pic6.jpg" class="img-responsive" alt="">
								<div class="caption1">
									<ul class="list_5 list_7">
										<li><i class="icon5"> </i>
										<p>3,548</p>
										</li>
									</ul>
									<i class="icon4 icon6 icon7"> </i>
									<p class="m_3">Guardians of the Galaxy</p>
								</div>
							</div>
						</div>
						<div class="grid_2 col_1">
							<img src="images/pic2.jpg" class="img-responsive" alt="">
							<div class="caption1">
								<ul class="list_3 list_7">
									<li><i class="icon5"> </i>
									<p>3,548</p>
									</li>
								</ul>
								<i class="icon4 icon7"> </i>
								<p class="m_3">Guardians of the Galaxy</p>
							</div>
						</div>
						<div class="grid_2 col_1">
							<img src="images/pic9.jpg" class="img-responsive" alt="">
							<div class="caption1">
								<ul class="list_3 list_7">
									<li><i class="icon5"> </i>
									<p>3,548</p>
									</li>
								</ul>
								<i class="icon4 icon7"> </i>
								<p class="m_3">Guardians of the Galaxy</p>
							</div>
						</div>
					</div>
					<div class="clearfix"></div>
				</div>
			</div>
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
							<li><a href="#">国产电影</a>
							</li>
							<li><a href="#">欧美大片</a>
							</li>
							<li><a href="#">爱情电影</a>
							</li>
						</ul>
					</div>
					<div class="col_1_of_3 span_1_of_3">
						<h3>信息</h3>
						<ul class="first">
							<li><a href="#">New products</a>
							</li>
							<li><a href="#">top sellers</a>
							</li>
							<li><a href="#">Specials</a>
							</li>
						</ul>
					</div>
					<div class="col_1_of_3 span_1_of_3">
						<h3>关于我们</h3>
						<ul class="first">
							<li><a href="#">QQ</a>
							</li>
							<li><a href="#">人人网</a>
							</li>
							<li><a href="#">微信</a>
							</li>
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
