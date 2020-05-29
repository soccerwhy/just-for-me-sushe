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
        <li>团队信息管理</li>
        <li>申请加入团队</li>
    </ul>
</div>
<form action="/team-volunteer/obscure-match" method="post">
    <div class="formbody">
        <div class="formtitle" style="cursor: pointer;" id="formtitle"><span>条件查询</span></div>
        <ul class="forminfo" style="display: none;" id="forminfo">
            <li>
                <label>团队编号</label>
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
        <th>团队名</th>
        <th>所在地点</th>
        <th>团队人数</th>
        <th>团队口号</th>
        <th>操作</th>
    </tr>
    </thead>
    <tbody>
    <c:if test="${!empty list}">
        <c:forEach items="${list}" var="list" varStatus="vs">
            <tr>
                <td>${list.teamid}</td>
                <td>${list.name}</td>
                <td>${list.location}</td>
                <td>${list.number}</td>
                <td>${list.slogan}</td>
                <td>
                    <a href = "/team-volunteer/joinTeam?teamId=${list.teamid}&personId=${personId}"><font color="blue">申请加入</font></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <a href = "/team-volunteer/applyTeamLeader?teamId=${list.teamid}&personId=${personId}" onclick="toAdd()" ><font color="blue">申请组长
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
<form action="/team-volunteer/team-list-volunteer" method="get" rel="page">
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

