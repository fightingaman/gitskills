<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" />
<meta name="description"  />
<meta name="author"  />
<meta http-equiv="refresh" content="10;url=index.jsp" />
<title>页面找不到</title>
<style type="text/css">
body{ background:#fff url(images/142049870600.jpg) top center no-repeat;}
a.error-btn{display:block;text-indent:-9999px;width:162px;height:48px;background:url(images/142049454775.png) no-repeat;top:480px;left:50%;position:absolute}
a.error-btn:hover{background-position:0 -48px} 
</style>
</head>
<body>
<a href="index.jsp" class="error-btn"></a>
</body>
</html>
