<%-- 
    Document   : listproduct
    Created on : Jun 11, 2024, 11:22:06 AM
    Author     : Trần Ngọc Huyền
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            #menu_tab {
                background-color: #250A00 ;
            }

            ul.menu {
                list-style-type: none;
                display: block;
                list-style-type: none;
                font-weight: bold;
                width: 1200px;
                height: 30px;
                padding: 12px;
            }

            ul.menu li {
                display: inline;
                font-size: 18px;
                padding-top: 15px;
                text-align: center;
                line-height: 30px;
                color: #E2D9BC;
            }

            ul.menu li a {
                margin: 10px;
                padding-left: 0px;
                text-decoration: none;
                text-align: center;
                color: #E2D9BC;
                position: relative;
            }

            ul.menu li a:hover {
                color: #F90;
            }

            ul.menu li a:active {
                color: #FF0;
            }

            ul.menu li a:focus {
                color: #96F;
            }
            table {
                width: 1200px;
                border-collapse: collapse;
                text-align: center;
                
            }
            
            table th {
                font-size: 20px;
            }
            
            table td {
                font-size: 18px;
            }
        </style>
    </head>
    <body>
        <div id="wrapper">
            <div id="menu_tab">
                <ul class="menu">
                    <li><a href="products?cid=${0}">ALL</a></li>
                    <c:forEach items="${requestScope.data}" var ="c">
                        <li><a href="products?cid=${c.id}">${c.name}</a></li>
                        </c:forEach>
                </ul>
            </div>
            <div id="content">
                <c:set var="list" value="${requestScope.products}" />
                <c:if test="${((list == null) || (list.size() == 0))}">
                    <h3>No Products</h3>
                </c:if>
                <c:if test="${((list != null) && (list.size() != 0))}">
                    <table border="1px">
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Price</th>
                        <th>Image</th>
                        <th>Category Name</th>
                    </tr>
                    <c:forEach items="${requestScope.products}" var = "p">
                        <tr>
                            <td>${p.id}</td>
                            <td>${p.name}</td>
                            <td>${p.price}</td>
                            <td><img src="${p.image}" alt="alt" width="80px" height="80px"/></td>
                            <td>${p.category.name}</td>
                        </tr>
                    </c:forEach>
                </table>
                </c:if>
            </div>
        </div>
    </body>
</html>
