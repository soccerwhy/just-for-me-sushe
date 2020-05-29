<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%
	String path = request.getContextPath() + "/";
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<style type="text/css">
    /*    此处定义的margin-left:指的是content左边距到container的距离是15px;  */
    #yuyu{margin-top:30px;font-size:20px;font-weight:bold;}
    #kechengming{margin-left:30px;font-size:15px;font-weight:bold;}
    #xingming{margin-left:45px;font-size:15px;font-weight:bold;}
    #tijiao{margin-left:100px;margin-top:10px;border:"1px"}
</style>
<head>
	<base href="<%=basePath%>"/>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
	<title>无标题文档</title>
	<link href="<%=basePath %>css/style.css" rel="stylesheet" type="text/css" />
</head>
		<%
			List<Map<String, String>> list = (List<Map<String, String>>)request.getAttribute("list");
			String title = request.getParameter("title");
		//	String name = request.getParameter("name");
			title = title == null?"":title;
		%>

<body background="images/a.jpg">
<form action="shangpin.do?method=selTz1" method="post" rel="page">
<div class="place">
	<blockquote><span>位置：</span></blockquote>
	<ul class="placeul">
		<li><a href="#">课程管理</a></li>
		<li><a href="#">课程信息查询</a></li>
	</ul>
</div>

<div class="formbody">
	<div class="formtitle" style="cursor: pointer;" id="formtitle"><span>条件查询</span></div>
	<ul class="forminfo" style="display: none;" id="forminfo">
		<li>
			<label>课程名</label>
			<input name="title" id="xilie" value="<%=title %>" type="text" class="dfinput required " />
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
				<th>课程名</th>
				<th>任课教师</th>
				<th>课程号</th>
				<th>学时</th>
				<th>内容</th>
			</tr>
			</thead>
			<tbody>
			<c:if test="${!empty list}">
			<c:forEach items="${list}" var="list" varStatus="vs">
			<tr>
				<td>${vs.index+1}</td>
				<td>${list.title}</td>
				<td>${list.name}</td>
				<td>${list.bianhao}</td>
				<td>${list.xueshi}</td>
				<td>${list.content}</td>
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
		<%--<jsp:include page="/plugins/page/page.jsp"></jsp:include>--%>
</form>
<form action="grade.do?method=selectGrade" method="post">
<div id="yuyu">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;请正确输入您所选的课程名称和您的姓名并确认提交</div>
<br/>
<div id="kechengming">课程名：<input type="text" name="courseName"></input></div>
<div id="xingming">姓名：<input type="text" name="studentName" value="<%=request.getSession().getAttribute("name")%>" disabled="true"></input></div>
<div id="tijiao"><input type="submit" onclick="toAdd()" value="确认提交"/></div>
</form>
	
<script type="text/javascript" src="<%=basePath %>plugins/jQuery/jquery.js"></script>
<script type="text/javascript">
	/**
	 * 这个使用的单选框选择判断
	 */
	 function toAdd(){
			alert("您的所选课程已经提交数据库处理");
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

