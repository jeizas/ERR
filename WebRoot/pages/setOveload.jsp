<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">    
    <title>Hibernate多对一保存对象</title>  
	<meta http-equiv="pragma" content="no-cache">
	<link rel="stylesheet" type="text/css" href="./css/style.css">
</head>
<body>
<pre>
【场景】一个班Grade有多个学生Student，这样对于学生来说，学生和班级的关系是多对一解决问题了
【设计思路】多对一需要在多的那一方加入一的引用，
  比如在Student类中加入Grade grade，对应在student表中应有grade的唯一属性（这里就gradeid了）
  这样在保存的时候从页面得到student的基本信息和grade的标示属性gradeid
  在action得到上述信息后，Grade g = new Grade();
  g.setGradeid(gradeid);
  student.setGrade(g);
  session.save(student);
  这样可避免重载setter函数不调用的烦恼。
</pre>
</body>
</html>
