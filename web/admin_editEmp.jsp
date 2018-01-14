<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <body background="images/cms.jpg">
        <center>
        <div id="menu" style="background-color:white;height:650px;width:900px;float:middle;border:2 ">
        <h1>CANTEEN MANAGEMENT SYSTEM</h1>
        <hr>
        
        <%
            String button=request.getParameter("edit");
            int count=Integer.parseInt(button.substring(5));
            try
            {    
                InitialContext ctx=new InitialContext();
                DataSource ds=(DataSource)ctx.lookup("jdbc/customer");
                Connection con=ds.getConnection();
                Statement st=con.createStatement();
                
                ResultSet rs=st.executeQuery("select * from customer ");
                int ctr=0;
                while(rs.next())
                {
                    ctr++;
                    
                    if(ctr==count)
                    {
        %>
        <form action="admin_editEmp2.jsp" method="post">
        <pre>   
            <h2>
Employee ID    :       <%=rs.getInt(1)%>&nbsp;&nbsp;&nbsp;<input type="submit" name="id" value="update"><br><br><br>
Name           :       <%=rs.getString(2)%>&nbsp;&nbsp;&nbsp;<input type="submit" name="name" value="update"><br><br><br>
Department     :       <%=rs.getString(5)%>&nbsp;&nbsp;&nbsp;<input type="submit" name="dept" value="update"><br><br><br>
Salary         :       <%=rs.getInt(6)%>&nbsp;&nbsp;&nbsp;<input type="submit" name="sal" value="update"><br><br><br>
Balance        :       <%=rs.getInt(7)%>&nbsp;&nbsp;&nbsp;<input type="submit" name="bal" value="update"><br>
            </h2></pre>
        <input type="submit" value="Delete" name="delete"><input type="hidden" name="key" value="<%=rs.getInt(1)%>">
      <%            }
                }
            con.close();
            ctx.close();    
            }catch(Exception e)
            {
                
            }
        %>
        </form>
        <form action="admin_empList.jsp">
            <input type="submit" value="BACK"></form>
        </div>
        </center>
    </body>
</html>
