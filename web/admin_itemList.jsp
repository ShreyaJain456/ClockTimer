<%@page import="java.sql.Statement"%>
<%@page import="javax.naming.NamingException"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        
        <h2>LIST OF ITEMS </h2><br><br>
        <form action="delete">
        <table border=5 cellpadding=30 >
            <tr>
                <th>ID</th>
                <th>Item Name</th>
                <th>Prize</th>
                <th></th>
            </tr>
            
            <%
                int i=0;
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
                <td><input type="submit" value="<%="DELETE "+ ++i%>" name="delete"></td>
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
            <br><br>
        <form action="new_item.html">
            <br> <input type="submit" value="ADD NEW RECORD " name="add">
        </form>
        
    </div>
    </center>
    </body>
</html>
