<%-- 
    Document   : calusejavabean
    Created on : Jun 5, 2024, 4:29:17 PM
    Author     : Trần Ngọc Huyền
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            * {
                margin: auto;
            }
            
            .container {
                width: 100%;
                max-width: 300px;
                margin: 0 auto;
                background: #ddd;
                padding: 10px 40px;
            }
            
            h1 {
                padding-bottom: 10px;
            }
            
            form {
                padding-top: 10px;
                border-top: 1px solid #000;
                border-bottom: 1px solid #000;
            }
            
            input, select {
                margin-bottom: 15px;
            }

        </style>
    </head>
    <body>
        <div class="container">
            <h1>A Simple Calculator</h1>
            <form>
                Enter Operand1: <input type="text" name="num1"><br/>
                Enter Operand2: <input type="text" name="num2"><br/>
                Select Operation: 
                <select name="op">
                    <option value="+">+</option>
                    <option value="-">-</option>
                    <option value="*">*</option>
                    <option value="/">/</option>
                </select><br/>
                <input type="submit" value="Calculate">
            </form>
            <h2>
                <jsp:useBean id="c" class="model.Math"/>
                <jsp:setProperty name="c" property="*" />
                <jsp:getProperty name="c" property="num1" />
                <jsp:getProperty name="c" property="op" />
                <jsp:getProperty name="c" property="num2" />
                &nbsp;&nbsp;&nbsp;&nbsp;=>&nbsp;&nbsp;
                <jsp:getProperty name="c" property="result" />
            </h2>
        </div>
    </body>
</html>
