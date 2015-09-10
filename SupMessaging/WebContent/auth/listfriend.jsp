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

div
{
text-align:center;
border:2px solid #a1a1a1;
padding:10px 40px; 
background:#FFFFFF;
width:290px;
border-radius:25px;
position: relative;
left:50px;
top:50px
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
position: relative;
left:70px;
top:70px

}


 </style>
<jsp:include page="/auth/header.jsp" />
</head>
<body background="http://localhost:8080/SupMessaging/image/background.jpg">
    <div class="hi">Hi , <c:out value="${sessionScope.username}"/>  ! Here is your friend!</div>
	<table class="gridtable tableposition">
		<tr>
			<th class="test">myname</th>
			<th class="test">friendname</th>
			<c:if test="${not empty sessionScope.contact}">
				<th class="test1">Send message</th>
			</c:if>
		</tr>
		<c:choose>
			<c:when test="${empty sessionScope.contact}">
				<div class="no">There is no friend yet !</div>
			</c:when>
			<c:otherwise>
				<c:forEach items="${sessionScope.contact}" var="contact">
					<tr>
						<td class="test"><c:out value="${contact.myname}" /></td>
						<td class="test"> <c:out value="${contact.friendname}" /></td>
						<c:if test="${not empty sessionScope.contact}">
							<td class="test">
							<a href="${pageContext.request.contextPath}/auth/addmessage?rname=${contact.friendname}">Send Message and details</a>
							</td>
						</c:if>

					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>

	</table>

</body>
</html>