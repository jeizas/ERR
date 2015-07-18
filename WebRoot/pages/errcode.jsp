<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">  
    <title>几种常见的乱码处理方法</title>   
	<meta http-equiv="pragma" content="no-cache">
	<link rel="stylesheet" type="text/css" href="./css/style.css">
</head>
<body>
    <p>1.数据库---&gt;页面:</p>
    	<p class="marginLeft">jdbc.url  jdbc:mysql://localhost:3306/数据库名<span class="hightLigth">?useUnicode=true&characterEncoding=utf-8</span></p>
    <p>2.页面---&gt;后台action</p>
    	<pre>
    		&lt;filter>
    			&lt;filter-name>encodingFilter&lt;/filter-name>
    			&lt;filter-class>org.springframework.web.filter.CharacterEncodingFilter&lt;/filter-class>
    			&lt;init-param>
      				&lt;param-name>encoding&lt;/param-name>
      				&lt;param-value>UTF-8&lt;/param-value>
    			&lt;/init-param>
    			&lt;init-param>
      				&lt;param-name>forceEncoding&lt;/param-name>
      				&lt;param-value>true&lt;/param-value>
    			&lt;/init-param>
  			&lt;/filter>
  		&lt;filter-mapping>
    			&lt;filter-name>encodingFilter&lt;/filter-name>
    			&lt;url-pattern>/*&lt;/url-pattern>
  		&lt;/filter-mapping>
  		<span class="hightLigth">在web.xml文件中加入以上代码，注意加的位置</span>
  		</pre>
  	<p>3.导入工程出现的乱码</p>
  		<span class="hightLigth marginLeft">(my)eclipse的工具栏上Window--Preferences--General--context Type右侧  Text -- Java Source File 最下面的default encoding改为UTF-8 更新即可</span>
	<p>4.以上解决不了，用如下方法试试</p>
		<span class="hightLigth marginLeft">找到tomcat文件夹下的sevlet.xml文件的对应位置加入一下内容</span>
		<pre>
		&lt;Connector port="8080" protocol="HTTP/1.1"
            		connectionTimeout="20000"
            		redirectPort="8443" 
			<span class="hightLigth">URIEncoding="UTF-8"/></span>
		</pre>
	<p>5.HttpServletRequest getParameter取参时乱码</p>
		<pre>
		Stirng xxx = new String(request.getParemeter().getBytes("ISO-8859-1"),"UTF-8");
		</pre>
</body>
</html>
