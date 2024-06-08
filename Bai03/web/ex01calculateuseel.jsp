<%-- 
    Document   : ex1calculate
    Created on : Jun 6, 2024, 3:24:18 PM
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
        <h1>Calculating with EL!</h1>
        <form action="ex01" method="post">
            Enter number 1:
            <input type="text" name="num1" value="${param.num1}"/><br/>
            Enter number 2:
            <input type="text" name="num2" value="${param.num2}"/><br/>
            <input type="submit" value="Calculate"/>
        </form>
        <h2>Tổng ${(param.num1 + param.num2)}</h2>
        <h2>Trung bình ${(param.num1 + param.num2) / 2}</h2>
        <h2>Diện tích đường tròn ${(param.num1 * param.num2 * Math.PI)}</h2>
        <h4>Dữ liệu từ server trả về: 
        <br/>
        Hello ${requestScope.name}
        </h4>
        <h2 style="color: red">
            Information: ${requestScope.student}
        </h2>
    </body>
</html>