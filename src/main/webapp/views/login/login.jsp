<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Welcome System!!!</title>
    <link href="css/style.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="plugins/jQuery/jquery.js"></script>
    <!-- 引入artDailog支持的库 -->
    <script language="JavaScript" src="resource/admin/js/jquery.js"></script>
    <link rel="stylesheet" href="resource/admin/artDialog/css/ui-dialog.css">
    <script language="JavaScript" src="resource/admin/artDialog/dist/dialog-plus.js"></script>
    <style type="text/css">
        .sushe{
            position: absolute;
            width: 480px;
            height: 200px;
            top: 100px;
            left: 590px;
            font-size: 44px;
        }
    </style>
    <script language="javascript">
        $(function() {
            $('.loginbox').css( {
                'position' : 'absolute',
                'left' : ($(window).width() - 692) / 2
            });
            $(window).resize(function() {
                $('.loginbox').css( {
                    'position' : 'absolute',
                    'left' : ($(window).width() - 692) / 2
                });
            });
        });
    </script>
    <script>
        function changeVerifyCode(){
            document.getElementById("validateCodeImg").src="/login/VerifyCodeServlet?t="+Math.random();

        }
    </script>
</head>
<body>
<!-- 顶部导航 -->
<div class="logintop">
    <span><font color="blue">欢迎登录</font></span>
    <ul>
        <li><a href="javascript:void(0)"><font color="blue">帮助</font></a></li>
        <li><a href="javascript:void(0)"><font color="blue">关于</font></a></li>
    </ul>
</div>
<div class="sushe">校园宿舍信息管理系统</div>
<div class="loginbody">
    <span class="systemlogo"></span>
    <div class="loginbox">
            <form action="main" onsubmit="return login()">
            <ul>
                <li>
                    <input name="studentid" id="studentid" class="loginuser"
                           placeholder="请输入学号" />
                </li>
                <li>
                    <input name="password" id="password"  type="password" class="loginpwd" name="password"
                           placeholder="请输入密码" />
                    <input name="code" id="code" class="logincode" placeholder="请输入验证码"/>
                    <img src="/login/VerifyCodeServlet" border=0 id="validateCodeImg" style="height: 25px; width: 57px"/>
                    <a href="#" onclick="changeVerifyCode()">&nbsp;&nbsp;看不清？换一张</a>
                </li>
                <li>
                    <input type="radio" value="学生" id="role" name="role"/>学生&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <input type="radio" value="管理员" id="role" name="role"/>管理员&nbsp;
                    <input type="submit" class="loginbtn" value="登录" />&nbsp;&nbsp;
                </li>
            </ul>
        </form>
    </div>

</div>
</body>
</html>



