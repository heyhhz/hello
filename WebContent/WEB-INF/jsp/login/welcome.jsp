<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>欢迎页面</title>
</head>
<body>

	<s:debug />

	<div style="width: 500px; margin: 0 auto; border: 1px solid #999; padding: 10px;">
		<p>
			欢迎：
			<s:property value="acc.username" />
			来到首页
		</p>
		<p>
			您是一个<s:property value="#session.types[acc.acctype]" />
		</p>
		<p>
			您的生日为：
			<s:date format="yyyy年MM月dd日" name="acc.birthday" />
		</p>
		<p>
			您的手机号码：
			<s:property value="acc.phone" />
		</p>
		
		
		<div>
			<p><a href='<s:url action="listAll" namespace="/emp" />'>点击查看所有员工</a></p>
		</div>
	</div>



</body>
</html>