<html>
    <%@page  language="java" %>
    <%@page import="java.sql.*,javax.naming.*,javax.sql.*,java.sql.Date,java.util.*" %>
    <body>
        <%
             String user=(String) session.getAttribute("uname");
                     if(user==null)
                     {
                         out.println("invalidate user");
                         return;
                     }
           DataSource ds=null;
           Connection connection=null;
           PreparedStatement stmt=null;
           ResultSet rs=null;
           try
           {
              String identity=(String) session.getAttribute("id");
               Context ctx=new InitialContext();
               ds=(DataSource) ctx.lookup("jdbc/logpage");
               connection=ds.getConnection();
               stmt=connection.prepareStatement("Select coursename from course");
               rs=stmt.executeQuery();
               
               out.println("<form action='submit.jsp' action='GET'>");
               out.println("enter your query:<input type='text' name='question'/> <br/><br/>");
               out.println("Select your course:<select name='course'>");
                ;
               while(rs.next())
               {
                   out.println("<option value=" + rs.getString("coursename") + ">"  + rs.getString("coursename") +"</option>");
               }
               out.println("<select><br/><br/>");
              
              
               out.println("<input type='submit' value='click'/>");
               out.println("</form>");
          
           }
           
           catch(Exception e)
           {
               System.err.println(e);
           }
                 
            
        %>
        
        
       
   
    </body>
</html>