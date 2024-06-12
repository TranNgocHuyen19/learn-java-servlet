<%-- 
    Document   : update
    Created on : Jun 10, 2024, 3:52:40 PM
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
        <h1>Update a category</h1>
        <c:set var="c" value="${requestScope.category}"/>
        <form action="update" method="post">
            Enter ID: <input type="number" readonly name="id" value="${c.id}"><br/>
            Enter Name <input type="text" name="name" value="${c.name}"><br/>
            Enter Describe <input type="text" name="describe" value="${c.describe}"><br/>
            <input type="submit" value="UPDATE"><br/>
        </form>
    </body>
</html>
