<html>
     <%@page language="java" %>
    <%@page import="java.sql.*,javax.naming.*,javax.sql.*,java.util.*" %>
    <body>
        <%int rows=-1;
            List in=null;
            DataSource ds=null;
            Connection connection=null;
            PreparedStatement stmt=null;
            String user_name=null;
            ResultSet rs=null;
            String id_s=(String) session.getAttribute("id");
            try
            {
                in=new LinkedList();
               
               Context ctx=new InitialContext();
                ds=(DataSource) ctx.lookup("jdbc/logpage");
                connection=ds.getConnection();
                stmt=connection.prepareStatement("select query_id,query_text,response_text from query where student_id=? and response=? and counter=?");
                stmt.setString(1, id_s);
                stmt.setInt(2,0);
                stmt.setInt(3,1 );
                rs=stmt.executeQuery();
                if(!rs.next())
                {
                    out.println("you have no answers for  ur queries");
                }
                rs=stmt.executeQuery(); 
                while(rs.next())
                {
                    int l=rs.getInt("query_id");
                    in.add(l);
                    String q=rs.getString("query_text");
                    String r=rs.getString("response_text");
             out.println("<p> question- " + q + "</p>");
             out.println("<p> answer- " + r + "</p>");
             

               
               }
                Iterator it=in.iterator();
                while(it.hasNext())
                {
                    int query=(Integer) it.next();
                    stmt=connection.prepareStatement("update query set response=? where query_id=?");
                    stmt.setInt(1,1);
                    stmt.setInt(2,query);
                    rows=stmt.executeUpdate();
                }
                
            }
            catch(Exception e)
            {
                System.err.println(e);
            }
            %>
    </body>
</html>
