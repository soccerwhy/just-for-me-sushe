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
	<link href="<%=basePath %>ht/css/style.css" rel="stylesheet" type="text/css" />
	 <link href="resource/admin/css/style.css" rel="stylesheet" type="text/css"/>
	<style type="text/css" mce_bogus="1">  
  table th{
            white-space: nowrap;
        }
        table td{
            white-space: nowrap;
        }
        body,table{
         font-size:12px;
        }
  table{
         empty-cells:show; 
         border-collapse: collapse;
         margin:0 auto;
        }
 
  h1,h2,h3{
   font-size:12px;
   margin:0;
   padding:0;
  }
  table.tab_css_1{
   border:1px solid #cad9ea;
   color:#666;
  }
  table.tab_css_1 th {
   background-image: url("th_bg1.gif");
   background-repeat:repeat-x;
   height:30px;
  }
  table.tab_css_1 td,table.tab_css_1 th{
   border:1px solid #cad9ea;
   padding:0 1em 0;
  }
  table.tab_css_1 tr.tr_css{
   background-color:#f5fafe;
   height:30px;
  }
    </style>
  
</head>
		<%
			List<Map<String, String>> list = (List<Map<String, String>>)request.getAttribute("list");
			String id = request.getParameter("id");
			String courseName = request.getParameter("courseName");
			String studentName = request.getParameter("studentName");
			String grade = request.getParameter("grade");
			id = id == null?"":id;
			courseName = courseName == null ? "" : courseName;
			studentName = studentName == null?"":studentName;
			grade = grade == null?"":grade;
		%>
<body background="images/a.jpg">
<form action="grade.do?method=setCourseGradeStu" method="post" rel="page">
<div class="place" >
	<span>位置：</span>
	<ul class="placeul">
		<li><a href="#">学生</a></li>
		<li><a href="#">查看分数</a></li>
	</ul>
</div>

<div class="formbody" >
	<div class="formtitle" style="cursor: pointer;" id="formtitle"><span>您的分数</span></div>
</div>

<div style="overflow: auto; width: 100%;">
		<table  border="1" class="tab_css_1">
			<thead>
			<tr>
				<th>编号</th>
				<th>学生姓名</th>
				<th>课程名称</th>
				<th>分数</th>
			</tr>
			</thead>
			<tbody >
		<c:if test="${!empty list}">
			<c:forEach items="${list}" var="list" varStatus="vs">
			<tr  class="tr_css" align="center">
				<td>${list.id}</td>
				<td>${list.studentName}</td>
				<td>${list.courseName}</td>
				<td>${list.grade}</td>
			</tr>
			</c:forEach>
		</c:if>
		<c:if test="${empty list}">
			<tr>
				<td colspan="8" align="center">
					<strong><font color="red">暂时没有分数信息</font></strong>
				</td>
			</tr>
		</c:if>
		</tbody>
		</table>
			<div class="rightinfo">
	<br />
		</div>
			<br />
	<jsp:include page="/plugins/page/page.jsp"></jsp:include>
</form>

<script type="text/javascript" src="<%=basePath %>plugins/jQuery/jquery.js"></script>
<script type="text/javascript">
	/**
	 * 这个使用的单选框选择判断
	 */
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
</html>