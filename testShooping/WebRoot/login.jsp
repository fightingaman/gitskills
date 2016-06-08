<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
<head>
<title>用户登录</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<meta name="keywords"
	content="Flat Dark Web Login Form Responsive Templates, Iphone Widget Template, Smartphone login forms,Login form, Widget Template, Responsive Templates, a Ipad 404 Templates, Flat Responsive Templates" />
<link rel="stylesheet" type="text/css" href="css/login.css">
<script type="text/javascript">
	window.onload = function() {
		 document.getElementById("username").focus();
		
	}
</script>
</head>
<body>

	<h1 style="color:gray;">用户登录</h1>
	<div class="login-form">
		<div class="head-info">
			<label class="lbl-1"> </label> <label class="lbl-2"> </label> <label
				class="lbl-3"> </label>
		</div>
		<div class="clear"></div>
		<div class="avtar">
			<img src="images/avtar.png" />
		</div>
		<form action="Login?kw=login" method="post">
			<input id="username" name="username" type="text" class="text" placeholder="">
			<div class="key">
				<input name="password" type="password" onfocus="" placeholder="">
			</div>
			<a href="resigter.html" style="color:red;border-right:10px">还未进行注册？</a>
			<div class="signin">
				<input type="submit" value="Login">
			</div>
		</form>


	</div>

</body>
</html>
