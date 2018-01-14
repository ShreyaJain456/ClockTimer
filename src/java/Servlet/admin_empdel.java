
package Servlet;

import java.io.IOException;
import java.sql.Statement;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class admin_empdel extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try
        {    
        Statement st=connection.getConnection().createStatement();
        st.executeUpdate("delete from customer where employee_id="+request.getParameter("key")+"");
        RequestDispatcher rd=request.getRequestDispatcher("admin_empList.jsp");
        rd.forward(request, response);
        }catch(Exception e)
        {}
    }

}
