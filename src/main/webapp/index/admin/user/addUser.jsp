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
	$(function(){
		$("#account").focus();
	})
	function add(){
		var account=$.trim($("#account").val());
		var password=$.trim($("#password").val());
			if(account.length==0){
				alert("账号不能为空");
				$("#account").focus();
				return false;
			}
			if(!utils.isNumberOr_Letter(account)){//判断账号是否是数字或字母
        		alert("账号只能是由英文字母和数字和下划线组成");
        		$("#account").focus();
        		return false;
        	}
			if(!utils.isChinaOrNumbOrLett(password)){
				alert("密码只能由汉字、字母、数字组成");
				$("#password").focus();
				return false;
			}
			return true;
	}
	</script>
	<script type="text/javascript">
	function toClose(){
        	var dialog = top.dialog.get(window);
        	dialog.close();
        	dialog.remove();
        	return false;
        }
       
    </script>
</head>

<body>

<div class="place">
	<span>位置：</span>
	<ul class="placeul">
		<li><a href="#">管理员</a></li>
		<li><a href="#">添加用户</a></li>
	</ul>
</div>

<form action = "administrator.do?method=addUser" method = "post"  class="validate" onsubmit="return add();" >
	<div class="formbody">
		<div class="formtitle"><span>基本信息</span></div>
		<ul class="forminfo">
			<li>
				<label>用户名</label>
				<input name="account" id="account" type="text" class="dfinput required" placeholder="请输入用户名" />&nbsp;&nbsp;&nbsp;<font color="red">*</font>
			</li>
			<li>
				<label>密码</label>
				<input name="password" id ="password"  type="password" class="dfinput required" placeholder="请设置初始密码" />&nbsp;&nbsp;&nbsp;<font color="red">*</font>
			</li>
			<li>
				<label>用户编号</label>
				<input name="bianhao" id="account" type="text" class="dfinput required" placeholder="请输入用户编号" />&nbsp;&nbsp;&nbsp;<font color="red">*</font>
			</li>
			<li>
				<label>&nbsp;</label>
				<input type="submit" class="btn" value="确认" onclick="toAdd()"/>
				<a href="index/admin/user/addUser.jsp"><input type="button" class="btn" value="返回" /></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			</li>
		</ul>
	</div>
</form>
<script type="text/javascript">
	/**
	 * 这个使用的单选框选择判断
	 */
	function toAdd(){
			alert("添加成功！！！");
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
	