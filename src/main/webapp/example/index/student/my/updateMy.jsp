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

<form action = "user.do?method=updateMy1" method = "post" enctype = "multipart/form-data" class="validate" onsubmit="return add();" >
	<input type="hidden" name="number" value="<%=list.get(0).get("number") %>"/>
	<div class="formbody">
	
		<div class="formtitle"><span>基本信息</span></div>
		<ul class="forminfo">
			 <li>
				<label>真实姓名</label>
				<input name="name" id="age" type="text" value = "<%=list.get(0).get("name") %>" class="dfinput  required" placeholder="请输入真实姓名" />&nbsp;&nbsp;&nbsp;<font color="red">*</font>
			</li>
			  <li>
				<label>年龄</label>
				<input name="age" id="age" type="text" class="dfinput required" value = "<%=list.get(0).get("age") %>"/>
			</li>
			<li>
				<label>性别</label>
				<input name="sex"  type="radio" value="男"   />男&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input name="sex"  type="radio" value="女"   />女
			</li>
			<li>
				<label>年级</label>
				<input name="major" id="age" type="text" value = "<%=list.get(0).get("major") %>" class="dfinput  required" placeholder="请输入年级" />&nbsp;&nbsp;&nbsp;<font color="red">*</font>
			</li>
			<li>
				<label>专业</label>
				<input name="dept" id="age" type="text" value = "<%=list.get(0).get("dept") %>" class="dfinput required" placeholder="请输入专业" />&nbsp;&nbsp;&nbsp;<font color="red">*</font>
			</li>
			<li>
				<label>照片</label>
				<input name="photo" id="photo" type="file" onchange="preview(this,'preview','imghead',150,200)"/>
				<div id="preview">
					<img id="imghead" width="150" height="200" src = "<%=basePath %>image/<%=list.get(0).get("photo") %>"/>
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
	