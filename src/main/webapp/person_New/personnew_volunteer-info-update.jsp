<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%
    String path = request.getContextPath() + "/";
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
    String id = (String) request.getAttribute("id");
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
    <link href="<%=basePath %>css/style.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="resource/commons/utils.js"></script>
    <script type="text/javascript">
        $(function(){
            $("#name").focus();
        })

        function add(){
            var password=$.trim($("#password").val());
            var email=$.trim($("#email").val());
            var tel=$.trim($("#tel").val());

            if(password.length==0){
                alert("请输入您的密码");
                $("#password").focus();
                return false;
            }
            if(email.length==0){
                alert("请输入您的电子邮箱");
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
<form action = "/person_New/update-single-volunteer" method = "post"   class="validate" onsubmit="return add();" >
    <div class="formbody">
        <div class="formtitle"><span>修改学生信息</span></div>
        <ul class="forminfo">
            <input name="id" id="id" type="hidden" value="<%=id%>"/>
            <li>
                <label>学号</label>
                <input name="studentid" id="studentid" class="dfinput  required" value="<%=studentid%>" readonly="readonly"/>&nbsp;&nbsp;&nbsp;
            </li>
            <li>
                <label>密码</label>
                <input name="password" id="password" class="dfinput  required" value="<%=password%>" />&nbsp;&nbsp;&nbsp;<font color="red">*</font>
            </li>
            <li>
                <label>姓名</label>
                <input name="name" id="name" value="<%=name %>" class="dfinput required" placeholder="请输入姓名" readonly="readonly"/>&nbsp;&nbsp;&nbsp;
            </li>
            <li>
                <label>电子邮箱</label>
                <input name="email" id="email" class="dfinput  required" value="<%=email%>" />&nbsp;&nbsp;&nbsp;<font color="red">*</font>
            </li>
            <li>
                <label>电话</label>
                <input name="tel" id="tel" class="dfinput  required" value="<%=tel%>" />&nbsp;&nbsp;&nbsp;<font color="red">*</font>
            </li>
            <li>
                <label>专业</label>
                <input name="major" id="major" class="dfinput  required" value="<%=major%>" readonly="readonly"/>&nbsp;&nbsp;&nbsp;
            </li>
            <li>
                <label>班级</label>
                <input name="classes" id="classes" class="dfinput  required" value="<%=classes %>" readonly="readonly"/>&nbsp;&nbsp;&nbsp;
            </li>

            <li>
                <label>&nbsp;</label>
                <input type="submit" class="btn" onclick="toAdd();" value="确认修改"/>
                <a href="person_New/single-volunteer-update?&id=<%=id %>"><input type="button" class="btn" value="返回"/></a>
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
