<%--
  Created by IntelliJ IDEA.
  User: mac
  Date: 2020/2/15
  Time: 上午8:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<form action="@Url.Action()" method="get" id="formAction">

    <div class="type-table">
        <table border="0" cellspacing="0" cellpadding="0">
            <tr>
                <td>类型：</td>
                <td><span data-cate="all" data-type="type" class="active">全部</span> <span data-cate="qz" data-type="qz">全职</span> <span data-cate="jz" data-type="jz">兼职</span></td>
            </tr>
            <tr style="display:none;" id="qtqzNone"></tr>

            <tr style="display:none" id="qtqz">
                <td>类别：</td>
                <td><span data-cate="all" data-category="category" class="active">全部</span> <span data-cate="mrmf" data-category="mrmf">美容/美发</span> <span data-cate="bmys" data-category="bmys">保姆/月嫂</span> <span data-cate="dnit" data-category="dnit">电脑/IT</span> <span data-cate="bgwy" data-category="bgwy">办公文员</span> <span data-cate="zsyl" data-category="zsyl">诊所医疗</span> <span data-cate="yyy" data-category="yyy">营业员</span> <span data-cate="mj" data-category="mj">美甲</span> <span data-cate="sj" data-category="sj">司机</span> <span data-cate="yc" data-category="yc">衣产</span> <span data-cate="jbktv" data-category="jbktv">酒吧/KTV</span> <span data-cate="zx" data-category="zx">装修</span> <span data-cate="qt" data-category="qt">其他</span> </td>
            </tr>

            <tr style="display:none;" id="cyqzCate">
                <td>类别：</td>
                <td><span data-cate="all" data-category="category" class="active">全部</span> <span data-cate="zc" data-category="zc">中餐</span> <span data-cate="rc" data-category="rc">日餐</span> <span data-cate="fqg" data-category="fqg">夫妻工</span> <span data-cate="qtcy" data-category="qtcy">其他餐饮</span></td>
            </tr>
            <tr style="display:none;" id="cyqzCates">
                <td>职位：</td>
                <td><span data-cate="jl" data-position="jl">经理</span> <span data-cate="jdh" data-position="jdh">接电话</span> <span data-cate="qt" data-position="qt">企台</span> <span data-cate="dbdw" data-position="dbdw">打包/带位</span> <span data-cate="kt" data-position="kt">看台</span> <span data-cate="dc" data-position="dc">大厨</span> <span data-cate="cg" data-position="cg">炒锅</span> <span data-cate="bc" data-position="bc">帮炒</span> <span data-cate="dz" data-position="dz">打杂</span> <span data-cate="yg" data-position="yg">油锅</span> <span data-cate="sc" data-position="sc">送餐</span> <span data-cate="qt" data-position="qt">其他</span></td>
            </tr>

        </table>
    </div>
    <div class="search">
        <input type="hidden" name="cateId" value="@Request.QueryString["cateId"]" />
        <input type="text" name="filter" value="@Request.QueryString["filter"]" placeholder="请输入关键字" />
        <input type="hidden" name="posParam" id="posParam" value="@Request.QueryString["posParam"]" />
        <input type="hidden" name="cateParam" id="cateParam" value="@Request.QueryString["cateParam"]" />
        <input type="hidden" name="typeParam" id="typeParam" value="@Request.QueryString["typeParam"]" />
        <button type="submit">搜索</button>
    </div>

    <div class="area">
        区域：<select id="AreaIds" name="AreaIds"></select>
        <input id="areaId" name="areaId" type="hidden" value="@Request.QueryString["areaId"]" />
    </div>
</form>



</body>
</html>
