<%--suppress ALL --%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ page import="com.example.springbootbase.model.TeamApply" %>
<%
    String path = request.getContextPath() + "/";
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<head>
    <base href="<%=basePath%>"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>查询申请信息</title>
    <script type="text/javascript" src="<%=basePath%>sweetalert-dev.js"></script>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>sweetalert.css"/>

    <link href="<%=basePath %>css/style.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="<%=basePath %>plugins/jQuery/jquery.js"></script>
    <!-- 引入JQuery支持的库 -->

    <!-- 引入artDailog支持的库 -->
    <link rel="stylesheet" href="<%=basePath %>resource/admin/artDialog/css/ui-dialog.css">
    <script language="JavaScript" src="<%=basePath %>resource/admin/artDialog/dist/dialog-plus.js"></script>
    <script type="text/javascript" src="<%=path%>plugins/My97DatePicker/WdatePicker.js"></script>
    <script type="text/javascript">
        function resultTrue(id) {

            swal({title:"申请通过",
                    text:"请输入原因",
                    type:"input",
                    showConfirmButton:true,
                    confirmButtonText:'确 认',
                    confirmButtonColor:"#72dd47",},
//                    confirmButtonColor:"#dd6b55",}, 红色
                function (inputValue) {

                    // 1. 创建XMLHttpRequest对象
                    var xmlhttp;
                    if (window.XMLHttpRequest) {
                        xmlhttp = new XMLHttpRequest();
                    } else {
                        xmlhttp = new ActiveXObject("Microsoft.XMLHTTP")
                    }
                    console.log(xmlhttp);
                    // 2. 发送Ajax请求
                    xmlhttp.open("Post", "/wanguiapply-admin/updateResultTrue?applyid=" + id + "&reason=" + inputValue, true)
                    xmlhttp.send();
                    // 3. 处理服务器响应
                    swal({
                        title: "提交成功",
                        text:"请重新刷新页面",
                        type:"success",
                        timer: 2000,
                        showConfirmButton: true,
                    }).setInterval(1000);
                });
        }



        function resultFalse(id) {

            swal({title:"申请失败",
                    text:"请输入原因",
                    type:"input",
                    showConfirmButton:true,
                    confirmButtonText:'确 认',
                    confirmButtonColor:"#dd3735",},
//                    confirmButtonColor:"#dd6b55",}, 红色
                function (inputValue) {

                    // 1. 创建XMLHttpRequest对象
                    var xmlhttp;
                    if (window.XMLHttpRequest) {
                        xmlhttp = new XMLHttpRequest();
                    } else {
                        xmlhttp = new ActiveXObject("Microsoft.XMLHTTP")
                    }
                    console.log(xmlhttp);
                    // 2. 发送Ajax请求
                    xmlhttp.open("Post", "/wanguiapply-admin/updateResultFalse?applyid=" + id + "&reason=" + inputValue, true)
                    xmlhttp.send();
                    // 3. 处理服务器响应
                    xmlhttp.onreadystatechange = function () {
                        if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {

                        }
                    }
                    swal({
                        title: "提交成功",
                        text:"请重新刷新页面",
                        type:"success",
                        timer: 2000,
                        showConfirmButton: true,
                    }).setInterval(1000);

                });
        }

    </script>
    <style type="text/css">
        .whyinput{width:70px; height:27px;  border-top:solid 1px #a7b5bc; border-left:solid 1px #a7b5bc; border-right:solid 1px #ced9df; border-bottom:solid 1px #ced9df; background:url(../images/inputbg.gif) repeat-x; }
    </style>
</head>
<%
    List<TeamApply> list = (List<TeamApply>)request.getAttribute("list");
%>

<body background="images/a.jpg">
<div class="place">
    <blockquote><span>位置：</span></blockquote>
    <ul class="placeul">
        <li>宿舍及晚归管理</li>
        <li>申请晚归信息</li>
    </ul>
</div>
<form action="/wanguiapply-admin/obscure-match" method="post">
    <div class="formbody">
        <div class="formtitle" style="cursor: pointer;" id="formtitle"><span>条件查询</span></div>
        <ul class="forminfo" style="display: none;" id="forminfo">
            <li>
                年级:
                <input name="grade" id="grade" value="" width="100px" height="50px" class="whyinput"/> &nbsp;&nbsp;
            </li>
            <li>
                <input name="" type="submit" class="btn" value="查询"/>
            </li>
        </ul>
    </div>
</form>
<table class="imgtable"border = "5" >
    <thead>
    <tr>
        <th>申请人姓名</th>
        <th>申请人班级</th>
        <th>申请人专业</th>
        <th>申请内容</th>
        <th>申请结果</th>
        <th>原因</th>
        <th>操作</th>
    </tr>
    </thead>
    <tbody>
    <c:if test="${!empty list}">
        <c:forEach items="${list}" var="list" varStatus="vs">
            <tr>
                    <%--<td>${vs.index+1}</td>--%>
                <td>${list.personname}</td>
                <td>${list.persongrade}</td>
                <td>${list.personmajor}</td>
                <td>${list.applycontent}</td>
                <td>${list.applyresult}</td>
                <td>${list.applyreason}</td>
                <td>
                    <a href = "javascript:void(0);" onclick="resultTrue(${list.applyid})"><font color="blue">通过</font></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <a href = "javascript:void(0);" onclick="resultFalse(${list.applyid})" ><font color="blue">拒绝
                    </font></a>&nbsp;&nbsp;&nbsp;
                        <%--<input name="cause" id="cause" class="dfinput  required" placeholder="原因:" />&nbsp;<font color="red">*</font>--%>
                </td>
            </tr>
        </c:forEach>
    </c:if>
    <c:if test="${empty list}">
        <tr>
            <td colspan="8" align="center">
                <strong><font color="red">暂时没有数据，请添加</font></strong>
            </td>
        </tr>
    </c:if>

    </tbody>
</table>
<form action="/wanguiapply-admin/waigui-list-admin" method="get" rel="page">
    <jsp:include page="/plugins/page/page.jsp"></jsp:include>
</form>

<script type="text/javascript">
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

</html>

