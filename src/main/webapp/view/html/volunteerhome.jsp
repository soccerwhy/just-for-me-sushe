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
		String number = (String)session.getAttribute("number");
		number = number == null?"":number;
		String name = (String)session.getAttribute("name");
		name = name == null?"":name;
		%>
<body>
    <div class="warp">
        <!--头部开始-->
        <div class="top_c">
            <div class="top-menu">
                <ul class="top-menu-nav">
                 <li><a href="#"><font color="red" size="2"><p id="mydate"></p></font></a></li>
                    <li><a href="<%=basePath%>login.jsp">切换账号</a></li>
					<li><a href="#" onclick="loginOut()">安全退出</a></li>
                </ul>
            </div>
            <div class="top-nav">欢迎您~志愿者--<font color="red"><%=name %></font></div>
        </div>
        <!--头部结束-->
        <!--左边菜单开始-->
        <div class="left_c left">
            <div align="center"><h1>操作菜单</h1></div>
            <div class="acc">
            	<div align="center">
                    <a class="one">个人信息管理</a>
                    <ul class="kid">
                        <li><a target="Conframe" href=" <%=basePath %>user.do?method=selMy&number=<%=number %>">查看个人信息</a></li>
                     <li><a target="Conframe" href=" <%=basePath %>administrator.do?method=selUser1&id=<%=id %>">修改个人信息</a></li>
                    </ul>
                </div>
                <div align="center">
                    <a class="one">团队信息</a>
                    <ul class="kid">
                        <li><a target="Conframe" href=" <%=basePath %>notice.do?method=setNoticeTea">查看团队信息</a></li>
                        <li><a target="Conframe" href="<%=basePath %>notice.do?method=showMyCampus">申请团队信息</a></li>
                    </ul>
                </div>
                <div align="center">
                    <a class="one">活动信息</a>
                    <ul class="kid">
                        <li><a target="Conframe" href="<%=basePath %>shangpin.do?method=selTk">查看活动信息</a></li>
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
        <div class="bottom_c">志愿服务平台</div>
        <!--底部结束-->
    </div>
</body>
</html>

