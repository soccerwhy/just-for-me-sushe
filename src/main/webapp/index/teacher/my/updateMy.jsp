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
<%
	List<Map<String, String>> list = (List<Map<String, String>>)request.getAttribute("list");
	%>

<div class="place">
	<span>位置：</span>
	<ul class="placeul">
		<li><a href="#">首页</a></li>
		<li><a href="#">修改个人信息</a></li>
	</ul>
</div>

<form action = "user.do?method=updateMy" method = "post" enctype = "multipart/form-data" class="validate" onsubmit="return add();" >
	<input type="hidden" name="number" value="<%=list.get(0).get("number") %>"/>
	<div class="formbody">
	
		<div class="formtitle"><span>基本信息</span></div>
		<ul class="forminfo">
			 <li>
				<label>姓名</label>
				<input name="name" id="age" value="<%=list.get(0).get("name") %>" type="text" class="dfinput  required" placeholder="请输入真实姓名" />&nbsp;&nbsp;&nbsp;<font color="red">*</font>
			</li>
			<li>
				<label>出生年月</label>
				<input name="age" id="age" type="text" value="<%=list.get(0).get("age") %>"  class="dfinput  required date" placeholder="请输入出生年月" />&nbsp;&nbsp;&nbsp;<font color="red">*</font>
			</li>
			<li>
				<label>性别</label>
				<input name="sex"  type="radio" value="男"   />男&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input name="sex"  type="radio" value="女"   />女
			</li>
			 <li>
				<label>职称</label>
				<input name="major" id="age" type="text" value="<%=list.get(0).get("major") %>" class="dfinput  required" placeholder="请输入职称" />&nbsp;&nbsp;&nbsp;<font color="red">*</font>
			</li>
			 <li>
				<label>主教课程</label>
				<select name="course" class="dfinput">
					<option value="">请选择主教课程</option>
					<option value="java面向对象程序设计">java面向对象程序设计</option>
					<option value="数据结构">数据结构</option>
					<option value="数据库原理">数据库原理</option>
					<option value="windows程序设计">windows程序设计</option>
					<option value="计算机组成原理">计算机组成原理</option>
					<option value="离散数学">离散数学</option>
					<option value="C语言程序设计">C语言程序设计</option>
					<option value="计算机操作系统">计算机操作系统</option>
					<option value="软件工程">软件工程</option>
					<option value="数字逻辑">数字逻辑</option>
					<option value="计算机概论">计算机概论</option>
				 </select>
			</li>
			 <li>
				<label>电话</label>
				<input name="tel" id="age" type="text" value="<%=list.get(0).get("tel") %>" class="dfinput  required" placeholder="请输入电话" />&nbsp;&nbsp;&nbsp;<font color="red">*</font>
			</li>
			<li>
				<label>照片</label>
				<input name="photo" id="photo" type="file" onchange="preview(this,'preview','imghead',100,150)"/>
				<div id="preview">
					<img id="imghead" width="150" height="120" src = "<%=basePath %>image/<%=list.get(0).get("photo") %>"/>
				</div>
			</li>
			<li>
				<label>&nbsp;</label>
				<input type="submit" class="btn" value="确认修改" onclick="toAdd()"/>
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
<script type="text/javascript" src="<%=path%>plugins/My97DatePicker/WdatePicker.js"></script> 
</body>
</html>
	