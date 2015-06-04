<html>
     <%@page language="java" %>
    <%@page import="javax.sql.*,javax.naming.*,java.sql.*,java.sql.Date,java.util.*" %>
    <body>
        
        <%
            int q_id=-1;
            
      List l3=null;
            int j=1;
            int i=-1;
            List l1=null;
            String res=null;
            DataSource ds=null;
            Connection connection=null;
            ResultSet rs=null;
            
            PreparedStatement stmt=null;
            try
            {
                l3=new LinkedList();
                
                l1=new LinkedList();
                Context ctx=new InitialContext();
                ds=(DataSource) ctx.lookup("jdbc/logpage");
                connection=ds.getConnection();
                int id=(Integer) session.getAttribute("f_id");
                
                stmt=connection.prepareStatement("Select query_id,query_text ,counter from query where faculty_id=?");
                stmt.setInt(1,id);
                rs=stmt.executeQuery();
                if(!rs.next())
                {
                    out.println("you have no such query ");
                    return;
                }
                rs=stmt.executeQuery();
                while(rs.next())
                {
                    int count=rs.getInt("counter");
                    if(count>1)
                    {
                        
                    }
                    if(count==0)
                    {
                    res=rs.getString("query_text");
                    q_id=rs.getInt("query_id");
                    l1.add(res);
                    l3.add(q_id);
                   
                    i++;
                    
                   count++;
                    }
                }
                if(i==-1)
                {
                    out.println("you have no latest query");
                    return;
                }
                
              
             
                     
            }
           
            catch(Exception e)
            {
                System.err.println(e);
            }
            %>
                <form action='response.jsp' method='GET'>
            <% Iterator it=l1.iterator(); 
            while(it.hasNext()){
                
            out.println("<p>"+it.next()+"</p>");
            %>
            answer<input type='text' name='ans<%=j%>'/>
            <br>
            <% j++;
            }%>
            <input type='submit' value='SUBMIT'/>
            </form>
            <%  session.setAttribute("counte",j);
            session.setAttribute("quer_id",l3);
            %>
           
        
                
            
            
    </body>
</html>