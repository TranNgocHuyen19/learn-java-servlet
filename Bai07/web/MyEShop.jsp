<%-- 
    Document   : MyShop
    Created on : Jun 13, 2024, 4:10:41 PM
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
        #bag {
            text-align: right;
            margin-right: 30px;
            margin-top: 30px;
        }
        table {
            border-collapse: collapse;
            width: 100%;
        }
        th, td{
            padding: 5px 10px;
        }
        th{
            text-align: center;
        }

        body {
            width: 700px;
        }
    </style>

    <body>
        <c:set var="size" value="${sessionScope.size}"/>
        <h1>Hello ${sessionScope.account.name}</h1>
        <p id="bag">
            <img src="images/cart.jpg" alt="alt" width="50px" height="50px"/>
            <a href="MyECart.jsp">My bag ${size} item(s)</a>
        </p>
        <h1>The list of products</h1>
        <form name="f" action="" method="post">
            <div class="form-group">
                <label for="num">Enter the number of items to by: </label>
                <input type="text" name="num" id="num" value="1">
                <hr/>
            </div>

        </form>

        <table border="1px">
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Quantity</th>
                <th>Action</th>
            </tr>
            <jsp:useBean id="db" class="dal.ProductDAO"/>
            <c:forEach items="${db.all}" var="p">
                <tr>
                    <td>${p.id}</td>
                    <td>${p.name}</td>
                    <td>${p.quantity}</td>
                    <td>
                        <input type="submit" value="Buy item" onclick="buy('${p.id}')">
                    </td>
                </tr>
            </c:forEach>
        </table>
    </body>
</html>
<script type="text/javascript">
    function buy(id) {
        document.f.action = "buy?id=" + id;
        document.f.submit();
    }
</script>