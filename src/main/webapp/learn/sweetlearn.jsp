<%--
  Created by IntelliJ IDEA.
  User: mac
  Date: 2020/2/3
  Time: 上午11:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script type="text/javascript"
            src="sweetalert-dev.js"></script>
    <link href="sweetalert.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript"
            src="jquery-3.2.1.js"></script>


    <script type="text/javascript">
        $(function(){
            swal({
                    title: "输入！",
                    text: "输入一些有趣的话：<span style=\"color:#F8BB86\">fuck everyone</span>",
                    type: "input",
                    showCancelButton: true,
                    closeOnConfirm: false,
                    html:true,
                    animation: "slide-from-top",
                    inputPlaceholder: "输入一些话"
                },
                function(inputValue){
                    if (inputValue === false) returnfalse;

                    if (inputValue === "") {
                        swal.showInputError("你需要输入一些话！");
                        return false
                    }

                    swal("非常好！", "你输入了：" + inputValue,"success");
                });
        });
    </script>
</head>
<body>

</body>
</html>
