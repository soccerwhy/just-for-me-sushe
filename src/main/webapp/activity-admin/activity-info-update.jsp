<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%
    String path = request.getContextPath() + "/";
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<head>
    <base href="<%=basePath%>"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>修改活动信息</title>
    <link href="<%=basePath %>css/style.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="resource/commons/utils.js"></script>
</head>
<%
    String id = (String) request.getAttribute("id");
    String name = (String) request.getAttribute("name");
        String location = (String) request.getAttribute("location");
        String time = (String) request.getAttribute("time");
         String content = (String) request.getAttribute("content");

%>
<body>
<div class="place">
    <span>位置：</span>
    <ul class="placeul">
        <li>志愿活动管理</li>
        <li>修改活动信息</li>
    </ul>
</div>
<form action = "/activity-admin/update-activity-sure" method = "post"   class="validate" onsubmit="return add();" >
    <input name="id" id="id"  type="hidden" value="<%=id%>" class="dfinput required" />
    <div class="formbody">
        <div class="formtitle"><span>修改志愿者信息</span></div>
        <ul class="forminfo">
            <li>
                <label>活动名称</label>
                <input name="name" id="name" value="<%=name %>" class="dfinput required" /><font color="red">*</font>必填
            </li>
            <li>
                <label>活动地点</label>
                <input name="location" id="location" value="<%=location %>" class="dfinput required"  /><font color="red">*</font>必填
            </li>
            <li>
                <label>活动时间</label>
                <input name="time" id="time" value="<%=time %>" class="dfinput required" /><font color="red">*</font>必填
            </li>
            <li>
                <label>活动内容</label>
                <textarea name="content" id="content" cols="100" rows="8" style="width:400px;height:100px" class="dfinput required" placeholder="请输入活动内容" ><%=content%></textarea><font color="red">*</font>
            </li>
            <li>
                <label>&nbsp;</label>
                <input type="submit" class="btn" value="确认修改"/>
                <a href="/activity-admin/activity-info-update.jsp"><input type="button" class="btn" value="返回"/></a>
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
