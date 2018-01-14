
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <title>EMPLOYEE LOGIN</title>
    </head>
    <body background="images/cms.jpg">
        <center>
        <div id="menu" style="background-color:white;height:620px;width:900px;float:middle;border:2 ">    
        <h1>CANTEEN MANAGEMENT SYSTEM</h1>
        <hr>
        <table bgcolor="yellow">
            <th>&emsp;<a href="emp_index.jsp">HOME</a>&emsp;|</th>
            <th>&emsp;<a href="emp_menu.jsp">MENU</a>&emsp;|</th>
            <th>&emsp;<a href="emp_order.jsp">PLACE ORDER</a>&emsp;|</th>
            <th>&emsp;<a href="emp_balance.jsp">CHECK BALANCE LEFT</a>&emsp;|</th>
            <th>&emsp;<a href="emp_changePass.html">CHANGE PASSWORD</a>&emsp;|</th>
            <th>&emsp;<a href="emp_logout">LOG OUT</a>&emsp;</th>
        </table>    
        <hr>
        
        <h1>Balance Left : ${key.bal}
        </h1>
        
        </div>
        </center>
    </body>
</html>
