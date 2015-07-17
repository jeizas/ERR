<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
    
    <title>SprintMvc登录拦截器配置</title>
    <link rel="stylesheet" type="text/css" href="./css/style.css">
</head>
<body>
springMcV配置文注册bean
<pre style="border:1px solid #000;font-size:12;width:65%;">
&lt;mvc:interceptors>  
  &lt;mvc:interceptor>  
    &lt;!-- 匹配的是url路径， 如果不配置或/**,将拦截所有的Controller -->
      &lt;mvc:mapping path="/" />
      &lt;mvc:mapping path="/student/**" />
      &lt;mvc:mapping path="/teacher/**" />
      &lt;mvc:mapping path="/admin/**"  />
      &lt;bean class="com.spring.interceptor.CommonInterceptor"></bean>  
  &lt;/mvc:interceptor>
  &lt;!-- 当设置多个拦截器时，先按顺序调用preHandle方法，然后逆序调用每个拦截器的postHandle和afterCompletion方法 -->
&lt;/mvc:interceptors>
</pre>
java文件中的配置
<pre style="border:1px solid #000;font-size:12;width:65%;">
自定义拦截器继承HandlerInterceptorAdapter类，该类有三个方法可以重写使用。
package com.spring.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class CommonInterceptor extends HandlerInterceptorAdapter {

	private String outsidePage = "index.jsp";
    @Override  
    <span class="green">//preHandle()：这个方法在业务处理器处理请求之前被调用，在该方法中对用户请求request进行处理。
    如果程序员决定该拦截器对请求进行拦截处理后还要调用其他的拦截器，或者是业务处理器去进行处理，则返
    回true；如果程序员决定不需要再调用其他的组件去处理请求，则返回false。</span>
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response,  
            Object obj) throws Exception {  
        String str = (String) request.getSession().getAttribute("id");  
        if(str != null){  
            return true;  
        }else{
        	response.sendRedirect(outsidePage); 
        }         
    } 
    <span class="green">//postHandle()：这个方法在业务处理器处理完请求后，但是DispatcherServlet向客户端返回请求
    前被调用，在该方法中对用户请求request进行处理</span>
    public void postHandle(HttpServletRequest request,  
            HttpServletResponse response, Object o, ModelAndView mav)  
            throws Exception {  
        System.out.println("postHandle");  
    }  
  	<span class="green">//afterCompletion()：这个方法在DispatcherServlet完全处理完请求后被调用，可以在该方法中
  	进行一些资源清理的操作。</span>
    public void afterCompletion(HttpServletRequest request,  
            HttpServletResponse response, Object o, Exception excptn)  
            throws Exception {  
        System.out.println("afterCompletion");  
    }
}
</pre>
</body>
</html>
