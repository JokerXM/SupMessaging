<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>welcome</title>
<style type="text/css">

.hi
{
text-align:center;
border:2px solid #a1a1a1;
padding:10px 40px; 
background:#dddddd;
width:350px;
border-radius:25px;
margin-left: auto;
margin-right: auto;
margin-top:80px;
}


table.gridtable {
	font-family: verdana,arial,sans-serif;
	font-size:11px;
	color:#333333;
	border-width: 1px;
	border-color: #666666;
	border-collapse: collapse;
}
table.gridtable th {
	border-width: 1px;
	padding: 8px;
	border-style: solid;
	border-color: #666666;
	background-color: #dedede;
}
table.gridtable td {
	border-width: 1px;
	padding: 8px;
	border-style: solid;
	border-color: #666666;
	background-color: #ffffff;
}

.tableposition{
margin-left: auto;
margin-right: auto;
margin-top:20px;

}


 </style>
<jsp:include page="/auth/header.jsp" />
</head>
<body>
    <div class="hi">welcome login the supmessaging <c:out value="${sessionScope.username}"/></div>
	<table  class="gridtable tableposition">
		<tr>
			<th class="test">username</th>
			<th class="test">firstname</th>
			<th class="test">lastname</th>
			<c:if test="${not empty sessionScope.username}">
				<th class="test">Add in your contact list</th>
			</c:if>
		</tr>
		<c:choose>
			<c:when test="${empty requestScope.user}">
				<h1 style="color:#FF0000; ">There is no contact yet !</h1>
			</c:when>
			<c:otherwise>
				<c:forEach items="${requestScope.user}" var="user">
					<tr>
						<td class="test"><c:out value="${user.username}" /></td>
						<td  class="test"><c:out value="${user.firstname}" /></td>
						<td  class="test"><c:out value="${user.lastname}" /></td>
						<c:if test="${not empty sessionScope.username}">
							<td  class="test">
							<a href="${pageContext.request.contextPath}/auth/addcontact?rname=${user.username}">Add in your contact</a>
							</td>
						</c:if>

					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>

	</table>

</body>
</html>