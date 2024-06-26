<%-- 
    Document   : list
    Created on : Jun 26, 2024, 3:38:43 PM
    Author     : Trần Ngọc Huyền
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <style>
        table {
            border-collapse: collapse;
        }
        /* Content */
        .content {
            margin: auto;
            width: 80%;
            float: left;
            margin-left: 30px;
            height: auto;
        }
        /* End Content */
        
        /* Pagination */
        .pagination {
            display: inline-block;
        }
        
        .pagination a {
            color: black;
            font-size: 22px;
            float: left;
            padding: 8px 16px;
            text-decoration: none;
        }
        
        .pagination a.active {
            background-color: #4CAF50;
            color: white;
        }
        
        .pagination a:hover:not(.active) {
            background-color: chocolate;
        }
        /* End Pagination */
        
        /* Search box */
        .topnav {
            overflow: hidden;
            background: #e9e9e9;
        }
        
        .topnav input[type=text] {
            margin-left: 100px;
            font-size: 20px;
        }
        /* End Search box */
        
    </style>
    <body>
        <div class="topnav">
            <form action="">
                <input type="text"  placeholder="Search..." name="key">
                <button onclick="this.form.submit()">
                    <img src="images/search_icon.png" alt="alt" width="20px" height="20px"/>
                </button>
            </form>
        </div>
        <c:set var="k" value="${requestScope.key}" />
        <div class="content">
            <h1>List of products</h1>
            <div class="pagination">
                <c:forEach begin="${1}" end="${requestScope.num}" var="i">
                    <a class="${i == page ? "active" : ""}" href="search?page=${i}&key=${key}">${i}</a>
                </c:forEach>
            </div>
            <table border="1px">
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Image</th>
                    <th>Quantity</th>
                    <th>Release Date</th>
                    <th>Description</th>
                    <th>Category name</th>
                </tr>
                <c:forEach items="${requestScope.data}" var="p">
                    <tr>
                        <td>${p.id}</td>
                        <td>${p.name}</td>
                        <td>
                            <img src="${p.image}" width="80px" height="80px">
                        </td>
                        <td>${p.quantity}</td>
                        <td>${p.releaseDate}</td>
                        <td>${p.describe}</td>
                        <td>${p.category.name}</td>
                    </tr>
                </c:forEach>
            </table>
            <c:set var="page" value="${requestScope.page}"/>
            
        </div>
    </body>
</html>
