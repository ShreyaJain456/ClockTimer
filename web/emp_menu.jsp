<%@page import="javax.naming.InitialContext"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>EMPLOYEE LOGIN</title>
    </head>

<body background="images/cms.jpg">
        <center>
        <div id="menu" style="background-color:white;height:800px;width:900px;float:middle;border:2 ">    
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
            <h3>MENU</h3>
        <table border=5 cellpadding=30 >
            <tr>
                <th>ID</th>
                <th>Item Name</th>
                <th>Prize</th>
            </tr>
            <%
                try
                    {
                        InitialContext ctx=new InitialContext();
                        DataSource ds=(DataSource)ctx.lookup("jdbc/customer");
                        Connection con=ds.getConnection();
                        Statement st=con.createStatement();
                        ResultSet rs=st.executeQuery("select * from item");
                        
                        while(rs.next())
                        {
            %>
            <tr>
                <td><% out.println(rs.getInt(1));%></td>
                <td><% out.println(rs.getString(2));%></td>
                <td><% out.println(rs.getInt(3));%></td>
            </tr>
            <%
                        }
                        rs.close();
                        st.close();
                        con.close();
                        ctx.close();
                    }catch(Exception e)
                    {}
                    
                    
            %>
        
        </table>
        </div>
        </center>
    </body>
</html>
