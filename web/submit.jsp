<html>
    <%@page language="java" %>
    <%@page import="javax.sql.*,java.sql.*,javax.naming.*,java.util.*,java.sql.Date" %>
   
    <body>
        <%
            int i=0;
            int  rows=-1;
    int t_id=0;
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
              String student_id=(String)session.getAttribute("id");
            String c_name=(String)request.getParameter("course");
            String ques=(String) request.getParameter("question");
            stmt=connection.prepareStatement("select course_name from register_course where student_id=?");
           stmt.setString(1,student_id);
            rs=stmt.executeQuery();
          while(rs.next())
          {
              String c=rs.getString("course_name");
              if(c.equals(c_name))
              {
                  i++;
                  break;
                  
              }
          }
          if(i==0)
          {
              out.println("you have not registered for this course");
              return;
             
          }
          stmt=connection.prepareStatement("Select teacher_id from course where coursename=?");
          stmt.setString(1,c_name);
          rs=stmt.executeQuery();
          while(rs.next())
          {
               t_id=rs.getInt("teacher_id");
          }
          stmt=connection.prepareStatement("insert into query (query_text, query_date, response_date, student_id ,faculty_id,response_text,response) values(?,?,?,?,?,?,?)");
          stmt.setString(1,ques);
          stmt.setDate(2,date);
          stmt.setDate(3,null);
          stmt.setString(4,student_id);
          stmt.setInt(5,t_id);
          stmt.setString(6,null);
          stmt.setInt(7,0);
          rows=stmt.executeUpdate();
          
          if(rows>0)
          {
              out.println("sucessfully asked query");
          }
         
           }
           catch(Exception e)
           {
               System.err.println(e);
           }
                   
            %>
    </body>
</html>