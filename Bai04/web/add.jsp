<%-- 
    Document   : add
    Created on : Jun 10, 2024, 2:32:05 PM
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
        <h1>Add a new category</h1>
        <h3 style="color: red">${requestScope.error}</h3>
        <form action="addcat">
            Enter ID: <input type="number" name="id"><br/>
            Enter Name <input type="text" name="name"><br/>
            Enter Describe <input type="text" name="describe"><br/>
            <input type="submit" value="SAVE"><br/>
        </form>
    </body>
</html>
