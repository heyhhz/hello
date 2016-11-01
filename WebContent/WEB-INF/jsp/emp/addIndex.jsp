<%@page import="java.util.Random"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>员工增加</title>
</head>
<body>

<s:form action="addSubmit" method="post">
	<s:token />
	<s:textfield label="姓名" name="emp.ename"></s:textfield>
	<s:textfield label="工资" name="emp.sal"></s:textfield>
	<s:select label="职位" list="#session.jobs" name="emp.job"></s:select>
	<s:submit value="添加"></s:submit>
</s:form>

<s:debug></s:debug>
	
</body>
</html>