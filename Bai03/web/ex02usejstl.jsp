<%-- 
    Document   : ex0usejstl
    Created on : Jun 7, 2024, 2:45:31 PM
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
        <h1>Ví dụ cho JSTL</h1>
        <c:set var="s" value="${requestScope.student}"/>
        <h2>Hello ${s.name}</h2>
        <img src="${(s.gender ? 'images/male.png' : 'images/female.png')}" alt="alt"/>
        <c:if test="${(s.mark >= 5)}">
            <h3>Pass</h3>
        </c:if>
        <c:if test="${(s.mark < 5)}">
            <h3>Fail</h3>
        </c:if>
        <h1>Danh sác sinh viên</h1>
        <table border="1px" style="width: 40%">
            <tr>
                <th>ID</th>
                <th>NAME</th>
                <th>GENDER</th>
                <th>MARK</th>
                <th>RANK</th>
            </tr>
            <c:forEach items="${requestScope.data}" var="i">
                <tr>
                    <td>${i.id}</td>
                    <td>${i.name}</td>
                    <td>
                        <img src="${(i.gender ? 'images/male.png' : 'images/male.png')} " alt="alt"/>
                    </td>
                    <td>${i.mark}</td>
                    <td>
                        <h3>
                            <c:choose>
                                <c:when test="${i.mark < 5}">
                                    weak
                                </c:when>
                                 <c:when test="${i.mark >= 5 && i.mark < 8}">
                                    average
                                </c:when>  
                                    <c:when test="${i.mark >= 5}">
                                    excellent
                                </c:when>
                            </c:choose>
                        </h3>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </body>
</html>
