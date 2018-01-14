
package Servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class filter_newUser implements Filter {
    
    @Override
    public void doFilter(ServletRequest request, ServletResponse response,
            FilterChain chain)
            throws IOException, ServletException {
        
        PrintWriter out=response.getWriter();
         String uname = request.getParameter("uname");
         out.println("vfvfv");
         try (Statement st = connection.getConnection().createStatement()) {
                ResultSet rs=st.executeQuery("select * from Customer where username='"+uname+"'");
                if(rs.next() || uname.equalsIgnoreCase("admin"))
                {
                    out.println("Sorry username already exist !!!");
                    
                }
                else
                {
                    //chain.doFilter(request, response);
                }
                rs.close();
          connection.close();
        }catch(SQLException e)            
        {
            out.println("Exception occured");
        }
        
        
    }

    public void destroy() {        
    }

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    
}
