<html>
    <%@page language="java" %>
    <%@page import="javax.sql.*,java.sql.*,javax.naming.*,java.util.*" %>
    <body>
        <form action="submit.jsp" method="GET">
              
                  course name<input type="text" name="c_name"/><br/><br/>
                  course fees<input type="text" name="fees"/><br/><br/>
                  faculty_name <select name='f_name'>
            <%
                DataSource ds=null;
                PreparedStatement stmt=null;
                Connection connection=null;
                ResultSet rs=null;
                try
                {
                    Context ctx=new InitialContext();
                    ds=(DataSource) ctx.lookup("jdbc/logpage");
                    connection=ds.getConnection();
                    stmt=connection.prepareStatement("select user_name from faculty");
                    rs=stmt.executeQuery();
                    while(rs.next())
                    {
                        out.println("<option value="+ rs.getString("user_name") + ">" +  rs.getString("user_name") + "</option>");
           
                    }
                    
                }
                catch(Exception e)
                {
                    System.err.println(e);
                }
                %>
                </select>
                    <br/><br/>
          <input type='submit' value='submit' />
          
        </form>
    </body>
</html>