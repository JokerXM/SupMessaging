
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.util.List"%>
<%@ page import="com.supinfo.supmessaging.entity.message"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>index page</title>
<style type="text/css">
body {background-color:#FFFFFF;
 }

div.session{
text-align:center;
border:2px solid #a1a1a1;
padding:10px 40px; 
background:#FFFFFF;
width:300px;
border-radius:25px;
position:absolute;
left:100px;
top:70px
}
div.hi
{
text-align:center;
border:2px solid #a1a1a1;
padding:10px 40px; 
background:#FFFFFF;
width:180px;
border-radius:25px;
position:absolute;
left:725px;
top:70px;
}
div.no
{
text-align:center;
border:2px solid #a1a1a1;
padding:10px 40px; 
background:#FFFFFF;
width:350px;
border-radius:25px;
position:absolute;
left:725px;
top:118px;
}

table.record{
position:absolute;
left:100px;
top:128px;
width:350px;

}
table.friends{
position:absolute;
left:725px;
top:141px;

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
 </style>
</head>
<jsp:include page="/auth/header.jsp" />
<body  background="http://localhost:8080/SupMessaging/image/background.jpg">
<div class="session"><c:out value="${sessionScope.loginmessage}"/></div>
<br />



   <div class="hi"> Hi:<c:out value="${sessionScope.username}"/> Here is your friend:</div>
   <div class="friends">
<table  class="friends gridtable" >
		<tr>
			<th class="test">myname</th>
			<th class="test">friendname</th>
			<c:if test="${not empty sessionScope.contact}">
				<th class="test">Send message</th>
			</c:if>
		</tr>
		<c:choose>
			<c:when test="${empty sessionScope.contact}">
				<div class="no"></div></div>
			</c:when>
			<c:otherwise>
				<c:forEach items="${sessionScope.contact}" var="contact">
					<tr>
						<td class="test"><c:out value="${contact.myname}" /></td>
						<td class="test"><c:out value="${contact.friendname}" /></td>
						<c:if test="${not empty sessionScope.contact}">
							<td class="test">
							<a href="${pageContext.request.contextPath}/auth/addmessage?rname=${contact.friendname}">Send Message</a>
							</td>
						</c:if>

					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>

	</table>
	</div>
	
<div  class="record">

<table class="gridtable record">

		<%! String table; %>
		<%
		if (session.getAttribute("message")!=null)
		{
			
			table=" <th class='test'>if you read </th><th class='test'>time</th><th class='test'>sender</th><th class='test'>reciever</th><th class='test'>Content</th><th class='test'> View details</th>";
			
		}
		else 
			{
			table=" <th class='test' There is no chat record! </th>";
			}
		
		out.print(table);
		    
		%>
		<br />
		<%
		
		List message1 = (List<message>)session.getAttribute("message");
		for(int    i=0;    i<message1.size();    i++) 
		{
			message m=(message)message1.get(i);
            out.print("<tr><td >"+m.getIfread()+"</td><td >"+m.getTime()+"</td><td >"+m.getSender()+"</td><td >"+m.getRecipient()+"</td><td >"+m.getContent()+"</td>");
            if(m.getSender().equals(session.getAttribute("username")) )
            	
            {
            	out.print("<td ><a href='/SupMessaging/auth/addmessage?rname="+m.getRecipient()+"'> details</a></td></tr>");
            	
            	
            }
            else{
            
            	out.print("<td ><a href='/SupMessaging/auth/addmessage?rname="+m.getSender()+"'> details</a></td></tr>");
            }
            
		} 
		
		
		
		%>
		   
		
 
		

	</table>

</div>



</body>
</html>