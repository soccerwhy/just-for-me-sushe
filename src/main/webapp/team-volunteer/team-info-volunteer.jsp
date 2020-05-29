<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%
    String path = request.getContextPath() + "/";
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
    String teamname = (String) request.getAttribute("teamname");
    String teamlocation = (String) request.getAttribute("teamlocation");
    String teamslogan = (String) request.getAttribute("teamslogan");
    Integer teamnumber = (Integer) request.getAttribute("teamnumber");
    List<String> teammember = (List<String>) request.getAttribute("teammember");


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
        <li>团队信息管理</li>
        <li>团队信息展示</li>
    </ul>
</div>

<div class="formbody">

    <div class="formtitle"><span>基本信息</span></div>
    <ul class="forminfo">
        <li>
            <label>团队名称</label>
            <input name="teamname" id="teamname" class="dfinput  required" value="<%=teamname%>" readonly="true"/>&nbsp;&nbsp;&nbsp;
        </li>
        <%--<li>--%>
        <%--<label>密码</label>--%>
        <%--<input name="password" id="password" class="dfinput  required" value="<%=password%>" />&nbsp;&nbsp;&nbsp;<font color="red">*</font>--%>
        <%--</li>--%>
        <li>
            <label>团队地点</label>
            <input name="teamlocation" id="teamlocation" class="dfinput  required" value="<%=teamlocation%>" readonly="true"/>&nbsp;&nbsp;&nbsp;
        </li>
        <li>
            <label>团队口号</label>
            <input name="teamslogan" id="teamslogan" class="dfinput  required" value="<%=teamslogan%>" readonly="true"/>&nbsp;&nbsp;&nbsp;
        </li>
        <li>
            <label>团队人数</label>
            <input name="teamnumber" id="teamnumber"   class="dfinput  required" value="<%=teamnumber%>" readonly="true"/>
        </li>
        <li>
            <label>团队成员</label>
            <textarea name="teammember" id="teammember" class="dfinput  required" readonly="true"><%=teammember%></textarea>&nbsp;&nbsp;&nbsp;
        </li>
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
