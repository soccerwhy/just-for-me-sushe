<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%
	String path = request.getContextPath() + "/";
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<base href="<%=basePath%>"/>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
	<title>无标题文档</title>
	<link href="<%=basePath %>css/style.css" rel="stylesheet" type="text/css" />
</head>
		<%
			List<Map<String, String>> list = (List<Map<String, String>>)request.getAttribute("list");
			String title = request.getParameter("title");
			title = title == null?"":title;
		%>

<%--<body background="images/a.jpg">--%>
<body>
<form action="course.do?method=selMa1" method="post" rel="page">
<div class="place">
	<blockquote><span>位置：</span></blockquote>
	<ul class="placeul">
		<li><a href="#">课程管理</a></li>
		<li><a href="#">课程信息查询</a></li>
	</ul>
</div>


		<table class="imgtable" border = "5" >
			<thead>
			<tr>
				<th>id</th>
				<th>课程名</th>
				<th>上课时间</th>
				<th>教室地点</th>
				<th>学生名字</th>
				<th>报名时间</th>
				<th>缴费状态</th>
				<th>操作</th>
			</tr>
			</thead>
			<tbody>
			<c:if test="${!empty list}">
			<c:forEach items="${list}" var="list" varStatus="vs">
			<tr>
				<td>${vs.index+1}</td>
				<td>${list.title}</td>
				<td>${list.date}</td>
				<td>${list.class1}</td>
				<td>${list.bname}</td>
				<td>${list.bdate}</td>
				<td>
				<c:if test="${list.bstate==0}">未缴费</c:if>
				<c:if test="${list.bstate==1}">已缴费</c:if>
				</td>
				<td>
				<c:if test="${list.bstate==0}"><a href = "course.do?method=jiaofei&id=${list.id}" onclick="toAdd()" ><font color="blue">确认缴费</c:if>
				<c:if test="${list.bstate==1}">暂无操作</c:if>
				
				</font></a>
				</td>
				<%--<td><font color="red">${list.number}</font>
				<p><font size = "5" color = "red" ><%=message %></font></p>
				</td>
				
			--%></tr>
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
		</ul>
	</div>
</div>
</form>
	
<script type="text/javascript" src="<%=basePath %>plugins/jQuery/jquery.js"></script>
<script type="text/javascript">
	/**
	 * 这个使用的单选框选择判断
	 */
	 function toAdd(){
			alert("已缴费！！！");
	}
	
	function toUpdate(){
		var id = $("input[name='id']:checked").val();
		if(!id){
			alert("请选择要操作的记录");
			return false;
		}else{
			alert( "您操作的值为："+$("input[name='id']:checked").val())
		}
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

