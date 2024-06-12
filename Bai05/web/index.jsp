<%-- 
    Document   : testresgister
    Created on : Jun 12, 2024, 4:50:51 PM
    Author     : Trần Ngọc Huyền
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            #wrapper{
                margin: auto;
                margin-left: 10%;
                margin-right: 10%;
            }
            ul.menu{
                display: inline-block;
            }
            ul.menu li{
                margin: 10px 16px;
                float: left;
                list-style: none;
                width: 80px;
                height: 30px;
                background: chocolate;
            }
            ul.menu li a{
                text-decoration: none;
                color: white;
            }
        </style>
    </head>
    <body>
        <div id="wrapper">
            <ul class="menu">
                <c:if test="${(sessionScope.account==null)}">
                    <li><a href="login">Login</a></li>
                    <li><a href="register">Register</a></li>
                </c:if>
                <c:if test="${(sessionScope.account!=null)}">
                    <li><a href="logout">Logout</a></li>
                    <li><a href="showprofile">Profile</a></li>
                </c:if>
                </li>
            </ul>
            <h1>Home page</h1>
            <h3>Hello ${sessionScope.account.username}</h3>
        </div>
    </body>
</html>
