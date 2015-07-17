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
<h2 style="margin-left:35%">通过特定属性查询对象列表</h2>
业务逻辑层代码（主要功能：查询在数据库中跟port的name、adderss相同的对象，返回List<Port>）
@Override
public List<Port> findPortListByCondition(Port port) {
	// TODO Auto-generated method stub
	StringBuffer hql = new StringBuffer("from port p where 1=1");
	List<Object> paramList = new ArrayList<>();
		 
	if(!Utils.isNull(port.getPortname())){
		hql.append(" and p.portname = ?");
		paramList.add(port.getPortname());
	}
			
	if(!Utils.isNull(port.getPortaddress())){
		hql.append(" and p.portaddress = ?");
		paramList.add(port.getPortaddress());
	}		 
	return portDao.find(hql.toString(), paramList);
	}//dao层的接口在Hibernate session调用中
<span class="hightLigth">亮点：把特定对象条件查询的方法综合写入一个方法之中，简化了对每个查询方法都写一个函数的代码量，提高了变成效率，开发更加简洁。</span>
</pre>
<body>
    
</body>
</html>
