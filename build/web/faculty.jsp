<html>
    <%@page language="java" %>
    <%@page import="javax.sql.*,javax.naming.*,java.sql.*,java.sql.Date,java.util.*" %>
    <body>
        <%
            int id=-1;
            String user_name=null;
            DataSource ds=null;
            Connection connection=null;
            PreparedStatement stmt=null;
            ResultSet rs=null;
            try
            {
                Context ctx=new InitialContext();
                ds=(DataSource) ctx.lookup("jdbc/logpage");
                connection=ds.getConnection();
                String name=request.getParameter("user");
            stmt=connection.prepareStatement("Select  faculty_id,name from faculty where user_name=?");
            stmt.setString(1,name);
            rs=stmt.executeQuery();
            while(rs.next())
            {
                id=rs.getInt("faculty_id");
                user_name=rs.getString("name");
                
            }
            session.setAttribute("f_id",id);
            session.setAttribute("name",user_name);
            out.println("<h1> welcome" + " " +  user_name  + " "+ "</h1>");
            }
            catch(Exception e)
            {
                System.err.println(e);
            }

                %>
                <a href="faculty_query.jsp"> click here for query resposne</a>
                
    </body>
</html>
