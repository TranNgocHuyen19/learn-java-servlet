<%-- 
    Document   : ex03convertvndtousdandyen
    Created on : Jun 7, 2024, 3:57:17 PM
    Author     : Trần Ngọc Huyền
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script type="text/javascript">
            function choice(change) {
                document.getElementById("d").value = change;
                document.getElementById("form").submit();
            }
        </script>
    </head>
    <body>
        <div>Đổi tiền VNĐ sang USD, YEN</div>
        <h3 style="color:red">${requestScope.error}</h3>
        <form id="form" action="ex03" method="post">
            Enter money (VND): <input type="text" name="money"><br/>
            <!--<input type="radio" name="convert" value="0" checked>USD
            <input type="radio" name="convert" value="1">YEN-->
            <!--<input type="checkbox" name="convert" value="0">USD
            <input type="checkbox" name="convert" value="1">YEN-->
            <input type="hidden" id="d" name="convert" value="">
            <input type="button" onclick="choice('0')" value="USD">
            <input type="button" onclick="choice('1')" value="YEN">
            <br/> 
            <!--<input type="submit" name="Convert">-->
        </form>
        <h2 style="color: green">${requestScope.result}</h2>
    </body>
</html>