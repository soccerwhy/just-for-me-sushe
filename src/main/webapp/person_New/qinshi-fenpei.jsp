<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ page import="com.example.springbootbase.model.Person" %>
<%
    String path = request.getContextPath() + "/";
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<head>
    <base href="<%=basePath%>"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link href="<%=basePath %>css/style.css" rel="stylesheet" type="text/css" />
</head>
<%
%>

<body background="images/a.jpg">
<div class="formbody">

    <div class="formtitle"><span>基本信息</span></div>
    <ul class="forminfo">
        <li>
            <label>学号</label>
            <input name="studentid" id="studentid" class="dfinput  required" value="01110101" readonly="true"/>&nbsp;&nbsp;&nbsp;
        </li>
        <li>
            <label>姓名</label>
            <input name="name" id="name" class="dfinput  required" value="赵强" readonly="true"/>&nbsp;&nbsp;&nbsp;
        </li>
        <li>
            <label>性别</label>
            <input name="sex" id="sex"   class="dfinput  required" value="男" readonly="true"/>
        </li>
        <li>
            <label>班级</label>
            <input name="email" id="email" class="dfinput  required" value="软件三班" readonly="true"/>&nbsp;&nbsp;&nbsp;
        </li>
        <li>
            <label>原寝室</label>
            <input name="tel" id="tel" class="dfinput  required" value="明智楼 6587" readonly="true" />&nbsp;&nbsp;&nbsp;
        </li>
        <li>
            <label>新寝室</label>
            <input name="major" id="major" class="dfinput  required" value="" readonly="true"/>&nbsp;&nbsp;&nbsp;
        </li>
        <li>
            <label>&nbsp;</label>
            <input type="submit" class="btn" onclick="toAdd();" value="确认修改"/>
        </li>
    </ul>
</div>



<script type="text/javascript" src="<%=basePath %>plugins/jQuery/jquery.js"></script>
<script type="text/javascript">
    /**
     * 这个使用的单选框选择判断
     */
    function toDelete(){
        alert("删除成功！！！");
    }
    function toAdd(){
        alert("提升成功，请刷新页面!!!");
    }
    $(function(){
        $('.tablelist tbody tr:odd').addClass('odd');

        $("#formtitle").click(function(){
            $("#forminfo").slideToggle("slow");
        });
    });
</script>
<script type="text/javascript">
    $(function(){
        $('.imgtable tbody tr:odd').addClass('odd');
    });

</script>

</body>
<script type="text/javascript" src="<%=path%>plugins/My97DatePicker/WdatePicker.js"></script>
</html>

