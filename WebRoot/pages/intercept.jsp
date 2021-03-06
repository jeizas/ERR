<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>ssh登录拦截器配置</title>
	<meta http-equiv="pragma" content="no-cache">
	<script type="text/javascript" src="js/jquery.min.js"></script>
</head>
struts.xml的配置
<pre style="border:1px solid #000;font-size:12;width:65%;">
&lt;interceptors>
  &lt;interceptor name="LoginInterceptor" class="com.jeizas.Interceptor.LoginInterceptor"></interceptor>
  &lt;interceptor-stack name="LoginInterceptorStack">
    &lt;interceptor-ref name="LoginInterceptor" />
    &lt;interceptor-ref name="defaultStack" />
  &lt;/interceptor-stack>
&lt;/interceptors>

&lt;interceptor-ref name="LoginInterceptorStack">&lt;interceptor-ref>
</pre>
java文件配置
<pre style="border:1px solid #000;font-size:12;width:65%;">
package com.jeizas.Interceptor;

import java.util.Map;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

public class LoginInterceptor extends AbstractInterceptor {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	public String intercept(ActionInvocation arg0) throws Exception {
		// TODO Auto-generated method stub
		String actionName = arg0.getInvocationContext().getName();//获得当前要调用的action
		if(actionName == "LoginUserAction"){//登录所用的action放行
			return arg0.invoke();
		}
		Map<String,Object> session=ActionContext.getContext().getSession();
		Object user=session.get("loginUser");//从session中获得登录用户
		if(user != null){
			return arg0.invoke();
		}else{
			return Action.LOGIN;
		}
	}

}
</pre>
<body>

</body>
</html>
