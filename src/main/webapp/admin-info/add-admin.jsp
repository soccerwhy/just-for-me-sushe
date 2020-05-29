<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%
	String path = request.getContextPath() + "/";
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
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
	$(function(){
		$("#name").focus();
	})

    function add(){
        var username=$.trim($("#username").val());
        var password=$.trim($("#password").val());
        var name=$.trim($("#name").val());
        var email=$.trim($("#email").val());
        var tel=$.trim($("#tel").val());


        if(username.length==0){
            alert("请输入您的用户名");
            $("#username").focus();
            return false;
        }
        if(password.length==0){
            alert("请输入您的密码");
            $("#password").focus();
            return false;
        }
        if(name.length==0){
            alert("请输入您的姓名");
            $("#name").focus();
            return false;
        }
        if(email.length==0){
            alert("请输入您的电子邮箱");
            $("#email").focus();
            return false;
        }
        if(tel.length==0){
            alert("请输入您的电话");
            $("#tel").focus();
            return false;
        }
        return true;
    }
	</script>
</head>

<body>

<div class="place">
	<span>位置：</span>
	<ul class="placeul">
		<li>学生信息管理</li>
		<li>添加学生信息</li>
	</ul>
</div>

<form action = "/admin-info/add-admin" method = "post" enctype = "multipart/form-data" class="validate" onsubmit="return add();" >
	<div class="formbody">
	
		<div class="formtitle"><span>基本信息</span></div>
		<ul class="forminfo">
			<li>
				<label>用户名</label>
				<input name="username" id="username" class="dfinput  required" placeholder="请输入您的用户名" />&nbsp;&nbsp;&nbsp;<font color="red">*</font>
			</li>
			<li>
				<label>密码</label>
				<input name="password" id="password" class="dfinput  required" placeholder="请输入密码" />&nbsp;&nbsp;&nbsp;<font color="red">*</font>
			</li>
			 <li>
				<label>姓名</label>
				<input name="name" id="name" class="dfinput  required" placeholder="请输入真实姓名" />&nbsp;&nbsp;&nbsp;<font color="red">*</font>
			</li>
			<li>
				<label>性别</label>
				<input name="sex"  type="radio" value="男"/>男&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input name="sex"  type="radio" value="女"/>女
			</li>
			<li>
				<label>电子邮箱</label>
				<input name="email" id="email" class="dfinput  required" placeholder="请输入电子邮箱" />&nbsp;&nbsp;&nbsp;<font color="red">*</font>
			</li>
			<li>
				<label>电话</label>
				<input name="tel" id="tel" class="dfinput  required" placeholder="请输入电话" />&nbsp;&nbsp;&nbsp;<font color="red">*</font>
			</li>
			<li>
				<label>&nbsp;</label>
				<input type="submit" class="btn" value="提交" />
				<a href="/admin-info/add-admin-jsp"><input type="button" class="btn" value="重置"  /></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			</li>
		</ul>
	</div>
</form>
<script type="text/javascript">
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
	