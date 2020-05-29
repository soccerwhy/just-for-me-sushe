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
		<li><a href="#">课程设计管理</a></li>
		<li><a href="#">教案首页管理</a></li>
	</ul>
</div>
<form action = "course.do?method=updateJa" method = "post"  class="validate" onsubmit="return add();" >
	<input name="id" id="xilie"  type="hidden" value="<%=list.get(0).get("id")%>" class="dfinput required" />
	<div class="formbody">
		<div class="formtitle"><span>修改教案首页信息</span></div>
		<ul class="forminfo">
		<li>
				<label>课程名称</label>
				<input name="kname" id="xilie"  type="text" value="<%=list.get(0).get("kname")%>" class="dfinput required"  placeholder="请输入课程名称" /><font color="red">*</font>必填
			</li>
			<li>
				<label>课程代码</label>
				<input name="daima" id="xilie"  type="text" value="<%=list.get(0).get("daima")%>" class="dfinput required"  placeholder="请输入课程代码" /><font color="red">*</font>
			</li>
			<li>
				<label>学时</label>
				<input name="xueshi" id="xilie"  type="text" value="<%=list.get(0).get("xueshi")%>" class="dfinput required"  placeholder="请输入学时" /><font color="red">*</font>
			</li>
			<li>
				<label>学分</label>
				<input name="xuefen" id="xilie"  type="text" value="<%=list.get(0).get("xuefen")%>" class="dfinput required"  placeholder="请输入学分" /><font color="red">*</font>
			</li>
			<li>
				<label>课程类别</label>
				<select name="type" class="dfinput">
					<option value="">请选择课程类别</option>
					<option value="必修">必修</option>
					<option value="专业选修">专业选修</option>
					<option value="公共选修">公共选修</option>
				 </select>
			</li>
			<li>
				<label>授课班级</label>
				<input name="banji" id="xilie"  type="text" value="<%=list.get(0).get("banji")%>" class="dfinput required"  placeholder="请输入授课班级" /><font color="red">*</font>
			</li>
			<li>
				<label>教学目的和要求</label>
				<textarea name="mudi" id="editor_id" cols="100" rows="8" style="width:400px;height:100px" class="dfinput required"  placeholder="请输入教学目的和要求" ></textarea><font color="red">*</font>
			</li>
			<li>
				<label>教学环境</label>
				<input name="hj" id="xilie"  type="text" value="<%=list.get(0).get("hj")%>" class="dfinput required"  placeholder="请输入教学环境" /><font color="red">*</font>
			</li>
			<li>
				<label>教学重点和难点</label>
				<textarea name="zn" id="editor_id" cols="100" rows="8" style="width:400px;height:100px" class="dfinput required"  placeholder="请输入教学重点和难点" ></textarea><font color="red">*</font>
			</li>
			
			<li>
				<label>&nbsp;</label>
					<input type="submit" class="btn" onclick="toAdd();" value="确认修改"/>
				<a href="course.do?method=selJa&number=<%=number %>"><input type="button" class="btn" value="返回"/></a>
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
	