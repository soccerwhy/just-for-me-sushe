<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>

	<%@ page import="com.example.springbootbase.model.Administrator" %>
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
	List<Map<String, String>> list = (List<Map<String, String>>)request.getAttribute("list");
	%>

<body>

<div class="place">
	<span>位置：</span>
	<ul class="placeul">
		<li><a href="#">个人信息管理</a></li>
		<li><a href="#">修改登陆密码</a></li>
	</ul>
</div>

<form action = "user.do?method=password1" method = "post"  onsubmit="return add();" >
	<%--<input type="hidden" name="number" value="<%=list.get(0).get("number") %>"/>--%>
	<input type="hidden" name="number" value="aaaaaaaaa"/>

	<div class="formbody">
		<div class="formtitle"><span>基本信息</span></div>
		<ul class="forminfo">
			<li>
				<label>姓名</label>
				<%--<input name="name" id="account"  type="text" class="dfinput required"  value="<%=list.get(0).get("name") %>"/>--%>
				<input name="name" id="account"  type="text" class="dfinput required"  value="bbbbbbbbbbb"/>

			</li>
		    <li>
				<label>请输入原密码</label>
				<input name="password1" id="age" type="password"  placeholder="请输入原登陆密码" class="dfinput digits required" />
			</li>
			<li>
				<label>设置新密码</label>
				<input name="password" id="age" type="password" placeholder="请设置新登陆密码" class="dfinput digits required"/>
			</li>
			<li>
				<label>&nbsp;</label>
				<input type="submit" class="btn" value="确认修改" onclick="toAdd();"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<%--<a href="user.do?method=selMy&number=<%=list.get(0).get("number") %>"><input type="button" class="btn" value="返回"/></a>--%>
				<a href="user.do?method=selMy&number=ccccccccccccc"><input type="button" class="btn" value="返回"/></a>

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
	