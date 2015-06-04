<html>
    <%@page language="java" %>
    <%@page import="javax.naming.*,java.sql.*,javax.sql.*,java.util.*,java.sql.Date"%>
    <body>
        <%
            DataSource ds=null;
            Connection connection=null;
            PreparedStatement stmt=null;
            ResultSet rs=null;
            try
            {
                Context ctx=new InitialContext();
                ds=(DataSource) ctx.lookup("jdbc/logpage");
                connection=ds.getConnection();
                 Calendar calendar = Calendar.getInstance();
                Date date=new Date(calendar.getTime().getTime());
              stmt=connection.prepareStatement("Insert into query values(?,?,?,?,?,?)");
              stmt.setInt(1,112);
              stmt.setString(2,"name");
              stmt.setDate(3,date);
              stmt.setDate(4,null);
              stmt.setString(5,"123");
              stmt.setInt(6,2234);
              int rows=stmt.executeUpdate();
              if(rows >0)
              {
                  out.println("sucessfully registered");
              }
              
             
                
                
            }
            catch(Exception e)
            {
                System.err.println(e);
            }
                 
            %>
        
    </body>
</html>
