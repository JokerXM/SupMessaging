<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Change profile</title>
<style type="text/css">
body {
background-color:#FFFFFF;
 }

.inputbox{

background-color:#FFFFFF;
width:280px;
height:35px;
border-radius:10px;
}

.subbutton{
 display: inline-block;
    padding: 0 20px;
    text-align: center;
    text-decoration: none;
    font: bold 12px/25px Arial, sans-serif;
    text-shadow: 1px 1px 1px rgba(255,255,255, .22); 
    -webkit-border-radius: 30px;
    -moz-border-radius: 30px;
    border-radius: 30px;
 
    -webkit-box-shadow: 1px 1px 1px rgba(0,0,0, .29), inset 1px 1px 1px rgba(255,255,255, .44);
    -moz-box-shadow: 1px 1px 1px rgba(0,0,0, .29), inset 1px 1px 1px rgba(255,255,255, .44);
    box-shadow: 1px 1px 1px rgba(0,0,0, .29), inset 1px 1px 1px rgba(255,255,255, .44);


    -webkit-transition: all 0.15s ease;
    -moz-transition: all 0.15s ease;
    -o-transition: all 0.15s ease;
 -ms-transition: all 0.15s ease;
    transition: all 0.15s ease;

	 padding: 0 40px;
    padding-top: 10px;
    height: 45px;
    text-transform: uppercase;
    font: bold 20px/22px Arial, sans-serif;
 display: block;
    text-transform: none;
    font: italic normal 12px/18px Georgia, sans-serif;
    text-shadow: 1px 1px 1px rgba(255,255,255, .12);

	
	 color: #515151;
 
    background: #d3d3d3; /* Old browsers */
    background: -moz-linear-gradient(top,  #d3d3d3 0%, #8a8a8a 100%); /* FF3.6+ */
    background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,#d3d3d3), color-stop(100%,#8a8a8a)); /* Chrome,Safari4+ */
    background: -webkit-linear-gradient(top,  #d3d3d3 0%,#8a8a8a 100%); /* Chrome10+,Safari5.1+ */
    background: -o-linear-gradient(top,  #d3d3d3 0%,#8a8a8a 100%); /* Opera 11.10+ */
    background: -ms-linear-gradient(top,  #d3d3d3 0%,#8a8a8a 100%); /* IE10+ */
    background: linear-gradient(top,  #d3d3d3 0%,#8a8a8a 100%); /* W3C */
    
    margin-left: auto;
    margin-right: auto;
    margin-top:20px;



}

.all{
	
	margin-left: auto;
    margin-right: auto;
    margin-top:80px;
    height:310px;
	width:423px;
	vertical-align:middle;
	line-height:20px;
	border:2px solid #a1a1a1;
	padding:10px 40px; 
	background:#FFFFFF;
	border-radius:25px;
    
}
.table{
	margin-left: auto;
    margin-right: auto;
    margin-top:10px;
}
 </style>
</head>

<jsp:include page="/auth/head1.jsp" />
<jsp:include page="/auth/header.jsp" />
<body  background="http://localhost:8080/SupMessaging/image/background.jpg">

<div class="all">
<form action="${pageContext.request.contextPath}/auth/changeprofile" method="post">
<div class="table">
<table>
				<c:forEach items="${requestScope.userinformation}" var="user">
					
						<tr><td class="test">username:</td><td class="test"><c:out value="${user.username}" /></td></tr>
						<tr><td class="test">firstname:</td><td class="test"><input type="text" name="firstname" value="${user.firstname}" class="inputbox">  </td></tr>
						<tr><td class="test">lastname:</td><td class="test"><input type="text" name="lastname"  value="${user.lastname}" class="inputbox">  </td></tr>
						<tr><td class="test">E-mail:</td><td class="test"> <input type="text" name="email" value="${user.email}"  class="inputbox"> </td></tr>
						<tr><td class="test">password:</td><td class="test"><input type="password" name="password" value="${user.password}" class="inputbox">  </td></tr>
			    	   

					
				</c:forEach>
</table>
</div>
<div class="subbuttondiv">
 <input type="submit" value="Change your profile" class="subbutton">
 </div>
</form>
</div>


</body>
</html>