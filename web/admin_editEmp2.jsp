<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <body background="images/cms.jpg">
        <center>
        <div id="menu" style="background-color:white;height:620px;width:900px;float:middle;border:2 ">
        <h1>CANTEEN MANAGEMENT SYSTEM</h1>
        <hr>
        <form action="admin_deleteEmp" method="post">
            <input type="hidden" name="key" value="<%=request.getParameter("key")%>">
        <%
            String id=request.getParameter("id");
            String name=request.getParameter("name");
            String dept=request.getParameter("dept");
            String sal=request.getParameter("sal");
            String bal=request.getParameter("bal");
            String delete=request.getParameter("delete");
            
            if(delete!=null)
            {
                RequestDispatcher rd=request.getRequestDispatcher("admin_empdel");
                rd.forward(request, response);
            }
            if(id!=null)
            {
        %>
        
        Enter updated employee ID   :   <input type="text" name="text1"><br>
                    <input type="submit" value="update" name="id">
        <%
            }
            else if(name!=null)
            {    
        %>
        Enter updated name   :   <input type="text" name="text2"><br>
                    <input type="submit" value="update" name="name">
        <%       
            }
            else if(dept!=null)
            {    
        %>
        Enter updated Department   :   <input type="text" name="text3"><br>
                    <input type="submit" value="update" name="dept">
        <%
            }
            else if(sal!=null)
            {    
        %>
        Enter updated salary   :   <input type="text" name="text4"><br>
                    <input type="submit" value="update" name="sal">
        <%     
            }
            else if(bal!=null)
            {    
        %>
        Enter updated Balance   :   <input type="text" name="text5"><br>
                    <input type="submit" value="update" name="bal">
        <%
            }    
        %>   
        <input type="submit" value="Delete Record" name="delete">
        <input type="submit" value="BACK" name="back">
        </form>
        </div>
        </center>
    </body>
</html>
