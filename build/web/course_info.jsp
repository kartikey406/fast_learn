<html>
    <%@page language="java" %>
    <%@page import="java.sql.*,javax.sql.*,javax.naming.*" %>
    <body>
        <%
            ResultSet rs=null;
            DataSource ds=null;
            Connection connection=null;
            PreparedStatement stmt=null;
            try
            {
                String y=(String) session.getAttribute("uname");
                if(y==null)
                {
                    out.println("no course info");
                    return;
                }
                Context ctx=new InitialContext();
                ds=(DataSource) ctx.lookup("jdbc/logpage");
                connection=ds.getConnection();
                stmt=connection.prepareStatement("select coursename,fee,teachername from course  ");
                rs=stmt.executeQuery();
                out.println("<table>");
                out.println("<tr>");
                out.println("<td> coursename </td>");
             
                out.println("<td> fees </td>");
                
               
                out.println("<td> teachername </td>");
                while(rs.next())
                {
                    String course=rs.getString("coursename");
                    int fees=rs.getInt("fee");
                    String name=rs.getString("teachername");
                    out.println("<tr>");
                    out.println("<td>" + course + "</td>");
                    out.println("<td>" + fees + "</td>");
                    out.println("<td>" + name + "</td>" );
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
