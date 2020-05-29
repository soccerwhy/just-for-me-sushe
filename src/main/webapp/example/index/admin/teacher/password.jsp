<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>

	<%@ page import="cn.com.shxt.model.Administrator" %>
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
	
	
</head>
	<%
		Administrator as = (Administrator)request.getAttribute("ad");
	%>

<body>

<div class="place">
	<span>位置：</span>
	<ul class="placeul">
		<li><a href="#">游客</a></li>
		<li><a href="#">修改登陆密码</a></li>
	</ul>
</div>

<form action = "administrator.do?method=password" method = "post"  onsubmit="return add();" >
		<input type="hidden" name="id" value="<%=as.getId() %>"/>
	<div class="formbody">
		<div class="formtitle"><span>基本信息</span></div>
		<ul class="forminfo">
			<li>
				<label>账号</label>
				<input name="account" id="account"  type="text" class="dfinput required"  value = "<%=as.getAccount() %>"/>
			</li>
		    <li>
				<label>原密码</label>
				<input name="password1" id="age" type="password" value="<%=as.getPassword() %>" class="dfinput digits required" value = "<%=as.getAge() %>"/>
			</li>
			<li>
				<label>新密码</label>
				<input name="password" id="age" type="password" class="dfinput digits required"/>
			</li>
			<li>
				<label>&nbsp;</label>
				<input type="submit" class="btn" value="确认修改" onclick="toAdd();"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="administrator.do?method=sel&id=<%=as.getId() %>"><input type="button" class="btn" value="返回"/></a>
			</li>
		</ul>
	</div>
</form>
<script type="text/javascript">
	/**
	 * 这个使用的单选框选择判断
	 */
	 function toAdd(){
			alert("修改密码成功！！！");
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
<script type="text/javascript" src="<%=basePath %>plugins/jQuery/jquery.js"></script>
<script type="text/javascript" src="<%=basePath %>js/validate.js"></script>
<script type="text/javascript" src="<%=path %>plugins/imagePreview/imagePreview.js"></script>
</body>
</html>
	