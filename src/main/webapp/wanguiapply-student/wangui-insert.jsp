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
            var name=$.trim($("#name").val());
            var major=$.trim($("#major").val());
            var classes=$.trim($("#classes").val());
            var content=$.trim($("#content").val());

            if(name.length==0){
                alert("请输入您的姓名");
                $("#name").focus();
                return false;
            }
            if(major.length==0){
                alert("请输入您的专业");
                $("#major").focus();
                return false;
            }
            if(classes.length==0){
                alert("请输入您的班级");
                $("#classes").focus();
                return false;
            }
            if(content.length==0){
                alert("请输入您的申请内容");
                $("#content").focus();
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
        <li>晚归信息管理</li>
        <li>晚归申请</li>
    </ul>
</div>

<form action = "/wanguiapply-student/add-wanguiinfo" method = "post" enctype = "multipart/form-data" class="validate" onsubmit="return add();" >
    <div class="formbody">

        <div class="formtitle"><span>晚归申请单</span></div>
        <ul class="forminfo">
            <li>
                <label>申请人姓名</label>
                <input name="name" id="name" class="dfinput  required" placeholder="请输入您的姓名" />&nbsp;&nbsp;&nbsp;<font color="red">*</font>
            </li>
            <li>
                <label>申请人专业</label>
                <input name="major" id="major" class="dfinput  required" placeholder="请输入专业" />&nbsp;&nbsp;&nbsp;<font color="red">*</font>
            </li>
            <li>
                <label>申请人班级</label>
                <input name="classes" id="classes" class="dfinput  required" placeholder="请输入班级" />&nbsp;&nbsp;&nbsp;<font color="red">*</font>
            </li>
            <li>
                <label>申请内容</label>
                <input name="content" id="content" class="dfinput  required" placeholder="请输入申请内容" />&nbsp;&nbsp;&nbsp;<font color="red">*</font>
            </li>
            <li>
                <label>&nbsp;</label>
                <input type="submit" class="btn" value="提交" />
                <a href="/wanguiapply-student/wangui-list-apply"><input type="button" class="btn" value="重置"  /></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
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
