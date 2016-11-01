<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>显示所有员工信息</title>
<script src="${pageContext.request.contextPath }/js/jquery-1.7.2.js"></script>
<script>
	$(function() {
		$("#search").on(
				"click",
				function() {
					var ename = $("#sname").val();

					$.ajax({
						url : 'searchEmp.html',
						type : 'post',
						data : {
							'input' : ename
						},
						success : function(data) {
							var html = "";
							html += "<tr>";

							html += "<td>姓名</td>";
							html += "<td>工作</td>";
							html += "<td>工资</td>";
							html += "</tr>";

							for ( var i in data) {

								html += "<tr>";
								html += " <td>" + data[i].ename + "</td>";
								html += " <td>" + data[i].job + "</td>";
								html += " <td>" + data[i].sal + "</td>";
								<s:if test="#session.account.acctype == 2 || #session.account.acctype == 3">
								html += "<td><a href='delete.html?ename="
										+ data[i].ename + "'>删除</a></td>"
								</s:if>
								html += "</tr>";
							}

							$("#dialog").html(html);

						},
						error : function() {
							alert(发送失败);
						}
					});
				});
	});
	
</script>

</head>
<body>
<%@ include file="../pages/header.jspf" %>
	<s:debug></s:debug>
	
	<!-- 用 AJAX的方式实现 -->
	<div>
		<s:textfield id="sname" /><input type="button" id="search" value="搜索(AJAX)" />
	</div>

	<!-- 用 Form 表单的形式实现 -->
	<div>
		<s:form action="filter" theme="simple">
			<s:textfield name="input" /> <s:submit value="搜索(FORM)" />
		</s:form>
	</div>

	<div>
		<div style="color:red">${fieldErrors.max[0]}</div>
		<s:form action="filterSal" theme="simple">
			<s:textfield name="min" type="number" /> - 
			<s:textfield name="max" type="number" />
			<s:submit value="按照工资范围搜索" />
		</s:form>
	</div>
	<a href="addIndex">添加员工</a>

	<table id="dialog">
		<tr>
			<td>姓名</td>
			<td>工作</td>
			<td>工资</td>
		</tr>

		<s:iterator var="j" value="emps">
			<tr>
				<td>${ename}</td>
				<td><s:property value="job" /></td>
				<td><s:property value="#j.sal" /></td>
				<td><a href="delete.html?emp.empno=${empno}">删   除</a></td>
			</tr>
		</s:iterator>

	</table>

</body>
</html>