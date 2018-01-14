package Servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
public class New_user extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        PrintWriter out=response.getWriter();
        try
        {    
            int num=Integer.parseInt(request.getParameter("EID"));
            String name=request.getParameter("Ename");
            String username = request.getParameter("uname");
            String pass=request.getParameter("pass");
            String rpass = request.getParameter("rpass");
            String dept = request.getParameter("dept");
            int sal = Integer.parseInt(request.getParameter("salary"));
                       
            if(num<=0)
            {
                RequestDispatcher rd=request.getRequestDispatcher("register.html");
                rd.include(request,response);
                out.println("Enter valid employee ID");
            }
            else if(name.isEmpty() || name.length()>20)
            {
                RequestDispatcher rd=request.getRequestDispatcher("register.html");
                rd.include(request,response);
                out.println("Enter valid name");                
            }
            else if(username.isEmpty() || username.length()>20)
            {                 
                RequestDispatcher rd=request.getRequestDispatcher("register.html");
                rd.include(request,response);
                out.println("Enter valid username");
            }
            else if(pass.isEmpty())
            {                
                RequestDispatcher rd=request.getRequestDispatcher("register.html");
                rd.include(request,response);
                out.println("Enter valid password");
            }
            else if(pass.equals(rpass)==false)
            {               
                RequestDispatcher rd=request.getRequestDispatcher("register.html");
                rd.include(request,response);
                out.println("Password did not matched");
            }
            else if(dept.isEmpty())
            {               
                RequestDispatcher rd=request.getRequestDispatcher("register.html");
                rd.include(request,response);
                out.println("Enter valid department");
            }
            else if(sal<=0)
            {
                RequestDispatcher rd=request.getRequestDispatcher("register.html");
                rd.include(request,response);
                out.println("Enter valid salary");
            }
            else
            {    
                    Statement st=connection.getConnection().createStatement();
                    st.executeUpdate("insert into Customer values("+num+",'"+name+"','"+username+"','"+pass+"','"+dept+"',"+sal+",0)");
                
                RequestDispatcher rd=request.getRequestDispatcher("login.html");
                rd.include(request,response);
                out.println("<h3>Your account is successfully created</h3>");
                st.close();
                connection.close();
            }
        }catch(NumberFormatException e)
        {
            RequestDispatcher rd=request.getRequestDispatcher("register.html");
            rd.include(request,response);
            out.println("Enter valid employee ID or salary");
        } catch (SQLException ex) {
            
            RequestDispatcher rd=request.getRequestDispatcher("register.html");
            rd.include(request,response);
            out.println("Invalid data");
        } 
    }
}
