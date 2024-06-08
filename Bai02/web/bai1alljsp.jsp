<%-- 
    Document   : bai1alljsp
    Created on : Jun 4, 2024, 4:19:59 PM
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
        <h1>Bài 1: Dựng bằng JSP cả FE và BE</h1>
        <form>
            Enter radius: <input type="text" name="r"><br/>
            <input type="submit" value="SUBMIT">
        </form>
        <% 
            if(request.getParameter("r") != null) {
                String r_raw = request.getParameter("r");
                double r;
                try {
                    r = Double.parseDouble(r_raw);
                    double s = r * r * Math.PI;
        %>  
        <h2>Diện tích là: <%= s%></h2>
        <%  
        }catch(Exception e) {
                    System.out.print(e);
                }
            }
        
        %>
        
    </body>
</html>
