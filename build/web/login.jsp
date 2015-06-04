<html>
    <%@page language="java" %>
    <body>
        <% response.setHeader("Cache-Control", "no-cache");
            response.setHeader("Cache-Control", "no-store");
            %>
        
        
        <form action='verify.jsp' method='GET' >
            USERNAME:<input type='text' name='user'/> <br/><br/>
            PASSWORD:<input type='password' name='pas'/> <br/><br/>
            <input type='submit' value='Login' />
        </form>
        <form action='sign.jsp' method='GET' >
            <input type='submit' value='SignUp' />
        </form>
      
    </body>
</html>
