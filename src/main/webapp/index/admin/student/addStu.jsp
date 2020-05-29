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
	<script type="text/javascript" src="<%=basePath %>plugins/jQuery/jquery.js"></script>
		<!-- 引入JQuery支持的库 -->
    <script language="JavaScript" src="resource/admin/js/jquery.js"></script>
    <!-- 引入artDailog支持的库 -->
    <link rel="stylesheet" href="resource/admin/artDialog/css/ui-dialog.css">
    <script language="JavaScript" src="resource/admin/artDialog/dist/dialog-plus.js"></script>
	
	<script type="text/javascript">
	function toAdd(){
        alert("添加成功")
        }
       
    </script>
</head>

<body>

<div class="place">
	<span>位置：</span>
	<ul class="placeul">
		<li><a href="#">首页</a></li>
		<li><a href="#">添加学生</a></li>
	</ul>
</div>

<form action = "administrator.do?method=addStu" method = "post"  class="validate" onsubmit="return add();" >
	<div class="formbody">
	
		<div class="formtitle"><span>基本信息</span></div>
		<ul class="forminfo">
			<li>
				<label>姓名</label>
				<input name="name" id="age" type="text" class="dfinput  required" placeholder="请输入真实姓名" />&nbsp;&nbsp;&nbsp;<font color="red">*</font>
			</li>
			<li>
				<input name="role" id="role" type="hidden" value="2"  class="dfinput required" placeholder="请输入您的姓名" />
			</li>
			<li>
				<label>设置密码</label>
				<input name="password" id ="password"  type="password" class="dfinput required" placeholder="请设置密码" />&nbsp;&nbsp;&nbsp;<font color="red">*</font>
			</li>
		    
			<li>
				<label>年龄</label>
				<input name="age" id="age" type="text" class="dfinput  required" placeholder="请输入年龄" />&nbsp;&nbsp;&nbsp;<font color="red">*</font>
			</li>
			<li>
				<label>性别</label>
				<input name="sex"  type="radio" value="男"   />男&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input name="sex"  type="radio" value="女"   />女
			</li>
			<li>
				<label>年级</label>
				<select name="major" class="dfinput" id="course">
					<option value="">请选择年级</option>
					<option value="大一">大一</option>
					<option value="大二">大二</option>
					<option value="大三">大三</option>
					<option value="大四">大四</option>
				 </select>
			</li>
			<li>
				<label>&nbsp;</label>
				<input type="submit" class="btn" value="确认"/>
				<input type="reset" class="btn" value="重置"  />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			</li>
		</ul>
	</div>
</form>

<script type="text/javascript" src="<%=basePath %>plugins/jQuery/jquery.js"></script>
<script type="text/javascript" src="<%=basePath %>js/validate.js"></script>
<script type="text/javascript" src="<%=path %>plugins/imagePreview/imagePreview.js"></script>
</body>
</html>
	