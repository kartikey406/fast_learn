<html>
    <%@page language="java" %>
    <body>t
        
        <%     
            try
            {
    response.setHeader("Cache-Control","no-cache"); //Forces caches to obtain a new copy of the page from the origin server
    response.setHeader("Cache-Control","no-store"); //Directs caches not to store the page under any circumstance
    response.setDateHeader("Expires", 0); //Causes the proxy cache to see the page as "stale"
    response.setHeader("Pragma","no-cache"); //HTTP 1.0 backward compatibility
   session.removeAttribute("uname");
    session.invalidate();
    
 
String username = (String) session.getAttribute("uname");

 if(username.equals(null))
    
 {
   request.setAttribute("Error", "Session has ended.  Please login.");
   RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
   rd.forward(request, response);
   return;
 }

            }
            catch(Exception e)
            {
                System.err.println(e);
            }
           
            %>
    </body>
</html>