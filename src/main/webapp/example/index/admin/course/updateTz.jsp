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
	<title>修改志愿者信息</title>
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
		<li><a href="#">志愿者信息管理</a></li>
		<li><a href="#">修改志愿者信息</a></li>
	</ul>
</div>
<form action = "admin?method=updateVolunteer" method = "post"   class="validate" onsubmit="return add();" >
	<input name="id" id="xilie"  type="hidden" value="111" class="dfinput required" />
	<div class="formbody">
		<div class="formtitle"><span>修改志愿者信息</span></div>
		<ul class="forminfo">
			<li>
				<label>姓名</label>
				<input name="name" id="name" value="<%=person.get(0).getName() %>"  type="text" class="dfinput required" placeholder="请输入标题" /><font color="red">*</font>必填
			</li>
			<li>
				<label>出生年月</label>
				<input name="age" id="age" class="dfinput  required" value="<%=person.get(0).getAge()%>" />&nbsp;&nbsp;&nbsp;<font color="red">*</font>
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
				<textarea name="tel" id="tel" cols="100" rows="8" style="width:400px;height:100px" class="dfinput required" ><%=person.get(0).getTelephone()%></textarea><font color="red">*</font>
			</li>

			<li>
				<label>团队</label>
				<select name="team" id="team" width="40px">
					<option value="null">暂无团队</option>
					<option value="team1">team1</option>
					<option value="team2">team2</option>
					<option value="team3">team3</option>
					<option value="team4">team4</option>
				</select>
			</li>
			<li>
				<label>备注</label>
				<textarea name="content" id="content" cols="100" rows="8" style="width:400px;height:100px" class="dfinput required" ><%=person.get(0).getOther()%></textarea><font color="red">*</font>
			</li>
			
			<li>
				<label>&nbsp;</label>
					<input type="submit" class="btn" onclick="toAdd();" value="确认修改"/>
				<a href="admin?method=updNormal"><input type="button" class="btn" value="返回"/></a>
			</li>
		</ul>
	</div>
</form>
<script type="text/javascript">
	/**
	 * 这个使用的单选框选择判断
	 */
	function toAdd(){
			alert("修改成功！！！");
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
	