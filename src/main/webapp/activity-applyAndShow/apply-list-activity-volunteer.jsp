<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%
    String path = request.getContextPath() + "/";
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<head>
    <base href="<%=basePath%>"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>查询团队信息</title>
    <link href="<%=basePath %>css/style.css" rel="stylesheet" type="text/css" />
</head>

<body>
<div class="place">
    <blockquote><span>位置：</span></blockquote>
    <ul class="placeul">
        <li>活动信息管理</li>
        <li>活动申请</li>
    </ul>
</div>
<form action="/activity-applyAndShow/obscure-match" method="post">
    <div class="formbody">
        <div class="formtitle" style="cursor: pointer;" id="formtitle"><span>条件查询</span></div>
        <ul class="forminfo" style="display: none;" id="forminfo">
            <li>
                <label>活动编号</label>
                <input name="number" id="number" value="" class="dfinput required " />
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
        <th>活动名称</th>
        <th>地点</th>
        <th>时间</th>
        <th>活动内容</th>
        <th>操作</th>
    </tr>
    </thead>
    <tbody>
    <c:if test="${!empty list}">
        <c:forEach items="${list}" var="list" varStatus="vs">
            <tr>
                <td>${list.activityid}</td>
                <td>${list.name}</td>
                <td>${list.location}</td>
                <td>${list.time}</td>
                <td>${list.content}</td>
                <td>
                    <a href = "/activity-applyAndShow/joinActivity?activityId=${list.activityid}&personId=${personId}"><font color="blue">申请加入</font></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    </font></a>
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
<form action="/activity-applyAndShow/activity-list-teamApply" method="get" rel="page">
    <jsp:include page="/plugins/page/page.jsp"></jsp:include>
</form>
<script type="text/javascript" src="<%=basePath %>plugins/jQuery/jquery.js"></script>
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
<script type="text/javascript" src="<%=path%>plugins/My97DatePicker/WdatePicker.js"></script>
</html>

