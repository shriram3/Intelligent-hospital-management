<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Appointment Successful</title>
        <style>
            body{
	background-image:url("warn.jpg");}
        </style>
        <link rel="icon" href="download.png">
    </head>
    <% String adno=(String)request.getAttribute("adno"); %>
    <% String dno =(String)request.getAttribute("dno"); %>    
    <% System.out.println(adno);%>
    <body>
        <font color="green"><h1>Appointment Successfully Made..!!</h1></font>
        <font><h2><b><%= adno %></b>,you can consult the doctor <b><%= dno %>..!!</b></h2></font>
        <h3><a href="index.html">Home</a>
            <a href="patientzone.jsp">My Account</a><h3>
    </body>
</html>
