<%-- 
    Document   : welcome
    Created on : Jun 12, 2024, 3:27:29 PM
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
        <h2>Đây là trang người dùng</h2>
        <c:set var="a" value="${sessionScope.account}"/>
        <h1>Hello ${a.username}
        <br/>role: ${a.role}
        </h1>
    </body>
</html>
