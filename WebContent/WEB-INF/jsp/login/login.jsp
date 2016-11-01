<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><s:text name="action.login.title" /></title>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/common.css"></link>
</head>
<body>

<%@ include file="../pages/header.jspf" %>
<%-- <jsp:include page="/WEB-INF/jsp/pages/header.jspf" />  --%>

<div class="centerblock">
	
	<s:form action="loginSubmit">
		<s:textfield name="name" key="action.login.name" autocomplete="off"></s:textfield>
		<s:password name="pwd" key="action.login.pwd"></s:password>
		<s:submit key="action.login.sbm"></s:submit>
		<s:token></s:token>
	</s:form>
	
</div>

<div><s:text name="action.login.gotoregister" /><a href="register.html">&nbsp;<s:text name="action.register" /></a></div>



<s:debug></s:debug>

</body>
</html>