<%-- 
    Document   : loginusebean
    Created on : Jun 5, 2024, 4:07:37 PM
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
        <%
            String u_init = getServletContext().getInitParameter("user");
            String p_init = getServletContext().getInitParameter("pass");
            if(request.getParameter("user") != null && request.getParameter("pass") != null) {
                String u = request.getParameter("user");
                String p = request.getParameter("pass")
                if(u.equalsIgnoreCase(u_init) && p.equals(p_init)) {
                    //nhap dung
        %>
        <jsp:forward page="welcomeusejsptag.jsp">
            <jsp:param name="name" value="<%= u%>"/>
        </jsp:forward>

        <%
                } else {
                //nguoi dung nhap sai
                    String er = "Ban nhao sai";
        %>
        <h1 style="color: red"><%= er %></h1>
        <%
                        }
                    }
        %>
        <form>
            enter username: <input type="text" name="user"> <br/>
            enter password <input type="password" name="pass"> <br/>
            <input type="submit" value="LOGIN"> <br/>
        </form>
    </body>
</html>
