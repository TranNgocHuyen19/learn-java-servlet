<%-- 
    Document   : home
    Created on : Jun 11, 2024, 9:45:53 PM
    Author     : Trần Ngọc Huyền
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Đây là request: ${requestScope.name}</h1>
        <h1>Đây là session: ${sessionScope.xd}</h1>
    </body>
</html>
