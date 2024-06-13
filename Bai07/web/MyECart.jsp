<%-- 
    Document   : MyECart
    Created on : Jun 13, 2024, 5:42:58 PM
    Author     : Trần Ngọc Huyền
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <style>
        a {
            text-decoration: none;
        }
        table {
            border-collapse: collapse;
            width: 100%;
            margin-bottom: 20px;
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
    <script>
    </script>
    <body>
        <h1>Shopping cart online</h1>
        <table border="1px">
            <tr>
                <th>No</th>
                <th>Name</th>
                <th>Quantity</th>
                <th>Price</th>
                <th>Money</th>
                <th>Action</th>
            </tr>
            <c:set var="o" value="${sessionScope.cart}"/>
            <c:set var="t" value="0"/>
            <c:forEach items="${o.items}" var="i">
                <c:set var="t" value="${t + 1}" />
                <tr>
                    <td>${t}</td>
                    <td>${i.product.name}</td>
                    <td>
                        <button><a href="process?num=-1&id=${i.product.id}">-</a></button>
                        <input type="text" readonly value="${i.quantity}">
                        <button><a href="process?num=1&id=${i.product.id}">+</a></button>
                    </td>
                    <td><fmt:formatNumber pattern="##.#" value="${i.product.id}"/></td>
                    <td><fmt:formatNumber pattern="##.#" value="${i.quantity * i.price}"/></td>
                    <td>
                        <form action="process" method="post">
                            <input type="hidden" name="id" value="${i.product.id}"/>
                            <input type="submit" value="Return item"/>
                        </form>
                    </td>
                </tr>
            </c:forEach>
        </table>
        <form action="checkout" method="post">
            <input type="submit" value="Check out">
        </form>
        <hr/>
        <h2 style="color: chocolate"><a href="MyEShop.jsp">Click here to continue shopping</a></h2>
    </body>
</html>
