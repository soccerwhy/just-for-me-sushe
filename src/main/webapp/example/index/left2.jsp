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
	<title>哈哈哈</title>
	<link href="<%=basePath %>css/style.css" rel="stylesheet" type="text/css" />
</head>
<%
		String account = (String)session.getAttribute("account");
		account = account == null?"":account;
		String id = (String)session.getAttribute("id");
		id = id == null?"":id;
		%>
<body style="background:#f0f9fd;">

<div class="lefttop"><span></span>管理信息</div>
<dl class="leftmenu">
	<!-- 一个模块开始 -->
	<dd>
		<div class="title">
			<span><img src="<%=basePath %>images/leftico01.png" /></span>个人信息管理
		</div>
		<ul class="menuson">
			<li><cite></cite><a href="administrator.do?method=sel&id=<%=id %>">更新个人信息</a><i></i></li>
		</ul>   
	</dd>
	<dd>
		<div class="title">
			<span><img src="<%=basePath %>images/leftico01.png" /></span>预案管理
		</div>
		<ul class="menuson">
		<li><cite></cite><a href="index/admin/tufa/addTf.jsp">添加突发事件</a><i></i></li>
			<li><cite></cite><a href="shijian.do?method=selYa1&account=<%=account %>">查看应急案例</a><i></i></li>
		</ul>   
	</dd>
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
