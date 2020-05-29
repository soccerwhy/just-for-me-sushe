<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%
    String path = request.getContextPath() + "/";
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
    String sushenumber = (String) request.getAttribute("sushenumber");
    String sushelocation = (String) request.getAttribute("sushelocation");
    String susheguaranteecontent = (String) request.getAttribute("susheguaranteecontent");
    List<String> personnamelist = (List<String>) request.getAttribute("personnamelist");
    String susheclean = (String) request.getAttribute("susheclean");
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
            var susheguaranteecontent=$.trim($("#susheguaranteecontent").val());
            var susheclean=$.trim($("#susheclean").val());
            if(susheguaranteecontent.length==0){
                alert("请输入您的宿舍报修内容");
                $("#susheguaranteecontent").focus();
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
        <li>宿舍信息管理</li>
        <li>宿舍报修处理</li>
    </ul>
</div>
<form action = "/sushe-student/update-sushebaoxiu" method = "post"   class="validate" onsubmit="return add();" >

<div class="formbody">

    <div class="formtitle"><span>宿舍报修信息</span></div>
    <ul class="forminfo">
        <li>
            <label>宿舍地点</label>
            <input name="sushelocation" id="sushelocation" class="dfinput  required" value="<%=sushelocation%>" readonly="true"/>&nbsp;&nbsp;&nbsp;
        </li>
        <li>
            <label>宿舍号</label>
            <input name="sushenumber" id="sushenumber" class="dfinput  required" value="<%=sushenumber%>" readonly="true"/>&nbsp;&nbsp;&nbsp;
        </li>

        <li>
            <label>损坏情况</label>
            <input name="susheguaranteecontent" id="susheguaranteecontent" class="dfinput  required" value="" placeholder="请输入您需要报修的信息"/>&nbsp;&nbsp;&nbsp;
        </li>
        <li>
            <label>&nbsp;</label>
            <input type="submit" class="btn" value="确认修改"/>
            <a href="/sushe-student/sushebaoxiu-student"><input type="button" class="btn" value="返回"/></a>
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
