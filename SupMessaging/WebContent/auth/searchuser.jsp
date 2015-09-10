<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>search user</title>

<style type="text/css">
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
    
    margin-left: auto;
    margin-right: auto;
    margin-top:10px;



}

p.hint{
color:#003366;
font-family:"Times New Roman";
font-weight:bold;
font-size:27px;
}

.inputbox{

margin-left: auto;
margin-right: auto;
background-color:#FFFFFF;
width:210px;
height:45px;
border-radius:10px;
}

.all{
height:165px;
width:400px;
vertical-align:middle;
line-height:20px;
border:2px solid #a1a1a1;
padding:10px 40px; 
background:#FFFFFF;
border-radius:25px;
margin-left: auto;
margin-right: auto;
margin-top:200px;
}
</style>

</head>
<jsp:include page="/auth/head1.jsp" />
<jsp:include page="/auth/header.jsp" />
<body background="http://localhost:8080/SupMessaging/image/background.jpg">
<div class="all">
<form name="input" method="get" action="/SupMessaging/auth/SearchUser">
    <table>
		<tr><td ><p class="hint">User name:</p></td><td><input class="inputbox" type="text" name="searchname"> </td></tr>
	</table>	
		
		
		<input class="subbutton" type="submit" value="search this user">
</form>
</div>
	

</body>
</html>