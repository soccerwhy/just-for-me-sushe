<%--
  Created by IntelliJ IDEA.
  User: 10218
  Date: 2019/06/30
  Time: 11:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath() + "/";
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
%>
<html>
<head>
    <title>$Title$</title>
    <script type="text/javascript" src="<%=basePath %>plugins/jQuery/jquery.js"></script>

</head>
<body>
<input id="btnLoad" type="button" value="加载">
$END$
<div id="divContent"></div>
<script type="text/javascript">
    document.getElementById("btnLoad").onclick = function () {


        $.ajax({
            url:"/example/ajax",       //请求地址
            type:"get",         //请求方式
            //data:"name=林子闲&wife=乔韵",            //这里的data:发送给服务器的请求数据
            success:function(data){  //回调函数：数据请求成功之后调用
                var t= data;
                alert(t);
                document.getElementById("divContent").innerHTML = t;
            },
            // dataType:"json",
            //dataType:"xml"     设置请求回来的数据格式是json还是xml.
            //也可以在php文件里设置数据格式    header("content-type:application/json;charset=utf-8");
        })



        // 1. 创建XMLHttpRequest对象
//        var xmlhttp;
//        if (window.XMLHttpRequest){
//            xmlhttp = new XMLHttpRequest();
//        }else {
//            xmlhttp = new ActiveXObject("Microsoft.XMLHTTP")
//        }
//        console.log(xmlhttp);
//        // 2. 发送Ajax请求
//        xmlhttp.open("GET","/example/ajax",true)
//        xmlhttp.send();
//        // 3. 处理服务器响应
//        xmlhttp.onreadystatechange = function () {
//            if (xmlhttp.readyState == 4 && xmlhttp.status == 200){
//                var t= xmlhttp.responseText;
//                alert(t);
//                document.getElementById("divContent").innerHTML = t;
//            }
//        }
    }
</script>
</body>
</html>
