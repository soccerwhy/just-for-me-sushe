<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%
	String path = request.getContextPath() + "/";
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<base href="<%=basePath%>"/>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>无标题文档</title>
	<link href="<%=basePath %>css/style.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="resource/commons/utils.js"></script>
	<script charset="utf-8" src="plugins/kindeditor-4.1.4/kindeditor-min.js"></script>
		<script charset="utf-8" src="plugins/kindeditor-4.1.4/lang/zh_CN.js"></script>
		<script type="text/javascript" src="plugins/kindeditor-4.1.4/simple.js"></script>
		<script type="text/javascript" src="resource/commons/utils.js"></script>
</head>
			<%
			List<Map<String, String>> list = (List<Map<String, String>>)request.getAttribute("list");
			String name = (String)session.getAttribute("name");
			name = name == null?"":name;
			String number = (String)session.getAttribute("number");
			number = number == null?"":number;
			%>
<body>
<div class="place">
	<span>位置：</span>
	<ul class="placeul">
		<li><a href="#">实验报告</a></li>
		<li><a href="#">提交答题</a></li>
	</ul>
</div>
<form action = "course.do?method=addSy" method = "post"   class="validate" onsubmit="return add();" >
	<div class="formbody">
		<div class="formtitle"><span>提交答题信息</span></div>
		<ul class="forminfo">
			<li>
				<label>答题内容</label>
				<textarea name="tcontent" id="editor_id" cols="100" rows="8" style="width:700px;height:200px" class="dfinput required" ></textarea><br/>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				发件人：<a href="user.do?method=selMy&number=<%=number %>">
				<input name="tname" id="xilie"   value="<%=name %> <<%=number %>>" /></a>
			</li>
			<li>
				<label>&nbsp;</label>
					<input type="submit" class="btn" onclick="toAdd();" value="发送"/>
				<input type="reset" class="btn" value="重置"/>
			</li>
		</ul>
	</div>
</form>
<script type="text/javascript">
	/**
	 * 这个使用的单选框选择判断
	 */
	function toAdd(){
			alert("发送成功！！！");
	}
	$(function(){
		$('.tablelist tbody tr:odd').addClass('odd');
		
		$("#formtitle").click(function(){
			$("#forminfo").slideToggle("slow");
		});
	});
</script>
<script type="text/javascript" src="<%=basePath %>plugins/jQuery/jquery.js"></script>
<script type="text/javascript" src="<%=basePath %>js/validate.js"></script>
<script type="text/javascript" src="<%=path %>plugins/imagePreview/imagePreview.js"></script>
<script type="text/javascript" src="<%=path%>plugins/My97DatePicker/WdatePicker.js"></script> 
</body>
</html>
	