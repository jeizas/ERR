<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <base href="<%=basePath%>">   
    <title>eclipse使用指南</title>
	<meta http-equiv="pragma" content="no-cache">	
	<link rel="stylesheet" type="text/css" href="./css/style.css">
<style type="text/css">
	pre{font-size:14;border:1px solid #000;width:70%;height:100%;margin:40 auto;}
</style>
</head>
<pre>
<h2 style="margin-left:35%">(my)ecplise使用便捷方式</h2>
1.自动得到get/set函数:菜单栏--Source -- Generate getters and setters
2.重载toString函数:菜单栏--Source -- Generate toString()
3.自动补全快捷键: Alt+/
4.显示console、server、dbBorwser等快捷工具：菜单栏 -- Show View 
5.根据数据库中的表增加*.hbn.xml: 在DB Browser找到要映射的数据库表，表上点击右键Hibernate Reverse Engineering...，选中对应位置，
	第一个复选框的第一项是导出xml文件，第二项是导出注解形式实体类。
</pre>
<body>
    
</body>
</html>
