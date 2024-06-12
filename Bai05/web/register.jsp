<%-- 
    Document   : register
    Created on : Jun 12, 2024, 4:29:37 PM
    Author     : Trần Ngọc Huyền
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <style>
        label {
            display: inline-block;
            width: 200px;
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
    </style>
    <body>
        <h1 >Register form</h1>
        <h3 style="color: red">${requestScope.error}</h3>
        <form action="register" method="post">
            <div class="form-group">
                <label for="user">Username: </label>
                <input type="text" name="user" id="user" class="form-control"
                       placeholder="Enter username">
            </div>
            <div class="form-group">
                <label for="pass">Password: </label>
                <input type="password" name="pass" id="pass" class="form-control"
                       placeholder="Enter password">
            </div>
            <div class="form-group">
                <label for="cpass">Confirm Password: </label>
                <input type="password" name="cpass" id="cpass" class="form-control"
                       placeholder="Enter confirm password">
            </div>
            <div class="form-group">
                <label for="email">Email: </label>
                <input type="email" name="email" id="email" class="form-control"
                       placeholder="Enter email">
            </div>
            <div class="form-group">
                <input type="submit" value="Register">
            </div>
        </form>
    </body>
</html>
