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

    <%
        String bbstitle = (String)request.getAttribute("bbstitle");
        String bbscontent = (String)request.getAttribute("bbscontent");
    %>
</head>


<body>

<div class="place">
    <span>位置：</span>
    <ul class="placeul">
        <li>BBS论坛</li>
        <li>帖子详情</li>
    </ul>
</div>
    <div class="formbody">

        <div class="formtitle"><span>基本信息</span></div>
        <ul class="forminfo">
            <li>
                <label>标题</label>
                <input name="bbstitle" id="bbstitle" class="dfinput  required" value="<%=bbstitle%>" readonly="true"/>&nbsp;&nbsp;&nbsp;<font color="red">*</font>
            </li>
            <li>
                <label>内容</label>
                <textarea name="bbscontent" id="bbscontent" cols="100" rows="8" style="width:345px;height:500px"   class="dfinput  required" readonly="true"><%=bbscontent%>&nbsp;&nbsp;&nbsp;
                </textarea><font color="red">*</font>
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
