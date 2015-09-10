<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>welcome to SupMessaging</title>
<style type="text/css">

#center{ 
MARGIN-RIGHT: auto;
MARGIN-LEFT: auto;
height:200px;
width:450px;
vertical-align:middle;
line-height:20px;
}
div.around
{

border:2px solid #a1a1a1;
padding:10px 40px; 
background:#FFFFFF;
width:500px;
height:301px;
border-radius:25px;
margin-left: auto;
margin-right: auto;



}



 </style>
</head>
<jsp:include page="/auth/link.jsp" />
<body  background="http://localhost:8080/SupMessaging/image/background.jpg">

<div class="around" >

<div id="center" style=" text-align:center;">
<h2>
Welcome to the SupMessage world !
</h2>
<p >
SupMessaging is a powerful and scalable message service .<br/> 
Its main ussage is to send text messages by Supinfo to students.<br/>
Hope you have a good time using it ~
</p>
<p>A anonymous	visitor	can register and contact admin.	<br/>
For	authenticated users	send a new	message to	search a contact.
</p>
</div>

<div class="user"  style="position: relative; left:72px; top:0px; float:left; " >
<img src="http://localhost:8080/SupMessaging/image/user.jpg" width="40px"; height="40px"; >
<c:out value="${requestScope.usernumber}"/> users already.<br /></div>

<div class="message"style="position: relative; left:172px; top:0px; float:left;">
<img src="http://localhost:8080/SupMessaging/image/message.jpg" width="40px"; height="40px";>
<c:out value="${requestScope.messagenumber}"/> messages already.<br /></div>
</div>

</body>
</html>