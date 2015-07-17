<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">    
    <title>经典错误一</title>    
	<meta http-equiv="pragma" content="no-cache">
	<link rel="stylesheet" type="text/css" href="./css/style.css">

</head>
<body>
<pre>
  【错误描述】自己手动写好实体类xxx.java和对应的xxx.hbm.xml之后想自动在数据库中生对应的表，
运行发现xxx属性的getter没有找到等一大堆错误，这个时候极大的错误源就是xxx.hbm.xml
文件中的properties name 名、类型和实体类中的不匹配。
  【解决方案】先在.hbm.xml文件中注释报错的行，然后运行项目。如果没有错误，可直接定位出错源就是
注释的属性名两边不对应，查看是否多加了空格或者类型不匹配；如果还有相似的错误，可按照上述的办法解决；
如果错误变了在另外处理。
</pre>
</body>
</html>
