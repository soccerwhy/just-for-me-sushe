<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page isELIgnored="false" %> 
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<link rel="stylesheet" href="<%=path%>/css/woncore.css" type="text/css"></link>
		<link href="<%=basePath %>css/style.css" rel="stylesheet" type="text/css" />
	</head>
	<%
			List<Map<String, String>> list = (List<Map<String, String>>)request.getAttribute("list");
		String date = request.getParameter("date");
		date = date == null?"":date;
		%>
	<div class="place">
	<span>位置：</span>
	<ul class="placeul">
		<li><a href="#">器材租赁管理</a></li>
		<li><a href="#">租凭情况</a></li>
	</ul>
</div>

	<BODY>
    <div class="body-box">
		<TABLE cellSpacing=1 cellPadding=4 width="100%" border=0>
		<c:if test="${!empty list}">
			<c:forEach items="${list}" var="list" varStatus="vs">
			    <TR>
				<TD>
					<TABLE class=tpt width="100%" border=0>
						<TBODY>
							<TR bgColor=#cccccc>
								<TD align=middle width="10%">
									<STRONG>评论人：</STRONG>
								</TD>
								<TD width="47%">
									<FONT color=#000000>&nbsp;${list.account}</FONT>
								</TD>
								<TD align=middle width="14%">
									<STRONG>评论时间：</STRONG>
								</TD>
								<TD width="29%">
									<FONT color=#000000>&nbsp;${list.date}</FONT>
								</TD>
							</TR>
							<TR>
								<TD align=middle>
									<STRONG>评论等级：</STRONG>
								</TD>
								<TD colSpan=3>
									<FONT color=#000000>&nbsp;${list.pingji}</FONT>
								</TD>
							</TR>
							<TR>
								<TD vAlign=top align=middle>
									<STRONG>内容：</STRONG>
								</TD>
								<TD colSpan=3>
									${list.content}
								</TD>
							</TR>
						</TBODY>
					</TABLE>
				</TD>
			</TR>
			</c:forEach>
		</c:if>
		<c:if test="${empty list}">
			<tr>
				<td colspan="8" align="center">
					<strong><font color="red">暂时没有数据，请添加</font></strong>
				</td>
			</tr>
		</c:if>
		</TABLE>
		<BR>
		<form action="<%=path %>/liuyanAdd.action" method="post">
		<table border="0">
		     <tr>
		         <td style="font-size: 11px;">标题</td>
		         <td><input name="date"  value="<%=date %>" type="text" class="dfinput required date" /></td>
		     </tr>
		     <tr>
		         <td style="font-size: 11px;">内容</td>
		         <td>
		             <textarea name="content" id="editor_id" cols="100" rows="8" style="width:700px;height:200px" class="dfinput required" ></textarea><font color="red">*</font>
                 </td>
		     </tr>
		     <tr>
		         <td style="font-size: 11px;">&nbsp;</td>
		         <td>
		           		<input type="submit" class="btn" value="确认"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                 </td>
		     </tr>
		</table>
		</form>
	</div>
	</BODY>
</html>
