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
</head>
			<%
			List<Map<String, String>> list = (List<Map<String, String>>)request.getAttribute("list");
			List<Map<String, String>> list1 = (List<Map<String, String>>)request.getAttribute("list1");
			%>
<body>
<div class="place">
	<span>位置：</span>
	<ul class="placeul">
		<li><a href="#">课程管理</a></li>
		<li><a href="#">报名课程</a></li>
		
	</ul>
</div>
<form action = "course.do?method=addMa" method = "post"    class="validate" onsubmit="return add();" >
	<div class="formbody">
		<div class="formtitle"><span>添加课程信息</span></div>
		<ul class="forminfo">
			<li>
				<label>课程名</label>
				<input name="title" id="xilie" value="<%=list.get(0).get("title")%>"  type="text" class="dfinput required" placeholder="请输入课程名" /><font color="red">*</font>必填
			</li>
			<li>
				<label>课程号</label>
				<input name="bianhao" id="xilie" value="<%=list.get(0).get("bianhao")%>"  type="text" class="dfinput required" placeholder="请输入课程号" /><font color="red">*</font>必填
			</li>
			<li>
				<label>缴费金额</label>
				<input name="jprice" id="xilie"  type="text" class="dfinput required" placeholder="请输入缴费金额" />（元）<font color="red">*</font>
			</li>
			<li>
				<label>报名时间</label>
				<input name="bdate" id="xilie"  type="text" class="dfinput required date" placeholder="请输入时间" /><font color="red">*</font>
			</li>
			<li>
				<label>&nbsp;</label>
					<input type="submit" class="btn" onclick="toAdd();" value="提交"/>
			</li>
		</ul>
	</div>
</form>
<script type="text/javascript">
	/**
	 * 这个使用的单选框选择判断
	 */
	function toAdd(){
			alert("提交成功！！！");
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
	