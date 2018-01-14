package Servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class order_item extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
      
        PrintWriter out=response.getWriter();
        String[] items=request.getParameterValues("items");
        HttpSession session=request.getSession();
        
        for(String i : items)
        {
            out.println("<h3>"+i+"</h3>");
        }
        
    }

}
