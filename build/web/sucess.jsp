<html>
    <%@page language="java" %>
    <%@page import="java.sql.*,javax.sql.*,javax.naming.*,java.util.*,java.lang.*" %>
    <body>
        <%
             String g=(String) session.getAttribute("u");
               out.println(g);
            int rows=0;
             String teacher=null;
             int courseid=-1;
             int fees=0;
          ResultSet rs=null;
            DataSource ds=null;
            Connection connection=null;
            PreparedStatement stmt=null;
          String studentid=(String) session.getAttribute("id");
           
            String uname=(String) session.getAttribute("name");
            String cours=request.getParameter("coursre");
            try
            {
                 Context ctx=new InitialContext();
                ds=(DataSource) ctx.lookup("jdbc/logpage");
                connection=ds.getConnection();
              stmt=connection.prepareStatement("Select *from register_course where student_id=?");
              stmt.setString(1,studentid);
              rs=stmt.executeQuery();
             
              while(rs.next())
              {
                  String coursename=rs.getString("course_name");
                  if(coursename.equals(cours))
                  {
                      out.println("Sorry,you have already register for this course");
                      return;
                  }
              }
              if(cours.equals("c"))
            {
               stmt=connection.prepareStatement("Select *from course where coursename=?");
                stmt.setString(1,cours);
                rs=stmt.executeQuery();
                while(rs.next())
                {
                     courseid=rs.getInt("courseid");
                     fees=rs.getInt("fee");
                    teacher=rs.getString("teachername");
                }
            }
                
            if(cours.equals("arts"))
            {
               stmt=connection.prepareStatement("Select *from course where coursename=?");
                stmt.setString(1,cours);
                rs=stmt.executeQuery();
                while(rs.next())
                {
                     courseid=rs.getInt("courseid");
                     fees=rs.getInt("fee");
                    teacher=rs.getString("teachername");
                }
            }
            if(cours.equals("management"))
            {
              stmt=connection.prepareStatement("Select *from course where coursename=?");
                stmt.setString(1,cours);
                rs=stmt.executeQuery();
                while(rs.next())
                {
                     courseid=rs.getInt("courseid");
                     fees=rs.getInt("fee");
                    teacher=rs.getString("teachername");
                }
                
                
            }
            if(cours.equals("management"))
            {
              stmt=connection.prepareStatement("Select *from course where coursename=?");
                stmt.setString(1,cours);
                rs=stmt.executeQuery();
                while(rs.next())
                {
                     courseid=rs.getInt("courseid");
                     fees=rs.getInt("fee");
                    teacher=rs.getString("teachername");
                }
                
                
            }
            
            if(cours.equals("java"))
                
            {
                stmt=connection.prepareStatement("Select *from course where coursename=?");
                stmt.setString(1,cours);
                rs=stmt.executeQuery();
                while(rs.next())
                {
                     courseid=rs.getInt("courseid");
                     fees=rs.getInt("fee");
                     teacher=rs.getString("teachername");
                }
            }
            stmt=connection.prepareStatement("insert into register_course  values(?,?,?,?,?,?)");
            stmt.setString(1,studentid);
            stmt.setString(2,uname);
            stmt.setString(3,cours);
            stmt.setInt(4,courseid);
            stmt.setString(5,teacher);
            stmt.setInt(6,fees);
            rows=stmt.executeUpdate();
            if(rows>0)
            {
                out.println("u sucessfully registered the course");
            }
            }
            catch(Exception e)
            {
                System.err.println(e);
            }
            
            %>
    </body>
</html>
