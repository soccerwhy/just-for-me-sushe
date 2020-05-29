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

<div class="lefttop"><span></span>账目管理</div>
<dl class="leftmenu">
	
	<!-- 一个模块开始 -->
	<dd>
		<div class="title">
			<span><img src="<%=basePath %>images/leftico01.png"/></span>查询报表
		</div>
		<ul class="menuson">
			<li><cite></cite><a href="car.do?method=selCg1">供应商</a><i></i></li>
			<li><cite></cite><a href="car.do?method=selCg">商品采购</a><i></i></li>
			<li><cite></cite><a href="car.do?method=selUsell">客户销售</a><i></i></li>
		</ul> 
	</dd>
	<!-- 一个模块结束 -->
	<!--  
	<dd>
		<div class="title">
			<span><img src="<%=basePath %>images/leftico01.png"/></span>模板
		</div>
		<ul class="menuson">
			<li class="active"><cite></cite><a href="<%=basePath %>index/welcome.jsp" >首页模版</a><i></i></li>
			
			<li><cite></cite><a href="demo_template/form.jsp">表单</a><i></i></li>
			<li><cite></cite><a href="demo_template/sel.jsp">数据列表</a><i></i></li>
			<li><cite></cite><a href="demo_template/imgtable.jsp">图片数据表</a><i></i></li>
			<li><cite></cite><a href="">图片列表</a><i></i></li>
			<li><cite></cite><a href="">图片简介列表</a><i></i></li>
			<li><cite></cite><a href="demo_template/date.jsp">时间控件</a><i></i></li>
			<li><cite></cite><a href="demo_template/validate.jsp">验证</a><i></i></li>
		</ul>    
	</dd>
	-->
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
