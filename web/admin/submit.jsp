<html>
    <%@page language="java" %>
    <%@page import="java.sql.*,javax.sql.*,javax.naming.* "%>
    <body>
        <%
            int rows=-1;
            int f_id=-1;
            String t_name=null;
            String name=request.getParameter("f_name");
            String course_name=request.getParameter("c_name");
            String fees=request.getParameter("fees");
            int fee=Integer.parseInt(fees);
            DataSource ds=null;
            Connection connection=null;
            PreparedStatement stmt=null;
            ResultSet rs=null;
            try
            {
                stmt=connection.prepareStatement("select faculty_id,name from faculty where user_name=?");
                stmt.setString(1,"name");
                rs=stmt.executeQuery();
                while(rs.next())
                {
                    f_id=rs.getInt("faculty_id");
                    t_name=rs.getString("name");
                }
                stmt=connection.prepareStatement("insert into course (coursename,fee,teachername,teacher_id) values(?,?,?,?)");
                stmt.setString(1,course_name);
                stmt.setInt(2,fee);
                stmt.setString(3,t_name);
                stmt.setInt(4,f_id);
                rows=stmt.executeUpdate();
                if(rows>0)
                {
                    out.println("u sucessfully added the course details");
                }
                    
                
            }
            catch(Exception e)
            {
                System.err.println(e);
            }
            %>
    </body>
</html>
