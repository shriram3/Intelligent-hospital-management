<%-- 
    Document   : admission.jsp
    Created on : 21 Aug, 2019, 1:28:06 PM
    Author     : SHRIRAM I
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%!
        String a="";
        %>
        <%
            a=(String)request.getAttribute("admitno");
        %>
        <h1><%= a %></h1>
    </body>
</html>
