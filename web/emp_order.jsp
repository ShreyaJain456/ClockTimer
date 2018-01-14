<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
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
        <h2>Place your Order : <br></h2>
        <form action="emp_order2.jsp">
                
            <table border=5 cellpadding=30>
                <tr>
                    <th>Selection</th>
                    <th>Item</th>
                    <th>Prize</th>
                    <th>Quantity</th>
                </tr>
                
            <%
                try
                    {
                        InitialContext ctx=new InitialContext();
                        DataSource ds=(DataSource)ctx.lookup("jdbc/customer");
                        Connection con=ds.getConnection();
                        Statement st=con.createStatement();
                        ResultSet rs=st.executeQuery("select * from item ");
                        
                        while(rs.next())
                        {
                            
            %>
            <tr>
                <td><input type="checkbox" name="items" value="<%=rs.getString(2)%>"></td>
                <td><%=rs.getString(2)%></td>
                <td><%=rs.getInt(3)%></td>
                <td><input type="text" name="<%="quantity"+rs.getString(2)%>" ></td>
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
            <br><br><br><br>
            <input type="submit" value="NEXT">
        </form>
        </div>    
    </center>
    </body>
</html>
