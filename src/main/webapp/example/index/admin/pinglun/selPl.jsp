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
		String bianhao = request.getParameter("bianhao");
		bianhao = bianhao == null?"":bianhao;
		%>

<body>
<form action="shangpin.do?method=addHf" method="post" rel="page">
<div class="place">
	<span>位置：</span>
	<ul class="placeul">
		<li><a href="#">留言部分</a></li>
		<li><a href="#">查看用户留言</a></li>
	</ul>
</div>

<div class="formbody">
	<div class="formtitle" style="cursor: pointer;" id="formtitle"><span>回复区</span></div>
	<ul class="forminfo" style="display: none;" id="forminfo">
		<li>
			<label>回复编号</label>
			<input name="bianhao"  value="<%=bianhao %>" type="text" class="dfinput required " placeholder="请选择一个要回复的编号" />
		</li>
		<li>
			<label>回复内容</label>
			<textarea name="hcontent" id="editor_id" cols="100" rows="8" style="width:400px;height:100px" class="dfinput required" placeholder="请在此输入您的回复" ></textarea><font color="red">*</font>
		</li>
		<li>
			<label>&nbsp;</label>
			<input name="" type="submit" class="btn" value="确认回复" onclick="toHf()"/>
		</li>
	</ul>
</div>

		<table class="imgtable" border = "5" >
			<thead>
			<tr>
				<th>留言编号</th>
				<th>留言人</th>
				<th>留言标题</th>
				<th>留言时间</th>
				<th>留言内容</th>
				<th>回复内容</th>
			</tr>
			</thead>
			<tbody>
			<c:if test="${!empty list}">
			<c:forEach items="${list}" var="list" varStatus="vs">
			<tr>
				<td>${list.bianhao}</td>
				<td>${list.account}</td>
				<td>${list.pingji}</td>
				<td>${list.date}</td>
				<td><font color="red">${list.content}</font></td>
				<td>
				<c:if test="${empty list.hcontent}"><font color="red">暂未对此回复</font></c:if>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<c:if test="${!empty list.hcontent}"><font color="blue">${list.hcontent}</font></c:if>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<a href = "shangpin.do?method=deletePl&id=${list.id}"><font color="blue">删除</font></a>
				</td>
				<td>
				
					<%--<a href = "shangpin.do?method=shangjiaSp&id=${list.id}" onclick="toshang()"><font color="blue"></font></a>上架&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<a href = "shangpin.do?method=showSp&id=${list.id}"><font color="blue">修改</font></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					
					--%>
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
<%--<!--<jsp:include page="/plugins/page/page.jsp"></jsp:include>-->--%>
</form>
	
<script type="text/javascript" src="<%=basePath %>plugins/jQuery/jquery.js"></script>
<script type="text/javascript">
	/**
	 * 这个使用的单选框选择判断
	 */
	 function toHf(){
			alert("回复成功！！！");
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

