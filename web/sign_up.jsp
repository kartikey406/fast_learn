<html>
    <%@page language="java" %>
    <%@page import="java.sql.*,javax.naming.*,javax.sql.*,java.util.*,java.lang.*" %>
    <body>
        <%int s_id=0;
            int no=0;
            String name_of_student=null;
            String addres=null;
            String paswrd=null;
          String p_no=null;
          int number=-1;
            String city_of_student =null;
            String city_name=null;
            int c_id=0;
            
            DataSource ds=null;
            Connection connection=null;
            ResultSet rs=null;
            PreparedStatement stmt=null;
            int rows=0;
            List error_msg=null;
            String user_name=null;
            try
            {
                name_of_student=request.getParameter("name");
                addres=request.getParameter("address");
                p_no=request.getParameter("number");
             paswrd=request.getParameter("pass");
                city_name=request.getParameter("city");
                user_name=request.getParameter("user");
                error_msg=new LinkedList();
              Context ctx=new InitialContext();
              ds=(DataSource) ctx.lookup("jdbc/logpage");
              connection=ds.getConnection();
              stmt=connection.prepareStatement("Select username from login");
              rs=stmt.executeQuery();
              while(rs.next())
              {
                 String us=rs.getString("username");
                 if(us.equals(user_name))
                 {
                     error_msg.add("you can't take this username it is already defined");
                     
                 }
            }
              stmt=connection.prepareStatement("Select center_id from study_center where  location=?");
              if(city_name.equals("haldwani"))
              {
                  stmt.setString(1,"haldwani");
                  rs=stmt.executeQuery();
                 while(rs.next())
                  {
                      c_id=rs.getInt("center_id");
                  }
              }
               if(city_name.equals("delhi"))
              {
                  stmt.setString(1,"delhi");
                   rs=stmt.executeQuery();
                  while(rs.next())
                  {
                      c_id=rs.getInt("center_id");
                  }
              }
                if(city_name.equals("noida"))
              {
                  stmt.setString(1,"noida");
                   rs=stmt.executeQuery();
                  while(rs.next())
                  {
                      c_id=rs.getInt("center_id");
                  }
              }
               if(city_name.equals("unknown"))
               {
                   error_msg.add("you have not selected a city name which is mandatory");
               }
                try
                {
                number=Integer.parseInt(p_no);
                }
                catch(NumberFormatException e)
                {
                 error_msg.add("phone number is not in proper format");
                }
             
               if(addres.length()==0)
               {
                   error_msg.add("error field is empty");
               }
               if(name_of_student.length()==0)
               {
                   error_msg.add("Name field is not selected");
               }
               if(p_no.length()==0)
               {
                   error_msg.add("phone number is not selected");
               }
               if(!error_msg.isEmpty())
               {
                   Iterator i1=error_msg.iterator();
                   while(i1.hasNext())
                   {
                       out.println(i1.next());
                       out.println("<br/><br/>");
                   }
                 return;
                 
               }
               if(error_msg.isEmpty())
               {
               
                   stmt=connection.prepareStatement("insert into student (name,city,center_id,phone_no,student_name,student_address) values(?,?,?,?,?,?)");
                   stmt.setString(1,user_name);
                 
                   stmt.setString(2,city_name);
                   stmt.setInt(3,c_id);
                   stmt.setInt(4,number);
                   stmt.setString(5,name_of_student);
                   stmt.setString(6,addres);
                  
                  rows=stmt.executeUpdate();
                  stmt=connection.prepareStatement("select student_id from student where name=?" );
                  stmt.setString(1,name_of_student);
                  rs=stmt.executeQuery();
                  
                   stmt=connection.prepareStatement("insert into login values(?,?,?,?,?)");
                   stmt.setString(1,user_name);
                   stmt.setString(2,paswrd);
                   stmt.setString(3, "u");
                   stmt.setString(4,"nb");
                   stmt.setInt(5,0);
                 
                   
                  
                   no=stmt.executeUpdate();
                   if(rows>0 && no>0)
                   {
                       out.println(name_of_student + " " + "is  sucessfully registered" + " "+ "your user_name is " + user_name );
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