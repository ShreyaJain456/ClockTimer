
package Servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class delete_item extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
            PrintWriter out=response.getWriter();
            String button=request.getParameter("delete");
            int count=Integer.parseInt(button.substring(7));
            try
            {    
                Statement st=connection.getConnection().createStatement();
                ResultSet rs=st.executeQuery("select * from item ");
                int ctr=0;
                while(rs.next())
                {
                    ctr++;
                    if(ctr==count)
                    {
                        st.executeUpdate("delete from item where item_no="+rs.getInt(1)+"");
                    }
                }
            }catch(Exception e)
            {
                
            }
            
            RequestDispatcher rd=request.getRequestDispatcher("admin_itemList.jsp");
            rd.forward(request,response);
    }


}
