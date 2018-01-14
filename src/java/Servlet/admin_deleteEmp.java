package Servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Statement;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class admin_deleteEmp extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            
        PrintWriter out=response.getWriter();
        String id=request.getParameter("id");
        String name=request.getParameter("name");
        String dept=request.getParameter("dept");
        String sal=request.getParameter("sal");
        String bal=request.getParameter("bal");
        String key=request.getParameter("key");                        
                
        try
        {
            
            Statement st=connection.getConnection().createStatement();
           if(id!=null)
                st.executeUpdate("Update customer set employee_id="+request.getParameter("text1")+" where employee_id="+key+"");
           else if(name!=null)
                st.executeUpdate("Update customer set employee_name='"+request.getParameter("text2")+"' where employee_id="+key+"");
           else if(dept!=null)
                st.executeUpdate("Update customer set department='"+request.getParameter("text3")+"' where employee_id="+key+"");
            else if(sal!=null)
                st.executeUpdate("Update customer set salary="+request.getParameter("text4")+" where employee_id="+key+"");
            else if(bal!=null)
                st.executeUpdate("Update customer set balance="+request.getParameter("text5")+" where employee_id="+key+"");
                
            st.close();
        }catch(Exception e)
        {
        out.println(e);
        }
        
        RequestDispatcher rd=request.getRequestDispatcher("admin_empList.jsp");
        rd.forward(request,response);
    }

}
