<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Admin Login</title>
    </head>
    <body background="images/cms.jpg">
        <center>
        <div id="menu" style="background-color:white;height:800px;width:900px;float:middle;border:2 ">
        <h1>CANTEEN MANAGEMENT SYSTEM</h1>
        <hr>
        <table bgcolor="yellow">
            <th>&emsp;<a href="admin_itemList.jsp">ADD ITEMS</a>&emsp;|</th>
            <th>&emsp;<a href="admin_empList.jsp">LIST OF EMPLOYEES</a>&emsp;|</th>
            <th>&emsp;<a href="index.html">LOG OUT</a>&emsp;</th>
        </table>
        <hr>
        <h3>LIST OF EMPLOYEES</h3>
        <form action="admin_editEmp.jsp" method="post">
            
        <table border=5 cellpadding=30 >
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Department</th>
                <th>Salary</th>
                <th>Balance</th>
                <th>Edit record</th>
            </tr>
            <%
                int i=0;
                try
                    {
                        InitialContext ctx=new InitialContext();
                        DataSource ds=(DataSource)ctx.lookup("jdbc/customer");
                        Connection con=ds.getConnection();
                        Statement st=con.createStatement();
                        ResultSet rs=st.executeQuery("select employee_id,employee_name,department,salary,balance from customer");
                        
                        while(rs.next())
                        {
            %>
            <tr>
                <td><% out.println(rs.getInt(1));%></td>
                <td><% out.println(rs.getString(2));%></td>
                <td><% out.println(rs.getString(3));%></td>
                <td><%out.println(rs.getInt(4));%></td>
                <td><%out.println(rs.getInt(5));%></td>
                <td><input type="submit" value="<%="EDIT "+ ++i%>" name="edit"></td>
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
        </form>
        </div>
        </center>
    </body>
</html>
