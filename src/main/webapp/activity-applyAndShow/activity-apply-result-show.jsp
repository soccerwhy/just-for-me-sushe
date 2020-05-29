<%--suppress ALL --%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ page import="com.example.springbootbase.model.TeamApply" %>
<%@ page import="com.example.springbootbase.model.ActivityApply" %>
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
    <link href="<%=basePath %>css/style.css" rel="stylesheet" type="text/css" />
    <!-- 引入JQuery支持的库 -->
    <script type="text/javascript" src="<%=basePath %>plugins/jQuery/jquery.js"></script>

    <!-- 引入artDailog支持的库 -->
    <link rel="stylesheet" href="<%=basePath %>resource/admin/artDialog/css/ui-dialog.css">
    <script language="JavaScript" src="<%=basePath %>resource/admin/artDialog/dist/dialog-plus.js"></script>
    <script type="text/javascript" src="<%=path%>plugins/My97DatePicker/WdatePicker.js"></script>
</head>
<%
    List<ActivityApply> list = (List<ActivityApply>)request.getAttribute("list");
    String title = request.getParameter("title");
    title = title == null?"":title;
%>

<body background="images/a.jpg">
<div class="place">
    <blockquote><span>位置：</span></blockquote>
    <ul class="placeul">
        <li>活动信息管理</li>
        <li>申请结果信息</li>
    </ul>
</div>
<form action="/activity-applyAndShow/obscure-result-match" method="post" rel="page">
    <div class="formbody">
        <div class="formtitle" style="cursor: pointer;" id="formtitle"><span>条件查询</span></div>
        <ul class="forminfo" style="display: none;" id="forminfo">
            <li>
                <label>申请单编号</label>
                <input name="number" id="number" value="<%=title %>" class="dfinput required " />
            </li>
            <li>
                <label>&nbsp;</label>
                <input name="" type="submit" class="btn" value="查询"/>
            </li>
        </ul>
    </div>
</form>
<table class="imgtable"border = "5" >
    <thead>
    <tr>
        <th>编号</th>
        <th>团队队长</th>
        <th>团队名称</th>
        <th>活动名称</th>
        <th>申请结果</th>
        <th>原因</th>
    </tr>
    </thead>
    <tbody>
    <c:if test="${!empty list}">
        <c:forEach items="${list}" var="list" varStatus="vs">
            <tr>
                    <%--<td>${vs.index+1}</td>--%>
                <td>${list.id}</td>
                <td>${list.username}</td>
                <td>${list.teamname}</td>
                <td>${list.activityname}</td>
                <td>${list.result}</td>
                <td>${list.reason}</td>

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
<form action="/activity-applyAndShow/actitivity-teamApply-result-show" method="get" rel="page">
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

