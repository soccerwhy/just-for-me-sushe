<%--
  Created by IntelliJ IDEA.
  User: mac
  Date: 2020/2/14
  Time: 上午11:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>html5上传后立即显示</title>
        <script type="text/javascript">
    function ProcessFile(e) {
        var file = document.getElementById('file').files[0];
        if (file) {
            var reader = new FileReader();
            reader.onload = function (event) {
                var txt = event.target.result;

                var img = document.createElement("img");
                img.src = txt;//将图片base64字符串赋值给img的src
                document.getElementById("result").appendChild(img);
            };
        }
        reader.readAsDataURL(file);
    }

    function contentLoaded() {
        document.getElementById('file').addEventListener('change',
            ProcessFile, false);
    }

    window.addEventListener("DOMContentLoaded", contentLoaded, false);
</script>
</head>
<body>
请选取一个图像文件: <input type="file" id="file" name="file"/>
<div id="result"></div>
<div><img src="1.jpg"></div>
</body>
</html>