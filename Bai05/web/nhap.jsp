<%-- 
    Document   : nhap
    Created on : Jun 11, 2024, 10:03:27 PM
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
        <h1>Nhập danh sách</h1>
        <form action="nhap">
            Nhập họ và tên: <input type="text" name="name">
            <input type="submit" name="Submit">
        </form>
        <h2>Danh sách nhập vào</h2>
        <h3 style="color: chocolate">Hello ${sessionScope.xd}</h3>
        <h3>
            <c:set var="i" value="0"/>
            <c:forEach items="${sessionScope.names}" var="c">
                <c:set var="i" value="${(i + 1)}"/>
                ${i}. ${c} <br/>
            </c:forEach>
        </h3>
    </body>
</html>
