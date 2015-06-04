<html>
    <%@page   language="java" %>
    <%@page import="javax.sql.*,javax.naming.*,java.sql.*" %>
    <body>
        <%
      
            String city =null;
            int count=0;
            String user_name=null;
            int rows;
            DataSource ds=null;
            Connection connection=null;
            PreparedStatement stmt=null;
            ResultSet rs=null;
            String pass=null;
            String rol=null;
            String sta=null;
             
            
            try
            {
                city=request.getParameter("city");
                Context ctx=new InitialContext();
                ds=(DataSource) ctx.lookup("jdbc/logpage");
                connection=ds.getConnection(); 
                stmt=connection.prepareStatement("Select * from login where username=?");
                user_name=request.getParameter("user");
                stmt.setString(1,user_name);
              rs=stmt.executeQuery();
              if(!rs.next())
              {
                  out.println("username is wrong");
                  return;
              }
              rs=stmt.executeQuery();
              if(rs.next())
                {
                    
                
                     pass=rs.getString("password").trim();
                     rol=rs.getString("role").trim();
                    sta=rs.getString("status").trim();
                    count=rs.getInt("counter");
                }
                if(pass.equals(request.getParameter("pas").trim()))
                {
                    if(sta.equals("b"))
                    {
                        out.println("your account is blocked please consult admin");
                        return;
                    }
                   
                    if(rol.equals("a"))
                    {
                        RequestDispatcher view=request.getRequestDispatcher("/admin/admin_page.jsp");
                        view.forward(request, response);
                        return;
                    }         
                        
                    
                    
                    if(rol.equals("u"))
                    {
                        session.setAttribute("uname",user_name);
                        RequestDispatcher view=request.getRequestDispatcher("student.jsp");
                        view.forward(request,response);
                        return;
                        
                    }
                    if(rol.equals("f"))
                    {
                        RequestDispatcher view=request.getRequestDispatcher("faculty.jsp");
                        view.forward(request,response);
                        return;
                    }
                    
                    
                }
             
             else
            {
                if(count >3)
                {
                   
                   
                    stmt=connection.prepareStatement("update login set status=? where username=?");
                    stmt.setString(1, "b");
                    stmt.setString(2, user_name);
                   rows=stmt.executeUpdate();
                   if(rows >0)
                   {
                        out.println("user account is blocked");
                   }
                   
                }
            
                    else
                {
                    count++;
                    stmt=connection.prepareStatement("update login set counter=? where username=?");
                    stmt.setInt(1,count);
                    stmt.setString(2,user_name);
                    rows=stmt.executeUpdate();
                    if(rows>0)
                    {
                        out.println("password is wrong ");
                    }
                    
                }
                           
                
               
            }
            }   
                    
                
                           
                
               
           
            catch(Exception e)
            {
                System.err.println(e);
            }
            
            
          
           
            %>
    </body>
</html>  