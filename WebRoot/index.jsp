<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <base href="<%=basePath%>">
    
    <title>错误解决方法</title>
	<meta http-equiv="pragma" content="no-cache">
	<link rel="stylesheet" type="text/css" href="./css/style.css">
</head>
  
<body>
    <ul>
    	<li><a href="./pages/errcode.jsp">几种常见的乱码</a></li>
    	<li class="hightLight"><a href="./pages/connectdb.jsp">远程连接数据库</a><span class="vip">精</span></li>
    	<li><a href="./pages/eclipseTool.jsp">(my)eclipse常用的快捷开发指南</a></li>
    	<li><a href="./pages/session.jsp">hibernate操作数据库</a><span class="vip">精</span></li>
    	<li><a href="./pages/classic.jsp">经典代码---通过特定对象属性查询对象</a></li>
    	<li><a href="./pages/err.jsp">经典错误---xxx.hbm.xml文件中[properties] not found getter or setter</a></li>
    	<li><a href="./pages/setOveload.jsp">解决Hibernate多对一保存对象是不能重载set函数的问题</a></li>
    	<li><a href="./pages/array.jsp">解决jsp页面向action传数组的问题</a></li>
    	<li><a href="./pages/intercept.jsp">ssh登录拦截器配置</a></li>
    	<li><a href="./pages/springmvcIntercept.jsp">springMVC拦截器配置</a></li>
    	<li><a href="./pages/errpage.jsp">错误页面引导</a></li>
    	<li><a href="./pages/STdiff.jsp">springmvc与struts的区别</a></li>
    </ul>
</body>
</html>
