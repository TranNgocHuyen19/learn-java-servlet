<%-- 
    Document   : bai1fejspbeservlet
    Created on : Jun 4, 2024, 4:21:24 PM
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
        <h1>Bài 1: FE: JSP, BE:Servlet</h1>
        <form action="cal" method="post">
            Enter radius: <input type="text" name="r"><br/>
            <input type="submit" value="SUBMIT">
        </form>
        <%
            if(request.getAttribute("dt") != null) {
            //nó gửi về là 1 object phải đổi sang kiểu double
                String s = (String)request.getAttribute("dt");
        %>
        <h2>Diện tích: <%= s%></h2>
        <%
            }
        %>
    </body>
</html>
