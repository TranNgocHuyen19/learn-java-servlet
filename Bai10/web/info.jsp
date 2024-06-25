<%-- 
    Document   : info
    Created on : Jun 25, 2024, 6:00:34 PM
    Author     : Trần Ngọc Huyền
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Profile Page</title>
    </head>
    <body>
        <jsp:include page="menu.jsp" />
        <h1>Profile page</h1>
        <h3>
            Username: ${sessionScope.account.username} <br/>
            <c:if test="${sessionScope.account.role == 1}">
                Welcome to Seller page
            </c:if>
            <c:if test="${sessionScope.account.role == 2}">
                Welcome customer ${sessionScope.account.username} !
            </c:if>
        </h3>
    </body>
</html>
