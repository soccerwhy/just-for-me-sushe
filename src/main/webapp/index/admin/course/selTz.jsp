<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ page import="com.example.springbootbase.model.Person" %>
<%
	String path = request.getContextPath() + "/";
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<head>
	<base href="<%=basePath%>"/>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
	<title>查询志愿者信息</title>
	<link href="<%=basePath %>css/style.css" rel="stylesheet" type="text/css" />
</head>
		<%
			List<Person> list = (List<Person>)request.getAttribute("list");
			String title = request.getParameter("title");
			title = title == null?"":title;
		%>

<body background="images/a.jpg">
<div class="place">
	<blockquote><span>位置：</span></blockquote>
	<ul class="placeul">
		<li><a href="#">志愿者信息管理</a></li>
		<li><a href="#">志愿者信息查询</a></li>
	</ul>
</div>
<form action="tiaojian?method=mohu" method="post" rel="page">
<div class="formbody">
	<div class="formtitle" style="cursor: pointer;" id="formtitle"><span>条件查询</span></div>
	<ul class="forminfo" style="display: none;" id="forminfo">
		<li>
			<label>志愿者编号</label>
			<input name="number" id="number" value="<%=title %>" class="dfinput required " />
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
				<th>姓名</th>
				<th>年龄</th>
				<th>性别</th>
				<th>电话</th>
				<th>邮件</th>
				<th>团队</th>
				<th>备注</th>
				<th>操作</th>
			</tr>
			</thead>
			<tbody>
			<c:if test="${!empty list}">
			<c:forEach items="${list}" var="list" varStatus="vs">
			<tr>
				<%--<td>${vs.index+1}</td>--%>
				<td>${list.id}</td>
				<td>${list.name}</td>
				<td>${list.age}</td>
				<td>${list.sex}</td>
				<td>${list.telephone}</td>
				<td>${list.email}</td>
				<td>${list.team}</td>
				<td>${list.other}</td>
				<td>
				<a href = "admin?method=updatePage&id=${list.id}"><font color="blue">修改</font></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<a href = "admin?method=deletePage&id=${list.id}" onclick="toAdd()" ><font color="blue">删除
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
			<li class="click"><span><img src="images/t01.png"/></span><a href="/index/admin/teacher/addTea.jsp">添加志愿者</a></li>
		</ul>
	</div>
</div>
		<jsp:include page="/plugins/page/page.jsp"></jsp:include>

<script type="text/javascript" src="<%=basePath %>plugins/jQuery/jquery.js"></script>
<script type="text/javascript">
	/**
	 * 这个使用的单选框选择判断
	 */
	 function toAdd(){
			alert("删除成功！！！");
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
<script type="text/javascript">
    function toAdd(){
        alert("删除成功！！！");
    }
</script>

</body>
<script type="text/javascript" src="<%=path%>plugins/My97DatePicker/WdatePicker.js"></script>
</html>

