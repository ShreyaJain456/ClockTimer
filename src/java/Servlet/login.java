
package Servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class login extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        PrintWriter out=response.getWriter();
        String uname=request.getParameter("username");
        String pass=request.getParameter("password");
        
        if(uname.equalsIgnoreCase("Admin") && pass.equalsIgnoreCase("0000"))
        {
            RequestDispatcher rd=request.getRequestDispatcher("admin_itemList.jsp");
            rd.forward(request, response);
            return;
        }
        try
        {
            try (Statement st = connection.getConnection().createStatement()) {
                ResultSet rs=st.executeQuery("select employee_id,employee_name,department,salary,balance from Customer where username='"+uname+"' and password='"+pass+"'");
                if(rs.next())
                {
                    
                    HttpSession session=request.getSession();
                    
                    emp e=new emp();
                    e.setEmpID(rs.getInt(1));
                    e.setName(rs.getString(2));
                    e.setDept(rs.getString(3));
                    e.setSal(rs.getInt(4));
                    e.setBal(rs.getInt(5));
                    session.setAttribute("key",e);
                    session.setAttribute("uname",uname);
                    session.setAttribute("pass",pass);
                    RequestDispatcher rd=request.getRequestDispatcher("emp_index.jsp");
                    rd.include(request, response);
                }
                else
                {
                    RequestDispatcher rd=request.getRequestDispatcher("login.html");
                    rd.include(request,response);
                    out.println("Incorrect username/password");
                }
                rs.close();
            }
          connection.close();
        }catch(SQLException e)            
        {
            out.println("Exception occured "+e);
        }
        
        
    }

}
