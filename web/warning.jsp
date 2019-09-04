<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Invalid Credentials</title>
        <style>
            body{
	background-image:url("warn.jpg");}
        </style>
        <link rel="icon" href="download.png">
    </head>
    <% String user=(String)request.getAttribute("adno"); %>
    <body>
        <font color="yellow"><h1>WARNING..!!</h1></font>
        <font color="white"><h2>Please Check Your Credentials  <b><%= user%></b>..!!</h2></font>
        <h3><a href="index.html">Home</a>
            <a href="doctorform.html">Re-Try</a><h3>
    </body>
</html>
