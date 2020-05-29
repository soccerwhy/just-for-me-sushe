<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%
	String path = request.getContextPath() + "/";
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<base href="<%=basePath%>" target="rightFrame"/>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>无标题文档</title>
	<link href="<%=basePath %>css/style.css" rel="stylesheet" type="text/css" />
</head>

<body style="background:#f0f9fd;">

<div class="lefttop"><span></span>管理信息</div>
<dl class="leftmenu">
	<dd>
		<div class="title">
			<span><img src="<%=basePath %>images/leftico01.png" /></span>用户信息管理
		</div>
		<ul class="menuson">
			<li><cite></cite><a href="administrator.do?method=selTea">教师信息管理</a><i></i></li>
			<li><cite></cite><a href="administrator.do?method=selStu">学生信息管理</a><i></i></li>
		</ul>   
	</dd>
	
	<dd>
		<div class="title">
			<span><img src="<%=basePath %>images/leftico01.png"/></span>课程信息管理
		</div>
		<ul class="menuson">
			<li><cite></cite><a href="shangpin.do?method=selQc">课程信息</a><i></i></li>
		</ul> 
	</dd>
	<dd>
		<div class="title">
			<span><img src="<%=basePath %>images/leftico01.png"/></span>通知信息管理
		</div>
		<ul class="menuson">
			<li><cite></cite><a href="shangpin.do?method=selTz">通知信息</a><i></i></li>
		</ul> 
	</dd>
	<dd>
		<div class="title">
			<span><img src="<%=basePath %>images/leftico01.png"/></span>资源下载管理
		</div>
		<ul class="menuson">
				<li><cite></cite><a href="course.do?method=selZy">资源下载信息</a><i></i></li>
		</ul> 
	</dd>
	<dd>
		<div class="title">
			<span><img src="<%=basePath %>images/leftico01.png" /></span>留言管理
		</div>
		<ul class="menuson">
			<li><cite></cite><a href="user.do?method=selLy">查看用户留言信息</a><i></i></li>
		</ul> 
	</dd>
	
	<!-- 一个模块开始 -->
	<!-- 一个模块结束 -->
</dl>

<script type="text/javascript" src="<%=basePath %>plugins/jQuery/jquery.js"></script>
<script type="text/javascript">
$(function(){	
	//导航切换
	$(".menuson li").click(function(){
		$(".menuson li.active").removeClass("active")
		$(this).addClass("active");
	});
	
	$('.title').click(function(){
		var $ul = $(this).next('ul');
		$('dd').find('ul').slideUp();
		if($ul.is(':visible')){
			$(this).next('ul').slideUp();
		}else{
			$(this).next('ul').slideDown();
		}
	});
})	
</script>
</body>
</html>
