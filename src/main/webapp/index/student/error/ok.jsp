<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath() + "/";
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/DTD/xhtml1-transitional.dtd">
<html>
  <head>
   
    <meta http-equiv="Refresh" content="5;URL=<%=basePath %>shangpin.do?method=selTz1"></meta>
    <title>My JSP 'ok.jsp' starting page</title>
    

  </head>
  
  <body>
        您已经成功选课。5秒内将返回课程管理页面......<br>
  </body>
</html>
