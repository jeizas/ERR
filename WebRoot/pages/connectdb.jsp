<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>远程连接数据库</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<head>
    <base href="<%=basePath%>">  
    <title>几种常见的乱码处理方法</title>   
	<meta http-equiv="pragma" content="no-cache">
	
	<link rel="stylesheet" type="text/css" href="./css/style.css">
</head>
  
<body>
<p >远程连接数据库</p>
<pre>
   a、主机终端进<span>数据库<span class="hightLigth ">mysql -u 用户名 -p 密码</span> 
   b、打开远程连接<span class="hightLigth ">grant all privileges on *.* to root@'%' identified by 'pwd';</span> 
   <span class="hightLigth marginLeft smalltext">*注：上面*.*表示本地数据库对应的表。*表示全部，%表示所有ip，pwd、root表示登录时用的密码和用户名 </span> 
</pre>
</body>
  
</html>
