<%-- 
    Document   : index
    Created on : Jun 4, 2024, 10:11:57 PM
    Author     : Trần Ngọc Huyền
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
<!--        <div id="menu_tab">
            <%@include file="menu.jsp"%>
        </div>
        <div class="clr"></div>-->
        <div class="login">
            <h1>Hình chữ nhật</h1>
            <form action="tinh" method="post">
                chieu dai:<input type="text" name="dai"/><br/>
                chieu rong: <input type="text" name="rong"/><br/>
                <input type="checkbox" name="d" value="0"/>Chu vi
                <input type="checkbox" name="d" value="1"/>Dien tich
                <br/>
                <input type="submit" value="Tinh toan"/>
            </form>
        </div>
<!--        <div class="clr"></div>
        <div class="footer">
            <%@include file="footer.jsp" %>%>
        </div>-->
    </body>
</html>
