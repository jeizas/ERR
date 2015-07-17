<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <base href="<%=basePath%>">  
    <title>错误页面引导</title>    
	<meta http-equiv="pragma" content="no-cache">
	<link rel="stylesheet" type="text/css" href="./css/style.css">
</head>
  
<body>
  【原因】有时候我们的网站会不定时的出现一些错误，如果没有任何错误页面会把错误的详细信息暴露给用户，对于那些不还好意的用户而言
正好抓住了网站的把柄，所以处于安全性考虑，优秀的网站一般不会给用户提供任何可利用的错误信息。下面是处理方法。
<pre>
&lt;!-- 错误引导 -->
&lt;default-action-ref name="indexPage" />		
&lt;global-results>
  &lt;result name="exceptionPage">/WEB-INF/pages/error.jsp</result>
&lt;/global-results>		
&lt;global-exception-mappings>
	&lt;exception-mapping result="exceptionPage" exception="java.lang.Exception" />
&lt;/global-exception-mappings>		
&lt;action name="indexPage">
	&lt;result>/index.jsp</result>
&lt;/action>
</pre>
这样出现任何错误页面只显示WEB-INF/pages/error.jsp的内容，错误信息只显示java.lang.Exception
</body>
</html>
