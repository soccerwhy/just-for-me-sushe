<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
            var job=$.trim($("#job").val());
            var sushenumber=$.trim($("#sushenumber").val());
            var cometime=$.trim($("#cometime").val());
            var lefttime=$.trim($("#lefttime").val());


            if(name.length==0){
                alert("请输入您的姓名");
                $("#name").focus();
                return false;
            }
            if(job.length==0){
                alert("请输入您的工作");
                $("#job").focus();
                return false;
            }
            if(cometime.length==0){
                alert("请输入来访时间");
                $("#cometime").focus();
                return false;
            }
            if(lefttime.length==0){
                alert("请输入离开时间");
                $("#lefttime").focus();
                return false;
            }
            return true;
        }




    </script>
    <style type="text/css">
        .whyselect{
            width:200px;
            height:36px;
        }
    </style>
</head>

<body>

<div class="place">
    <span>位置：</span>
    <ul class="placeul">
        <li>来访人员管理</li>
        <li>添加来访人员</li>
    </ul>
</div>

<form action = "/laifang-admin/add-laifang" method = "post" enctype = "multipart/form-data" class="validate" onsubmit="return add();" >
    <div class="formbody">

        <div class="formtitle"><span>来访人员单</span></div>
        <ul class="forminfo">
            <li>
                <label>姓名</label>
                <input name="name" id="name" class="dfinput  required" placeholder="请输入真实姓名" />&nbsp;&nbsp;&nbsp;<font color="red">*</font>
            </li>
            <li>
                <label>工作</label>
                <input name="job" id="job" class="dfinput  required" placeholder="请输入工作信息" />&nbsp;&nbsp;&nbsp;<font color="red">*</font>
            </li>
            <li>
                <label>访问宿舍号</label>
                <select id="mySelect" name="mySelect" class="whyselect">
                    <option>请选择</option>
                    <c:forEach items="${sushenumberts }" var="sushenumber">
                        <option value="${sushenumber}">${sushenumber}</option>
                    </c:forEach>
                </select>
            </li>
            <li>
                <label>来访时间</label>
                <input name="cometime" id="cometime" class="dfinput  required" placeholder="请输入来访时间" />&nbsp;&nbsp;&nbsp;<font color="red">*</font>
            </li>
            <li>
                <label>离开时间</label>
                <input name="lefttime" id="lefttime" class="dfinput  required" placeholder="请输入离开时间" />&nbsp;&nbsp;&nbsp;<font color="red">*</font>
            </li>
            <li>
                <label>&nbsp;</label>
                <input type="submit" class="btn" value="提交" />
                <a href="/laifang-admin/add-laifang-jsp"><input type="button" class="btn" value="重置"  /></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
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
