<%-- 
    Document   : home
    Created on : Jun 4, 2024, 10:19:37 PM
    Author     : Trần Ngọc Huyền
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/style.css"/>
    </head>
    <body>
        <div id="menu_tab">
            <%@include file="menu.jsp" %>
        </div>
        <div class="clr"></div>
        <div>
            <%@include file="index.jsp" %>
        </div>
        <div class="clr"></div>
        <div class="footer">
            <%@include file="footer.jsp" %>
        </div>
    </body>
</html>
