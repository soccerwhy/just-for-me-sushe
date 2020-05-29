<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ page import="com.example.springbootbase.model.Person" %>
<%
	String path = request.getContextPath() + "/";
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<head>
	<base href="<%=basePath%>"/>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<link href="<%=basePath %>css/style.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="resource/commons/utils.js"></script>
</head>
			<%
				List<Person> person = (List<Person>) request.getAttribute("person");
			%>
<body>
<div class="place">
	<span>位置：</span>
	<ul class="placeul">
		<li>学生信息管理</li>
		<li>修改学生信息</li>
	</ul>
</div>
<form action = "/person/update-volunteers-admin" method = "post"   class="validate" onsubmit="return add();" >
	<input name="id" id="id"  type="hidden" value="<%=person.get(0).getPersonid()%>" class="dfinput required" />
	<div class="formbody">
		<div class="formtitle"><span>修改学生信息</span></div>
		<ul class="forminfo">
			<li>
				<label>用户名</label>
				<input name="username" id="username" value="<%=person.get(0).getUsername() %>"   class="dfinput required" /><font color="red">*</font>必填
			</li>
			<li>
				<label>密码</label>
				<input name="password" id="password" value="<%=person.get(0).getPassword() %>"   class="dfinput required"  /><font color="red">*</font>必填
			</li>
			<li>
				<label>姓名</label>
				<input name="name" id="name" value="<%=person.get(0).getName() %>" class="dfinput required" placeholder="请输入标题" /><font color="red">*</font>必填
			</li>
			<li>
				<label>年级</label>
				<input name="grade" id="grade" class="dfinput  required" value="<%=person.get(0).getGrade()%>" />&nbsp;&nbsp;&nbsp;<font color="red">*</font>
			</li>
			<li>
				<label>性别</label>
				<input name="sex"  type="radio" value="男"/>男&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input name="sex"  type="radio" value="女"/>女
			<li>
				<label>电子邮箱</label>
				<input name="email" id="email" class="dfinput  required" value="<%=person.get(0).getEmail()%>" />&nbsp;&nbsp;&nbsp;<font color="red">*</font>
			</li>
			<li>
				<label>电话</label>
				<input name="tel" id="tel" class="dfinput  required" value="<%=person.get(0).getTelephone()%>" />&nbsp;&nbsp;&nbsp;<font color="red">*</font>
			</li>
			<li>
				<label>专业</label>
				<input name="major" id="major" class="dfinput  required" value="<%=person.get(0).getMajor()%>" />&nbsp;&nbsp;&nbsp;<font color="red">*</font>
			</li>
			<li>
				<label>&nbsp;</label>
					<input type="submit" class="btn" value="确认修改"/>
				<a href="update-volunteer-admin.jsp"><input type="button" class="btn" value="返回"/></a>
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
	