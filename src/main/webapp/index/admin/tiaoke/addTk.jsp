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
			List<Map<String, String>> list1 = (List<Map<String, String>>)request.getAttribute("list1");
			%>
<body>
<div class="place">
	<span>位置：</span>
	<ul class="placeul">
		<li><a href="#">教师建议管理</a></li>
		<li><a href="#">教师建议信息</a></li>
		
	</ul>
</div>
<form action = "shangpin.do?method=addTk" method = "post"    class="validate" enctype = "multipart/form-data" onsubmit="return add();" >
	<div class="formbody">
		<div class="formtitle"><span>添加教师建议信息</span></div>
		<ul class="forminfo">
			<li>
				<label>课程名</label>
				<select class="dfinput" name="bianhao"  style="width: 300px"> 
				<option value="-1">=请选择课程=</option>
				<%
				for(Map<String,String> map : list){
			%>
				<option value="<%=map.get("bianhao")%>">
					<%=map.get("title")%>
				</option>
				
			<%	
				}
			%>
				</select>
			</li>
			<li>
				<label>教师</label>
				<select class="dfinput" name="number"  style="width: 300px"> 
				<option value="-1">=请选择任课教师=</option>
				<%
				for(Map<String,String> map : list1){
			%>
				<option value="<%=map.get("number")%>">
					<%=map.get("name")%>
				</option>
				
			<%	
				}
			%>
				</select>
			</li>
			
			<li>
				<label>简述</label>
				<textarea name="tcontent" id="editor_id" cols="100" rows="8" style="width:400px;height:100px" class="dfinput required" placeholder="请输入简述" ></textarea><font color="red">*</font>
			</li>
			<li>
				<label>选择附件</label>
				<input name="class1" id="photo" type="file" onchange="preview(this,'preview','imghead',150,150)"/>
			</li>
			<li>
				<label>&nbsp;</label>
					<input type="submit" class="btn" onclick="toAdd();" value="提交"/>
			</li>
			
		</ul>
	</div>
</form>
<script type="text/javascript">
	/**
	 * 这个使用的单选框选择判断
	 */
	function toAdd(){
			alert("提交成功！！！");
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
	