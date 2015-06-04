<html>
     <%@page language="java" %>
    <%@page import="javax.sql.*,javax.naming.*,java.sql.*,java.sql.Date,java.util.*" %>
    <body>
        <%
            int counter=-1;
            int j=1;
            String[] take= new String[23];
            int rows=-1;
            int i=1;
            int n=1;
       int k=1;
       int id=-1;
      List qid=(List) session.getAttribute("quer_id");
       
            DataSource ds=null;
            Connection connection=null;
            ResultSet rs=null;
            PreparedStatement stmt=null;
            PreparedStatement alter=null;
            try
            {
                 Calendar calendar = Calendar.getInstance();
                Date date=new Date(calendar.getTime().getTime());
               
              
                Context ctx=new InitialContext();
                ds=(DataSource) ctx.lookup("jdbc/logpage");
                connection=ds.getConnection();
                k=(Integer)session.getAttribute("counte");
                id=(Integer)session.getAttribute("f_id");
                Iterator it=qid.iterator();
                while(i<=k)
                {
                    take[i]=request.getParameter("ans"+i);
                  
                 
                    i++;
                }
              
                
                while(it.hasNext())
                {
                    int qd=(Integer) it.next();
               
              stmt=connection.prepareStatement("update query set response_date=?,response_text=? where faculty_id=? and query_id=?");
              stmt.setDate(1,date);
          if(take[j].length()==0)
          {
               stmt.setString(2,null);
               alter=connection.prepareStatement("update query set counter=? where query_id=?");
              alter.setInt(1,0);
              alter.setInt(2,qd);
              int r=alter.executeUpdate();
               j++;
          }
           else
          {
              stmt.setString(2,take[j]);
               alter=connection.prepareStatement("update query set counter=? where query_id=?");
               alter.setInt(1,1);
               alter.setInt(2,qd);
                int s=alter.executeUpdate();
                
               j++;
          }
              
             stmt.setInt(3, id);
               stmt.setInt(4,qd);
               rows=stmt.executeUpdate();
               
                }
               
                if(rows>0)
                {
                    out.println("sucessfully reponsed");
                }
            
            }
            catch(Exception e)
            {
                System.err.println(e);
            }
            %>
    </body>
</html>
