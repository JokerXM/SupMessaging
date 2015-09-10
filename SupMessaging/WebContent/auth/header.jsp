<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<% boolean isConnected = false;
	if(request.getSession().getAttribute("username")!= null)
		isConnected = true;
%>

        <a href="${pageContext.request.contextPath}/auth/searchuser.jsp"style="position:absolute; right:290px; top:0px; "> search contact</a>
		<a href="${pageContext.request.contextPath}/auth/listfriend.jsp"style="position:absolute; right:250px; top:0px; ">chat</a>
		<a href="${pageContext.request.contextPath}/auth/addmessage?rname=admin"style="position:absolute; right:150px; top:0px; ">contact admin</a>
		<a href="${pageContext.request.contextPath}/auth/changeprofile"style="position:absolute; right:50px; top:0px; ">change profile</a>
		<a href="${pageContext.request.contextPath}/logout"style="position:absolute; right:0px; top:0px; ">Logout</a>
        

<br />
<jsp:include page="/auth/head1.jsp" />