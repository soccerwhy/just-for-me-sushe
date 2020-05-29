<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%
	String path = request.getContextPath() + "/";
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
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
		$("#name").focus();
	})

    function add(){
        var sushenumber=$.trim($("#sushenumber").val());
        var sushelocation=$.trim($("#sushelocation").val());
        var susheclean=$.trim($("#susheclean").val());
        var sunhuai=$.trim($("#sunhuai").val());

        if(sushenumber.length==0){
            alert("请输入宿舍号码");
            $("#sushenumber").focus();
            return false;
        }
        if(sushelocation.length==0){
            alert("请输入宿舍地点");
            $("#sushelocation").focus();
            return false;
        }
        if(susheclean.length==0){
            alert("请输入宿舍清洁情况");
            $("#susheclean").focus();
            return false;
        }
        if(sunhuai.length==0){
            alert("请输入申请宿舍损坏情况");
            $("#sunhuai").focus();
            return false;
        }
        return true;
    }
	</script>
</head>

<body>

<div class="place">
	<span>位置：</span>
	<ul class="placeul">
		<li>宿舍及晚归管理</li>
		<li>添加宿舍信息</li>
	</ul>
</div>

<form action = "/team/add-teams" method = "post" enctype = "multipart/form-data" class="validate" onsubmit="return add();" >
	<div class="formbody">
	
		<div class="formtitle"><span>基本信息</span></div>
		<ul class="forminfo">
			<li>
				<label>宿舍号码</label>
				<input name="sushenumber" id="sushenumber" class="dfinput  required" placeholder="请输入宿舍号码" />&nbsp;&nbsp;&nbsp;<font color="red">*</font>
			</li>
			<li>
				<label>宿舍地点</label>
				<input name="sushelocation" id="sushelocation" class="dfinput  required" placeholder="请输入宿舍所在地" />&nbsp;&nbsp;&nbsp;<font color="red">*</font>
			</li>
			 <li>
				<label>清洁情况</label>
				<input name="susheclean" id="susheclean" class="dfinput  required" placeholder="请输入清洁情况" />&nbsp;&nbsp;&nbsp;<font color="red">*</font>
			</li>
			<li>
				<label>损坏情况</label>
				<input name="sunhuai" id="sunhuai" class="dfinput  required" placeholder="请输入损坏情况" />&nbsp;&nbsp;&nbsp;<font color="red">*</font>
			</li>
			<li>
				<label>&nbsp;</label>
				<input type="submit" class="btn" value="提交" />
				<a href="/team/add-team.jsp"><input type="button" class="btn" value="重置"  /></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
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
	