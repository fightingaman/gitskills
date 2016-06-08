<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Home</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Movie_store Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
	<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
	<link href="css/bootstrap.css" rel='stylesheet' type='text/css' />
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<!-- start plugins -->
<script type="text/javascript" src="js/jquery-1.11.1.min.js"></script>

<script src="js/responsiveslides.min.js"></script>

</head>
<body>
<div class="container" style="width: auto;height: auto;margin-right:5%;margin-left: 5%;margin-top: -30px" >
	<div class="container_wrap">
			<div class="header_top">
				<div class="col-sm-3 logo">
					<a href="index.jsp"><img src="images/logo.png" alt="" />
					</a>
				</div>
	      <div class="content" style="background:white;">
      	     <div class="register" >
		  	  <form> 
				 <div class=" register-top-grid " >
					<h3>个人信息</h3>
					 <p>
						<span>真实姓名<label>*</label></span>
						<input type="text"> 
					 </p>
					 <p>
						<span>联系方式<label>*</label></span>
						<input type="text"> 
					 </p>
					 <p>
						 <span>Email <label>*</label></span>
						 <input type="text"> 
					 </p>
					  <p>
						<span>地址<label>*</label></span>
					<input type="text">
							 </p>
							 <p>
						<span>邮编<label></label></span>
						<input type="text">
							 </p>
							 
					 <div class="clearfix"> </div>
					   
					 </div>		
				</form>
				<div class="clearfix"> </div>
				<div class="register-but">
				   <form>
					   <input  type="submit" value="提交">  
					   <div class="clearfix"> </div>
				   </form>
				</div>
		   </div>
           </div>
    </div>
</div>

</body>
</html>