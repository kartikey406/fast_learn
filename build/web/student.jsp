<html>
    <%@page language="java" %>
    <%@page import="java.sql.*,javax.naming.*,javax.sql.*,java.lang.*" %>
    <body>
        <%
              
            int s_id=0;
            String user=null;
            DataSource ds=null;
            Connection connection=null;
            PreparedStatement stmt=null;
            String user_name=null;
            ResultSet rs=null;
            
            
                user=(String) session.getAttribute("uname");
           
            try
            {
                Context ctx=new InitialContext();
                ds=(DataSource) ctx.lookup("jdbc/logpage");
                connection=ds.getConnection();
                stmt=connection.prepareStatement("Select * from student where name=?");
                stmt.setString(1,user);
               rs=stmt.executeQuery();
               while(rs.next())
               {
                   user_name=rs.getString("student_name");
                 s_id=rs.getInt("student_id");
               }
               session.setAttribute("u",user);
               String id_s=Integer.toString(s_id);
                      session.setAttribute("id",id_s);
                      session.setAttribute("name",user_name );
            
                    out.println("welcome" + " " + user_name);
                    out.println("<br/><br/>");
                    
                   
              
            }
            catch(Exception e)
            {
                System.err.println(e);
            }
            %>
            
             <a href='registration.jsp'> click here for registration </a><br/><br/>
             <a href='course_register.jsp'>registered course </a><br/><br/>
             <a href='course_info.jsp'> click here for course info</a><br/><br/>
             <a href='ask.jsp'>click here for query</a> <br/><br/>
             <a href="answer.jsp">click here for your answer </a><br/><br/>
             <a href="logout.jsp">logout </a>
                 
            
             
             
             
            
    </body>
</html>