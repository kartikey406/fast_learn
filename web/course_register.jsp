<html>
    <%@page  language="java" %>
    <%@page import="java.sql.*,javax.sql.*,javax.naming.*" %>
    <body>
        <%
            
            DataSource ds=null;
            Connection connection=null;
            PreparedStatement stmt=null;
            ResultSet rs=null;
            String studentid=(String) session.getAttribute("id");
           
            try
            {
                Context ctx=new InitialContext();
                ds=(DataSource) ctx.lookup("jdbc/logpage");
                connection=ds.getConnection();

                stmt=connection.prepareStatement("select course_name,course_id,teacher_name,fees from register_course where student_id=?");
                stmt.setString(1,studentid);
                rs=stmt.executeQuery();
                if(!rs.next())
                {
                    out.println("you have not registered for any course,please register your course!!!!!");
                    return;
                }
              out.println("<table>");
              out.println("<tr>");
              out.println("<td>coursename</td>");
              out.println("<td>courseid</td>");
              out.println("<td>teachername</td>");
              out.println("<td> fee </td>");
              out.println("</tr>");
              stmt=connection.prepareStatement("select course_name,course_id,teacher_name,fees from register_course where student_id=?");
                stmt.setString(1,studentid);
                rs=stmt.executeQuery();
                while(rs.next())
                {
                 String coursename=rs.getString("course_name");
                 int courseid=rs.getInt("course_id");
                 String teachername=rs.getString("teacher_name");
                 int fee=rs.getInt("fees");
                 out.println("<tr>");
                 out.println("<td>" + coursename +"</td>");
                 out.println("<td>" + courseid +"</td>" );
                 out.println("<td>" + teachername  +"</td>");
                 out.println("<td>" + fee + "</td>");
               out.println("</tr>");
                }
                out.println("</table>");
            }     
            
            catch(Exception e)
            {
                System.err.println(e);
            }
            %>
    </body>
</html>
