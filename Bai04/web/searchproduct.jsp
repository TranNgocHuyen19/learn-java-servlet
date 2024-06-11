<%-- 
    Document   : searchproduct
    Created on : Jun 11, 2024, 3:00:42 PM
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
        #wrapper {
            margin-left: 10%;
            margin-right: 10%;
            font-family: Arial;
        }
        h3 {
            text-align: left;
            color: blue;
        }
        ul {
            list-style-type: none;
            display: flex;
            flex-wrap: wrap;
        }
        li {
            width: 25%;
            text-align: center;
            margin: 25px;
            border: 2px solid chocolate;
            border-radius: 20px;
        }

        li img {
            width: 90%;
        }
        li a {
            text-decoration: none;
        }
        li:hover {
            background: bisque;
        }
        p {
            margin: 5px;
            color: blue;
            font-size: 12px;
        }
        .old {
            text-decoration: line-through;
            color: red;
        }
        input {
            width: 200px;
        }
        input[type='submit'] {
            width: 200px;
            height: 30px;
            background: #F90;
            border-radius: 1px solid #000;
        }
    </style>
    <body>
        <div id="wrapper">
            <form id="form" action="searchproduct">
                Dòng điện thoại: <select name="key"">
                    <option value="0">ALL</option>
                    <c:forEach items="${listcat}" var="c">
                        <option  value="${c.id}">${c.name}</option>
                    </c:forEach>
                </select><br/>
                <input type="text" name="key2" placeholder="Nhập tên, miêu tả, danh mục sp..."><Br/>
                Từ giá: <input type="number" name="fromprice">
                Đến giá: <input type="number" name="toprice"><br/>
                Từ ngày: <input type="date" name="fromdate">
                Đến ngày: <input type="date" name="todate"><br>
                <input type="submit" value="SEARCH">
            </form>
            <h3>CÁC DÒNG ĐIỆN THOẠI</h3>
            <ul>
                <c:forEach items="${products}" var="p">
                    <li>
                        <a href="#">
                            <img src="${p.image}" alt="alt"/>
                            <p>${p.name}</p>
                            <p>Giá gốc <span class="old">${p.price}</span> VNĐ</p>
                            <p>Giá bán: ${p.price} VNĐ</p>
                        </a>
                    </li>
                </c:forEach>
                
            </ul>
        </div>
    </body>
</html>
