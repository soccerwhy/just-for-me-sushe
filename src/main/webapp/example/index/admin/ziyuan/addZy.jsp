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
			String number = (String)session.getAttribute("number");
			number = number == null?"":number;
			%>
<body>
<div class="place">
	<span>位置：</span>
	<ul class="placeul">
		<li><a href="#">文件中心管理</a></li>
		<li><a href="#">文件中心</a></li>
	</ul>
</div>
<form action = "course.do?method=addZy" method = "post" enctype = "multipart/form-data"   class="validate" onsubmit="return add();" >
	<div class="formbody">
		<div class="formtitle"><span>添加上传文件信息</span></div>
		<ul class="forminfo">
		<li>
				<label>课程名</label>
				<select class="dfinput" name="wname"  style="width: 300px"> 
				<option value="-1">=请选择课程=</option>
				<%
				for(Map<String,String> map : list){
			%>
				<option value="<%=map.get("title")%>">
					<%=map.get("title")%>
				</option>
				
			<%	
				}
			%>
				</select>
			</li>
			<li>
				<label>选择文件</label>
				<input name="ppt" id="photo" type="file" onchange="preview(this,'preview','imghead',150,150)"/>
				<div id="preview">
					<img id="imghead" width="150" height="150"/>
				</div>
			</li>
			<li>
				<label>&nbsp;</label>
					<input type="submit" class="btn" onclick="toAdd();" value="确认上传"/>
			</li>
		</ul>
	</div>
</form>
<script type="text/javascript">
	/**
	 * 这个使用的单选框选择判断
	 */
	function toAdd(){
			alert("上传成功！！！");
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
	