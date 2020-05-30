<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%
	String path = request.getContextPath() + "/";
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html lang="en" class="no-js">


    <head>
    

        <meta charset="UTF-8">
        <title>志愿服务平台</title>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>styles/admin-all.css" />
    <link rel="stylesheet" type="text/css" href="<%=basePath%>styles/base.css" />
    <link rel="stylesheet" type="text/css" href="<%=basePath%>styles/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="<%=basePath%>styles/ui-lightness/jquery-ui-1.8.22.custom.css" />
    <script type="text/javascript" src="<%=basePath%>scripts/jquery-1.7.2.js"></script>
	<script type="text/javascript" src="<%=basePath%>easyloader.js"></script>
    <script type="text/javascript" src="<%=basePath%>scripts/jquery-ui-1.8.22.custom.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>scripts/index.js"></script>
<script type="text/javascript">
		function loginOut(){
			if(window.confirm("您确定要退出系统吗？")){
				window.top.location.href="<%=basePath%>login.jsp"
		}
	}
    </script>
    <script type="text/javascript">
    function testDate(){
	var date=new Date();
	var result=date.getFullYear()+"-"+(date.getMonth()+1)+"-"+date.getDate()+"  "+date.getHours()+":"+date.getMinutes()+":"+date.getSeconds();
	document.getElementById("mydate").innerHTML=result;
	}


	setInterval("testDate()", 1000);
    
     </script>
</head>
<%
		String account = (String)session.getAttribute("account");
		account = account == null?"":account;
		String id = (String)session.getAttribute("id");
		id = id == null?"":id;
		%>
<body  background="images/a.jpg">
    <div class="warp">
        <!--头部开始-->
        <div class="top_c">
            <div class="top-menu">
                <ul class="top-menu-nav">
                  <li><a href="#"><font color="red" size="2"><p id="mydate"></p></font></a></li>
                    <li><a href="<%=basePath%>/login/go">切换账号</a></li>
                    <li><a href="<%=basePath%>/login/go">安全退出</a></li>
                    <%--<li><a href="<%=basePath%>login.jsp">切换账号</a></li>--%>
					<%--<li><a href="#" onclick="loginOut()">安全退出</a></li>--%>
                </ul>
            </div>
            <div class="top-nav">欢迎您~管理员--<font color="red"><%=account %></font></div>
        </div>
        <!--头部结束-->
        <!--左边菜单开始-->
        <div class="left_c left">
            <div align="center"><h1>操作菜单</h1></div>
            <div class="acc">
          	 <div align="center">
                    <a class="one">个人信息管理</a>
                    <ul class="kid">
                        <%--<li><a target="Conframe" href=" <%=basePath %>/admin-info/single-admin-show?id=<%=id %>">查看个人信息</a></li>--%>
                        <%--<li><a target="Conframe" href=" <%=basePath %>/admin-info/single-admin-update?&id=<%=id %>">修改个人信息</a></li>--%>
                        <%--<li><a target="Conframe" href=" <%=basePath %>/admin-info/add-admin-jsp">增加管理员</a></li>--%>
                        <li><a target="Conframe" href=" <%=basePath %>/admin-info-personnew/single-admin-show?id=<%=id %>">查看个人信息</a></li>
                        <li><a target="Conframe" href=" <%=basePath %>/admin-info-personnew/single-admin-update?&id=<%=id %>">修改个人信息</a></li>
                        <li><a target="Conframe" href=" <%=basePath %>/admin-info-personnew/add-admin-jsp">增加管理员</a></li>
                    </ul>
                </div>
                <div align="center">
                    <a class="one">学生信息管理</a>
                    <ul class="kid">
                        <li><a target="Conframe" href=" <%=basePath %>/person_New/add-volunteers">添加学生信息</a></li>
                        <li><a target="Conframe" href=" <%=basePath %>/person_New/volunteer-list">查询学生信息</a></li>
                        <li><a target="Conframe" href=" <%=basePath %>/person_New/qinshi-fenpei">学生寝室分配</a></li>
                    </ul>
                </div>
                <div align="center">
                    <a class="one">宿舍及晚归管理</a>
                    <ul class="kid">
                        <li><a target="Conframe" href=" <%=basePath %>/team/add-team">添加宿舍信息</a></li>
                        <li><a target="Conframe" href=" <%=basePath %>/team/team-list">查询宿舍信息</a></li>
                        <li><a target="Conframe" href=" <%=basePath %>/wanguinewapply-admin/waigui-list-admin">申请晚归信息</a></li>
                    </ul>
                </div>
            	<div align="center">
                    <a class="one">来访人员管理</a>
                    <ul class="kid">
                        <li><a target="Conframe" href=" <%=basePath %>/laifang-admin/add-laifang-jsp">添加来访人员</a></li>
                        <li><a target="Conframe" href=" <%=basePath %>/laifang-admin/laifang-list-jsp">查看来访人员</a></li>
                    </ul>
                </div>
                <div align="center">
                    <a class="one">宿舍BBS管理</a>
                    <ul class="kid">
                        <li><a target="Conframe" href="<%=basePath %>/BBS-ADMIN/insert-content-page">发表帖子</a></li>
                        <li><a target="Conframe" href="<%=basePath %>/BBS-ADMIN/show-content">宿舍BBS信息</a></li>
                    </ul>
                </div>
            </div>
        </div>
        <!--左边菜单结束-->
        <!--右边框架开始-->
        <div class="right_c">
            <div class="nav-tip" onclick="javascript:void(0)">&nbsp;</div>
        </div>
        <div class="Conframe">
            <iframe name="Conframe" id="Conframe"></iframe>
        </div>
        <!--右边框架结束-->
        <!--底部开始-->
        <div class="bottom_c">宿舍管理平台 </div>
        <!--底部结束-->
    </div>
</body>
</html>

