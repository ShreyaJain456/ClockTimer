package Servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Statement;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class emp_changePass extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        PrintWriter out=response.getWriter();
        String old_pass=request.getParameter("old_pass");
        String new_pass=request.getParameter("new_pass");
        
        HttpSession session=request.getSession();
        String pass=(String)session.getAttribute("pass");
        String uname=(String)session.getAttribute("uname");
        
        if(pass.equals(old_pass))
        {
            try
            {    
            Statement st=connection.getConnection().createStatement();
            st.execute("Update customer set password='"+new_pass+"' where password='"+pass+"' and username='"+uname+"'");
            RequestDispatcher rd=request.getRequestDispatcher("emp_index.jsp");
            rd.include(request, response);
            out.println("<h3>Password is successfully changed</h3>");
            session.setAttribute("pass",new_pass);
                    
            }catch(Exception e)
            {}
        }
        else
        {
            RequestDispatcher rd=request.getRequestDispatcher("emp_index.jsp");
            rd.include(request, response);
            session.setAttribute("pass","vdv");
            out.println("<h3>Incorrect old password</h3>");
            session.setAttribute("pass",pass);
            
            
          
        }    
    }

}
