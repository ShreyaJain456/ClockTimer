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
        </table>    <hr>
        <br>
        <h2>ORDER SUMMARY : </h2>
            <table border=5 cellpadding=30>
                <tr>
                    <th>Item</th>
                    <th>Prize</th>
                    <th>Quantity</th>
                    <th>Total prize</th>
                </tr>
        <%!
            int count=0;
        %>    
            <%
            int cost=0;
            String arr[]=request.getParameterValues("items");
            for(String item:arr)
            {
            String key="quantity"+item;
            int quantity=Integer.parseInt(request.getParameter(key));
            
            try
            {    
              InitialContext ctx=new InitialContext();
              DataSource ds=(DataSource)ctx.lookup("jdbc/customer");
              Connection con=ds.getConnection();
              Statement st=con.createStatement();
              ResultSet rs=st.executeQuery("select prize from item where item_name='"+item+"'");
              
              if(rs.next())
              {
                  cost+=rs.getInt(1)*quantity;
                  out.println("<tr><td>"+item+"</td><td>"+rs.getInt(1)+"</td><td>"+quantity+"</td><td>"+rs.getInt(1)*quantity+"</td></tr>");
              }
               rs.close();
               st.close();
               con.close();
               ctx.close();
            
            }catch(Exception e)
            {
               out.println(e);
            }
            }
            
            pageContext.setAttribute("prize",cost);
            %>      
           
            <tr>
                <td><b>Total</b></td>
                <td></td>
                <td></td>
                <td><b>${prize}</b></td>
            </tr>
            
            </table>
            <br><br>
            <form action="emp_payment" method="post">
                Payment Mode :
            <select name="mode">
                <option value="1" selected>Credit/Debit card</option>
                <option value="2" >Balance</option>
            </select>
                <br><br>
                <input type="hidden" value="${prize}" name="prize">   
            <input type="submit" value="continue">
   
            </form>
            
        </div>
        </center>
    </body>
</html>
