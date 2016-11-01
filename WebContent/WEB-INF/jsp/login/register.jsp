<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>注册页面</title>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/common.css"></link>
<script src="${pageContext.request.contextPath }/js/jquery-3.0.0.js"></script>
<script type="text/javascript">
	// 判断用户名是否已经被使用
	function checkName(e) {
		$.ajax({
			url : "judgeUsername3.html",
			type : "post",
			data : {
				"acc.username" : e.value
			},
			success : function(data) {
				console.log(JSON.stringify(data));
				$("#nameinfo").text(data);
			}
		});
	}
</script>
</head>

<body>
<%@ include file="../pages/header.jspf" %>
	<div class="centerblock">
		<s:form action="registerSubmit">
			<s:textfield label="账号" name="acc.username" onchange="checkName(this)" />
			<span style="color:red" id="nameinfo"></span>
			<s:password label="密码" name="acc.password" />
			<s:password label="确认密码" name="pwd" />
			<s:textfield label="生日" type="date" name="acc.birthday" />
			<s:select label="身份类型" name="acc.acctype" list="#session.types"></s:select>
			<s:textfield label="邮箱地址" name="acc.email"/>
			<s:textfield label="手机号码" name="acc.phone"/>
			<s:radio label="性別" name="acc.sex" list="#session.sexlist" value="3" listKey="code" listValue="name" />
			<s:checkbox label="是否同意我们的协议" name="ok" style="margin-top: 30px;"></s:checkbox>
			<s:submit value="注册" />
		</s:form>
		<s:debug></s:debug>
	</div>
</body>
</html>