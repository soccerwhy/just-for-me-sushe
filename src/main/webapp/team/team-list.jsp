<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ page import="com.example.springbootbase.model.Person" %>
<%@ page import="com.example.springbootbase.model.Sushe" %>
<%
	String path = request.getContextPath() + "/";
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<head>
	<base href="<%=basePath%>"/>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
	<link href="<%=basePath %>css/style.css" rel="stylesheet" type="text/css" />
</head>
		<%
			List<Sushe> list = (List<Sushe>)request.getAttribute("list");
		%>
<body background="images/a.jpg">
<div class="place">
	<blockquote><span>位置：</span></blockquote>
	<ul class="placeul">
		<li>宿舍及晚归管理</li>
		<li>查询宿舍信息</li>
	</ul>
</div>
<form action="/team/obscure-match" method="post">
<div class="formbody">
	<div class="formtitle" style="cursor: pointer;" id="formtitle"><span>条件查询</span></div>
	<ul class="forminfo" style="display: none;" id="forminfo">
		<li>
			<label>宿舍编号</label>
			<input name="number" id="number" value="" class="dfinput required " />
		</li>
		<li>
			<label>&nbsp;</label>
			<input name="" type="submit" class="btn" value="查询"/>
		</li>
	</ul>
</div>
</form>

		<table class="imgtable"border = "5" >
			<thead>
			<tr>
				<th>编号</th>
				<th>宿舍编号</th>
				<th>宿舍地点</th>
				<th>整洁情况</th>
				<th>损坏情况</th>
				<th>提交时间</th>
				<th>操作</th>
            </tr>
			</thead>
			<tbody>
			<c:if test="${!empty list}">
			<c:forEach items="${list}" var="list" varStatus="vs">
			<tr>
				<td>${list.susheid}</td>
				<td>${list.number}</td>
				<td>${list.location}</td>
				<td>${list.clean}</td>
				<td>${list.guaranteecontent}</td>
				<td>${list.timestamp_name}</td>
				<td>
					<a href = "/team/updateTeams?id=${list.susheid}"><font color="blue">修改</font></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<a href = "/team/deleteTeam?id=${list.susheid}" onclick="toAdd()" ><font color="blue">删除
					</font></a>
				</td>
				</tr>
			</c:forEach>
		</c:if>
		<c:if test="${empty list}">
			<tr>
				<td colspan="8" align="center">
					<strong><font color="red">暂时没有数据，请添加</font></strong>
				</td>
			</tr>
		</c:if>
			
		</tbody>
		</table>
		<div class="rightinfo">

	<div class="tools">
		<ul class="toolbar">
			<li class="click"><span><img src="images/t01.png"/></span><a href="/team/add-team.jsp">添加宿舍</a></li>
		</ul>
	</div>
</div>
<form action="/team/team-list" rel="page">
		<jsp:include page="/plugins/page/page.jsp"></jsp:include>
</form>
<script type="text/javascript" src="<%=basePath %>plugins/jQuery/jquery.js"></script>
<script type="text/javascript">
	/**
	 * 这个使用的单选框选择判断
	 */
	 function toAdd(){
			alert("删除成功！！！");
	}
	$(function(){
		$('.tablelist tbody tr:odd').addClass('odd');
		
		$("#formtitle").click(function(){
			$("#forminfo").slideToggle("slow");
		});
	});
</script>
<script type="text/javascript">
	$(function(){
		$('.imgtable tbody tr:odd').addClass('odd');
	});
    
</script>

</body>
<script type="text/javascript" src="<%=path%>plugins/My97DatePicker/WdatePicker.js"></script>
</html>

