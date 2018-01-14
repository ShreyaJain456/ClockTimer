
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

public class emp_payment extends HttpServlet {


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        PrintWriter out=response.getWriter();
        String mode=request.getParameter("mode");
            
        if(mode.equals("1"))
        {
            RequestDispatcher rd=request.getRequestDispatcher("emp_payment.html");
            rd.forward(request, response);
        }
        else
        {
                HttpSession hs=request.getSession();
                emp e=(emp)hs.getAttribute("key");
                
                int payment=Integer.parseInt(request.getParameter("prize"));
                if(e.getBal()>payment)
                {    
                  payment=e.getBal()-payment;  
                  e.setBal(payment);
                  try
                  {    
                  Statement st=connection.getConnection().createStatement();
                  st.executeUpdate("update customer set balance="+payment+" where employee_id="+e.getEmpID()+"");
                  
                  RequestDispatcher rd=request.getRequestDispatcher("emp_payment2.html");
                  rd.forward(request, response);
                  }catch(Exception e2)
                  {
                      out.println("Exception occured");
                  }    
                }  
                else
                {
                    out.println("<h3>Sorry less balance.Please order again.</h3>");
                    RequestDispatcher rd=request.getRequestDispatcher("emp_order.jsp");
                    rd.include(request, response);
                }   
        }    
    }   
}
 
