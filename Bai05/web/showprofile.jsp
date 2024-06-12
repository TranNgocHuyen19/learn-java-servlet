<%-- 
    Document   : showprofile
    Created on : Jun 12, 2024, 9:04:20 PM
    Author     : Trần Ngọc Huyền
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <c:set var="a" value="${sessionScope.account}"/>
        <h1>Username: ${a.username}</h1>
        <h1>Role: ${a.role}</h1>
    </body>
</html>
