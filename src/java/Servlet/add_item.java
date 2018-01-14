
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

public class add_item extends HttpServlet {


    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    
        PrintWriter out=response.getWriter();
        String name=request.getParameter("name");
        int prize=Integer.parseInt(request.getParameter("prize"));
        try {
            boolean flag=false;
            Statement st=connection.getConnection().createStatement();
            ResultSet rs=st.executeQuery("select * from item where item_name='"+name+"'");
            
            while(rs.next())
            {
                RequestDispatcher rd=request.getRequestDispatcher("admin_itemList.jsp");
                rd.include(request, response);
                out.println("<h3>Sorry item already exits</h3>");
                flag=true;
            }
            rs.close();
            st.close();
            connection.close();
            if(!flag)  //Item does not exist already in the table
            {
                int max=0;
                st=connection.getConnection().createStatement();
                rs=st.executeQuery("select max(item_no) from item");
                while(rs.next())
                {
                    max=rs.getInt(1);
                }
                max++;
                rs.close();
               
                st.executeUpdate("insert into item values("+max+",'"+name+"',"+prize+")");
                RequestDispatcher rd=request.getRequestDispatcher("admin_itemList.jsp");
                rd.include(request, response);
                out.println("Item is added");
                
            }
        } catch (SQLException ex) {
            out.println(ex);
        }
        
    }

    
    
}
