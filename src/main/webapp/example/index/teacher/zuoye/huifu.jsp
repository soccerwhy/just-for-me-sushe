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
		<li><a href="#">作业管理</a></li>
		<li><a href="#">上传个人作业</a></li>
	</ul>
</div>
<form action = "user.do?method=huifu" method = "post" enctype = "multipart/form-data"   class="validate" onsubmit="return add();" >
	<input name="id" id="xilie"  type="hidden" value="<%=list.get(0).get("id")%>" class="dfinput required" />
	<div class="formbody">
		<div class="formtitle"><span>添加个人作业信息</span></div>
		<ul class="forminfo">
			<li>
				<label>作业名</label>
				<input name="zname" id="xilie"  type="text" value="<%=list.get(0).get("zname")%>"  class="dfinput required"  placeholder="请输入作业名" /><font color="red">*</font>必填
			</li>
			<li>
				<label>个人作业文件</label>
				<input name="huifu" id="photo" type="file" onchange="preview(this,'preview','imghead',150,150)"/>
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
	