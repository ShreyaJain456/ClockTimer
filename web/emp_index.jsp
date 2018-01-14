<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
                <table>    
                    <tr><td><h3>Employee ID</h3></td><td>    :       </td><td>${key.empID}</td></tr>
                    <tr><td><br><br></td></tr>
                    <tr><td><h3>Name</h3></td><td>           :       </td><td>${key.name}</td></tr>
                    <tr><td><br><br></td></tr>
                    <tr><td><h3>Department</h3></td><td>     :       </td><td>${key.dept}</td></tr>
                    <tr><td><br><br></td></tr>
                    <tr><td><h3>Salary</h3></td><td>         :       </td><td>${key.sal}</td></tr>
                </table>
            
        </div>
        </center>
    </body>
</html>
