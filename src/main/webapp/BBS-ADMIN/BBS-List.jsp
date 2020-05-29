<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ page import="com.example.springbootbase.model.BBS" %>
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
<%
    List<BBS> list = (List<BBS>) request.getAttribute("list");
%>

<body>
<div class="place">
    <blockquote><span>位置：</span></blockquote>
    <ul class="placeul">
        <li>BBS论坛</li>
        <li>论坛信息</li>
    </ul>
</div>
<form action="/BBS/obscure-match" method="post">
    <div class="formbody">
        <div class="formtitle" style="cursor: pointer;" id="formtitle"><span>BBS内容列表</span></div>
        <ul class="forminfo" style="display: none;" id="forminfo">
            <%--<li>--%>
            <%--<label>关键词</label>--%>
            <%--<input name="keyword" id="keyword" value="" class="dfinput required " />--%>
            <%--</li>--%>
            <%--<li>--%>
            <%--<label>&nbsp;</label>--%>
            <%--<input name="" type="submit" class="btn" value="查询"/>--%>
            <%--</li>--%>
            <%--<li>--%>
            <%--&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;BBS论坛--%>
            <%--</li>--%>

        </ul>
    </div>
</form>
<table class="imgtable"border = "5" >
    <thead>
    <tr>
        <th>BBS标题</th>
        <th>宿舍号码</th>
        <th>操作</th>
    </tr>
    </thead>
    <tbody>
    <c:if test="${!empty list}">
        <c:forEach items="${list}" var="list" varStatus="vs">
            <tr>
                <td>${list.bbstitle}</td>
                <td>${list.susheid}</td>
                <td>
                    <a href = "/BBS-ADMIN/BBSDetail?bbstitle=${list.bbstitle}"><font color="blue">查看帖子</font></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <a href = "/BBS-ADMIN/DELETE-BBS?bbstitle=${list.bbstitle}"><font color="blue">删除帖子</font></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
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
<form action="/BBS-ADMIN/show-content" method="get" rel="page">
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

