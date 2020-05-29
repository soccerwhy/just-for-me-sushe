<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%
    String path = request.getContextPath() + "/";
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
    Integer id = (Integer) request.getAttribute("id");
    String studentid = (String) request.getAttribute("studentid");
    String password = (String) request.getAttribute("password");
    String name = (String) request.getAttribute("name");
    String email = (String) request.getAttribute("email");
    String tel = (String) request.getAttribute("tel");
    String major = (String) request.getAttribute("major");
    String classes = (String) request.getAttribute("classes");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<head>
    <base href="<%=basePath%>"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>修改志愿者信息</title>
    <link href="<%=basePath %>css/style.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="resource/commons/utils.js"></script>

    <script type="text/javascript">
        $(function(){
            $("#name").focus();
        })

        function add(){
            var password=$.trim($("#password").val());
            var name=$.trim($("#name").val());
            var email=$.trim($("#email").val());
            var tel=$.trim($("#tel").val());


            if(password.length==0){
                alert("请输入您的密码");
                $("#password").focus();
                return false;
            }
            if(name.length==0){
                alert("请输入您的姓名");
                $("#name").focus();
                return false;
            }
            if(email.length==0){
                alert("请输入您的电子邮件");
                $("#email").focus();
                return false;
            }
            if(tel.length==0){
                alert("请输入您的电话");
                $("#tel").focus();
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
        <li>个人信息管理</li>
        <li>修改个人信息</li>
    </ul>
</div>
<form action = "/admin-info-personnew/single-admin-update" method = "post"   class="validate" onsubmit="return add();" >
    <div class="formbody">
        <div class="formtitle"><span>修改管理员信息</span></div>
        <ul class="forminfo">
            <input name="id" id="id" type="hidden" value="<%=id%>"/>
            <li>
                <label>账号</label>
                <input name="studentid" id="studentid" class="dfinput  required" value="<%=studentid%>" readonly="true"/>&nbsp;&nbsp;&nbsp;
            </li>
            <li>
                <label>密码</label>
                <input name="password" id="password" class="dfinput  required" value="<%=password%>" />&nbsp;&nbsp;&nbsp;<font color="red">*</font>
            </li>
            <li>
                <label>姓名</label>
                <input name="name" id="name" value="<%=name %>" class="dfinput required" placeholder="请输入姓名" /><font color="red">*</font>必填
            </li>
            <li>
                <label>性别</label>
                <input name="sex"  type="radio" value="男"/>男&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <input name="sex"  type="radio" value="女"/>女
            <li>
                <label>电子邮箱</label>
                <input name="email" id="email" class="dfinput  required" value="<%=email%>" />&nbsp;&nbsp;&nbsp;<font color="red">*</font>
            </li>
            <li>
                <label>电话</label>
                <input name="tel" id="tel" cols="100" rows="8" class="dfinput required" value="<%=tel%>"/><font color="red">*</font>
            </li>
            <li>
                <label>&nbsp;</label>
                <input type="submit" class="btn" value="确认修改"/>
                <a href="admin-info-personnew/single-admin-update"><input type="button" class="btn" value="返回"/></a>
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
