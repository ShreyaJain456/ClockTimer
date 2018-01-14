package Servlet;


import java.sql.Connection;
import java.sql.SQLException;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;


public class connection {
                      
    static InitialContext ctx;     
    static DataSource ds;
    static Connection con=null;
    static Connection getConnection() {

                    try
                    {
                        ctx=new InitialContext();
                        ds=(DataSource)ctx.lookup("jdbc/customer");
                        con=ds.getConnection();
                    }catch(NamingException | SQLException e)
                    {}
                
                    return con;
    }            
    
    static void close()
    {
        try
        {
            con.close();
            ctx.close();
        }catch(SQLException | NamingException e)
        {}
    }
}
