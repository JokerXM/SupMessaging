<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>send message</title>
<style type="text/css">
body {background-color:#FFFFFF;
 }
div.inputbox{
position:absolute;
left:100px;
top:150px
}

table{
position:absolute;
left:100px;
top:400px
}
th.test {padding: 1.5px}
td.test{padding: 0.5px 2.5px}

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

.subbutton{
 display: inline-block;
    position: relative;
    margin: 10px;
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



}
 </style>
</head>
<jsp:include page="/auth/header.jsp" />
<body  background="http://localhost:8080/SupMessaging/image/background.jpg">

<div class="table">

<table  class = "gridtable" >
	
		   	<tr>
		<%! String table; %>
		<%
		if (request.getAttribute("content")!=null)
		{
			
			table=" <th class='test'>time</th><th class='test'>sender</th><th class='test'>reciever</th><th class='test'>Content</th>" ;
			
		}
		else 
			{
			table=" <th class='test'> There is no chat record! </th>";
			}
		
		out.print(table);
		    
		%></tr>
		
   		  	<c:forEach items="${requestScope.content}" var="content">
					<tr>
					    <td  class="test"><c:out value="${content.time}" /></td>
						<td  class="test"><c:out value="${content.sender}" /></td>
						<td  class="test"><c:out value="${content.recipient}" /></td>
						<td  class="test"><c:out value="${content.content}" /></td>
						

					</tr>
				</c:forEach>
		

	</table>

</div>

<div class="inputbox">
<form name="input" action="addmessage" method="post">
		<textarea rows="10" cols="50"  id="message"  placeholder ="Message"  name="message"></textarea><br/>
		<p><input type="submit" value="SEND MESSAGE" class="subbutton" ></p>
</form>	            
</div>

</body>

