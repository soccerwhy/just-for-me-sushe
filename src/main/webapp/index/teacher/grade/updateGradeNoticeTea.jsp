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
    <script type="text/javascript">
	$(function(){
		$("#name").focus();
	})
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
		<li><a href="#">修改考试公告</a></li>
	</ul>
</div>

<form action = "grade.do?method=updateGradeNoticeTeaReal" method = "post" enctype = "multipart/form-data" class="validate" onsubmit="return add();">
	<div class="formbody">
	<input name="id" value="<%=request.getAttribute("id") %>" type="hidden"/>
		<div class="formtitle"><span>公告信息</span></div>
		<ul class="forminfo">
			 <li>
				<label>标题</label>
				<input name="title" id="title" value="<%=list.get(0).get("title") %>" type="text" class="dfinput  required" placeholder="请输入公告标题"/>&nbsp;&nbsp;&nbsp;<font color="red">*</font>
			</li>
			 <li>
				<label>内容</label>
				<textarea name="content" id="content" id="editor_id" cols="100" rows="8" style="width:400px;height:100px" class="dfinput required" placeholder="请输入内容" ><%=list.get(0).get("content") %></textarea><font color="red">*</font>
			</li>
			<li>
				<label>发布人</label>
				<input name="publisher" id="publisher" value="<%=list.get(0).get("publisher") %>" type="text" class="dfinput  required" placeholder="请输入发布人" />&nbsp;&nbsp;&nbsp;<font color="red">*</font>
			</li>
			<li>
				<label>&nbsp;</label>
				<input type="submit" class="btn" value="确认修改" onclick="toAdd()"/>
				<a href="grade.do?method=updateGradeNoticeTeaReal"><input type="button" class="btn" value="返回"  /></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
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