<%-- 
    Document   : list
    Created on : Jun 10, 2024, 2:23:01 PM
    Author     : Trần Ngọc Huyền
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script>
            function doDelete(id) {
                if(confirm("Are you sure to delete category with id = " + id)){
                    window.location = "deletecat?id=" + id;
                }
            }
        </script>
    </head>
    <body>
        <h1>List of categories</h1>
        <h3><a href="add.jsp">Add new Category</a></h3>
        <table border="1px" width="40%">
            <tr>
                <th>ID</td>
                <th>NAME</td>
                <th>DESCRIBE</td>
                <th>ACTION</td>
            </tr>
            <c:forEach items="${requestScope.data}" var="c">
                <c:set var="id" value="${c.id}"/>
                <tr>
                    <td>${id}</td>
                    <td>${c.name}</td>
                    <td>${c.describe}</td>
                    <td>
                        <a href="updatecat?id=${id}">Update</a>&nbsp;&nbsp;&nbsp;&nbsp;
                        <a href="#" onclick="doDelete('${id}')">Delete</a>
                    </td>
                </tr>
            </c:forEach>
                
        </table>
    </body>
</html>
