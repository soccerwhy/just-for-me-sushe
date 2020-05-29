<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ page import="com.example.springbootbase.model.Sushe" %>
<%
	String path = request.getContextPath() + "/";
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<head>
	<base href="<%=basePath%>"/>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<link href="<%=basePath %>css/style.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="resource/commons/utils.js"></script>

	<script type="text/javascript">
        $(function(){
            $("#name").focus();
        })

        function add(){
            var number=$.trim($("#number").val());
            var location=$.trim($("#location").val());
            var clean=$.trim($("#clean").val());
            var guaranteecontent=$.trim($("#guaranteecontent").val());

            if(number.length==0){
                alert("请输入宿舍号码");
                $("#number").focus();
                return false;
            }
            if(location.length==0){
                alert("请输入宿舍地点");
                $("#location").focus();
                return false;
            }
            if(clean.length==0){
                alert("请输入宿舍清洁情况");
                $("#clean").focus();
                return false;
            }
            if(guaranteecontent.length==0){
                alert("请输入申请宿舍损坏情况");
                $("#guaranteecontent").focus();
                return false;
            }
            return true;
        }
	</script>

</head>
			<%
				List<Sushe> team = (List<Sushe>) request.getAttribute("sushe");
			%>
<body>
<div class="place">
	<span>位置：</span>
	<ul class="placeul">
		<li>宿舍及晚归管理</li>
		<li>修改宿舍信息</li>
	</ul>
</div>
<form action = "/team/updateTeam" method = "post"   class="validate" onsubmit="return add();" >
	<input name="id" id="id"  type="hidden" value="<%=team.get(0).getSusheid()%>" class="dfinput required" />
	<div class="formbody">
		<div class="formtitle"><span>修改宿舍信息</span></div>
		<ul class="forminfo">
			<li>
				<label>宿舍编号</label>
				<input name="number" id="number" value="<%=team.get(0).getNumber() %>"  class="dfinput required" /><font color="red">*</font>必填
			</li>
			<li>
				<label>宿舍地点</label>
				<input name="location" id="location" value="<%=team.get(0).getLocation() %>" class="dfinput required"  /><font color="red">*</font>必填
			</li>
			<li>
				<label>整洁情况</label>
				<input name="clean" id="clean" value="<%=team.get(0).getClean() %>" class="dfinput required" /><font color="red">*</font>必填
			</li>
			<li>
				<label>报修情况</label>
				<input name="guaranteecontent" id="guaranteecontent" value="<%=team.get(0).getGuaranteecontent() %>" class="dfinput required" /><font color="red">*</font>必填
			</li>
			<li>
				<label>&nbsp;</label>
					<input type="submit" class="btn" value="确认修改"/>
				<a href="/team/team-list"><input type="button" class="btn" value="返回"/></a>
			</li>
		</ul>
	</div>
</form>
<script type="text/javascript">
	$(function(){
		$('.tablelist tbody tr:odd').addClass('odd');
		
		$("#formtitle").click(function(){
			$("#forminfo").slideToggle("slow");
		});
	});
</script>
<script type="text/javascript" src="<%=basePath %>plugins/jQuery/jquery.js"></script>
<script type="text/javascript" src="<%=basePath %>js/validate.js"></script>
<script type="text/javascript" src="<%=path %>plugins/imagePreview/imagePreview.js"></script>
<script type="text/javascript" src="<%=path%>plugins/My97DatePicker/WdatePicker.js"></script> 
</body>
</html>
	