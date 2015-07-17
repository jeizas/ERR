<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <base href="<%=basePath%>">
    <title>jsp页面向action传输数组</title> 
	<meta http-equiv="pragma" content="no-cache">
	<link rel="stylesheet" type="text/css" href="./css/style.css">
</head>
  
<body>
<span>【解决思路】获取所选中行的id，将其重新写入一个变量中，然会将其传到action，在action中解析字符串。</span>
【代码】
页面--
<pre style="border:1px solid #000;font-size:14;width:65%;">
var row = $("#dg").datagrid("getChecked");//获取id为table的复选框所选中行对象
var idList = "";
for(var i=0;i&lt;row.length;i++){
  idList = idLsit + row[i].id + "#";
}
$.post('ajax/AdminActionAjaxdeleteRow.do',{id:row.id},function(result){
  if(result.success){
	$("#dg").datagrid('reload');
  }else{
    $.messager.show({title:'error',msg:result.errorMsg});
  }
},'json');
</pre>
action--
<pre style="border:1px solid #000;font-size:14;width:65%;">
HttpServletRequest request = ServletActionContext.getRequest();
String id = request.getParameter("idList");
String[] idList = id.split("#");
...然后对其数组操作就行 
</pre>
</body>
</html>
