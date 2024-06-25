<%-- 
    Document   : menu
    Created on : Jun 25, 2024, 5:38:21 PM
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
        <a href="userTask">User Task</a> ||
        <a href="sellerTask">Seller Task</a> ||
        <c:if test="${sessionScope.account != null}"> ||
            <a href="info">User info</a> ||
        </c:if>
        <a href="logout">Logout</a> &nbsp;&nbsp;&nbsp; 
        <span style="color: red">[${sessionScope.account.username}]</span>
        <c:if test="${sessionScope.account == null}">
            || <a href="login">Login</a>
        </c:if>
    </body>
</html>
