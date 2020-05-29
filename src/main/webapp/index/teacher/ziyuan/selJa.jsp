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
			String kname = request.getParameter("kname");
			kname = kname == null?"":kname;
		%>

<body>
<form action="course.do?method=selJa" method="post" rel="page">
<div class="place">
	<span>位置：</span>
	<ul class="placeul">
		<li><a href="#">课程设计管理</a></li>
		<li><a href="#">教案首页管理</a></li>
	</ul>
</div>

<div class="formbody">
	<div class="formtitle" style="cursor: pointer;" id="formtitle"><span>条件查询</span></div>
	<ul class="forminfo" style="display: none;" id="forminfo">
		<li>
			<label>课程名称</label>
			<input name="kname" id="xilie" value="<%=kname %>" type="text" class="dfinput required " />
		</li>
		<li>
			<label>&nbsp;</label>
			<input name="" type="submit" class="btn" value="查询"/>
		</li>
	</ul>
</div>

		<table class="imgtable"border = "5" >
			<thead>
			<tr>
				<th>id</th>
				<th>课程名称</th>
				<th>课程代码</th>
				<th>学时</th>
				<th>学分</th>
				<th>课程类别</th>
				<th>授课班级</th>
				<th>教学目的和要求</th>
				<th>教学环境</th>
				<th>教学重点和难点</th>
				<th>操作</th>
			</tr>
			</thead>
			<tbody>
			<c:if test="${!empty list}">
			<c:forEach items="${list}" var="list" varStatus="vs">
			<tr>
				<td>${vs.index+1}</td>
				<td>${list.kname}</td>
				<td>${list.daima}</td>
				<td>${list.xueshi}</td>
				<td>${list.xuefen}</td>
				<td>${list.type}</td>
				<td>${list.banji}</td>
				<td>${list.mudi}</td>
				<td>${list.hj}</td>
				<td>${list.zn}</td>
				<td>
				<a href = "course.do?method=showJa&id=${list.id}"><font color="blue">修改</font></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<a href = "course.do?method=deleteJa&id=${list.id}" onclick="toAdd()"><font color="blue">删除</font></a>
					
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
			<li class="click"><span><img src="images/t01.png"/></span><a href="index/teacher/jiaoan/addJa.jsp">添加教案首页信息</a></li>
		</ul>
		</div>
</div>
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
	 function toshang(){
			alert("上架成功！！！");
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

