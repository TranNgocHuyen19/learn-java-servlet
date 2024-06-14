<%-- 
    Document   : login
    Created on : Jun 12, 2024, 3:14:59 PM
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
    <style>
        label {
            display: inline-block;
            width: 170px;
        }
        form {
            width: 500px;
            font-size: 20px;
        }
        .form-group {
            margin-bottom: 10px;
        }
        input[type='submit'] {
            background: #F90;
            padding: 5px 10px;
            border-radius: 5px;
        }
        a {
            text-decoration: none;
        }
    </style>
    <body>
        <h1 >Login form</h1>
        <h3 style="color: red">${requestScope.error}</h3>
        <c:set var="cookie" value="${pageContext.request.cookies}" />
        <form action="login" method="post">
            <div class="form-group">
                <label for="user">Username: </label>
                <input type="text" name="user" id="user" class="form-control"
                       value="${cookie.cuser.value}">
            </div>
            <div class="form-group">
                <label for="pass">Password: </label>
                <input type="password" name="pass" id="pass" class="form-control"
                       value="${cookie.cpass.value}">
            </div>
            <div class="form-group">
                <input type="checkbox" name="rem" id="rem" value="ON" class="form-control"
                       ${(cookie.crem != null ? 'checked' : '')}>
                <label for="rem">Remember me </label>
            </div>
            <div class="form-group" style="text-align: center">
                <input type="submit" value="Login">
            </div>
        </form>
        
    </body>
</html>
