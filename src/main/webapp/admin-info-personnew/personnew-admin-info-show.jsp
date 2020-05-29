<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%
    String path = request.getContextPath() + "/";
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
    String studentid = (String) request.getAttribute("studentid");
    String name = (String) request.getAttribute("name");
    String sex = (String) request.getAttribute("sex");
    String email = (String) request.getAttribute("email");
    String tel = (String) request.getAttribute("tel");

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
    </script>
</head>

<body>

<div class="place">
    <span>位置：</span>
    <ul class="placeul">
        <li>个人信息管理</li>
        <li>查看个人信息</li>
    </ul>
</div>

<div class="formbody">

    <div class="formtitle"><span>管理员基本信息</span></div>
    <ul class="forminfo">
        <li>
            <label>账号</label>
            <input name="studentid" id="studentid" class="dfinput  required" value="<%=studentid%>" readonly="true"/>&nbsp;&nbsp;&nbsp;
        </li>
        <%--<li>--%>
        <%--<label>密码</label>--%>
        <%--<input name="password" id="password" class="dfinput  required" value="<%=password%>" />&nbsp;&nbsp;&nbsp;<font color="red">*</font>--%>
        <%--</li>--%>
        <li>
            <label>姓名</label>
            <input name="name" id="name" class="dfinput  required" value="<%=name%>" readonly="true"/>&nbsp;&nbsp;&nbsp;
        </li>
        <li>
            <label>性别</label>
            <input name="sex" id="sex"   class="dfinput  required" value="<%=sex%>" readonly="true"/>
        </li>
        <li>
            <label>电子邮箱</label>
            <input name="email" id="email" class="dfinput  required" value="<%=email%>" readonly="true"/>&nbsp;&nbsp;&nbsp;
        </li>
        <li>
            <label>电话</label>
            <input name="tel" id="tel" class="dfinput  required" value="<%=tel%>" readonly="true" />&nbsp;&nbsp;&nbsp;
        </li>
        <%--<li>--%>
            <%--<label>活动</label>--%>
            <%--<input name="activity" id="activity" class="dfinput  required" value="<%=activity%>" readonly="true"/>&nbsp;&nbsp;&nbsp;--%>
        <%--</li>--%>
    </ul>
</div>
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
