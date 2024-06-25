<%-- 
    Document   : home
    Created on : Jun 25, 2024, 3:22:23 PM
    Author     : Trần Ngọc Huyền
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home Page</title>
    </head>
    <body>
        <h1>Home page</h1>
        <h3>
            <a href="add.jsp">Link to file add.jsp</a>
        </h3>
        <h3>A number of people access browser: ${sessionScope.counter}</h3>
    </body>
</html>
