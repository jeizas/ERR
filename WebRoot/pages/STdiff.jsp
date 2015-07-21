<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'STdiff.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
<pre>
1:spring3 mvc开发效率高于struts
2:spring3 mvc可以认为已经100%零配置
3:struts2是类级别的拦截， 一个类对应一个request上下文，
springmvc是方法级别的拦截，一个方法对应一个request上下文，而方法同时又跟一个url对应
	所以说从架构本身上 spring3 mvc就容易实现restful url
	而struts2的架构实现起来要费劲
	因为struts2 action的一个方法可以对应一个url
	而其类属性却被所有方法共享，这也就无法用注解或其他方式标识其所属方法了
4:spring3mvc的方法之间基本上独立的，独享request response数据
	请求数据通过参数获取，处理结果通过ModelMap交回给框架
	方法之间不共享变量
	而struts2搞的就比较乱，虽然方法之间也是独立的，但其所有Action变量是共享的
	这不会影响程序运行，却给我们编码 读程序时带来麻烦
5:由于Struts2需要针对每个Request进行封装，把Request，Session等Servlet生命周期的变量封装成一个一个Map，供给每个Action使用，并保证线程安全。所以在原则上，是比较耗费内存的。
</pre>
  </body>
</html>
