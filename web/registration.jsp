<html>
    <%@page language="java" %>
    <%@page import="javax.sql.*,java.sql.*,javax.naming.*" %>
    <body>
        <%
            String user=(String) session.getAttribute("uname");
                     if(user==null)
                     {
                         out.println("invalidate user");
                         return;
                     }
            %>
       
          <form action='sucess.jsp' method="GET">
         Course <select name='coursre'>
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
                 stmt=connection.prepareStatement("Select coursename from course");
                 rs=stmt.executeQuery();
                  out.println("<option value='unknown'>unknown</option>");
      while(rs.next())
      {
           
           out.println("<option value="+ rs.getString("coursename") + ">" +  rs.getString("coursename") + "</option>");
           
                 }
                 }
                 catch(Exception e)
                 {
                     System.err.println(e);
                 }
         %>
</select>
                    
          <input type='submit' value='submit' />
          </form>
          
           
          
            
        
    </body>
</html>