<%-- 
    Document   : jsonview
    Created on : Jul 13, 2017, 12:41:41 PM
    Author     : sun
--%>

<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@page import= "org.json.JSONObject" %>
<!DOCTYPE html>
<html>
    <head>
        
    </head>
    <body>
         <%
              
              if(request.getParameter("user_id")!=null && request.getParameter("user_id")!="")
              {
                  String userid=request.getParameter("user_id");
                  
                   Class.forName("com.mysql.jdbc.Driver");
        
                   Connection con2=DriverManager.getConnection("jdbc:mysql://localhost/practice","root","");
                   
                   String qr="select * from user where user_id='"+userid+"'";
                   
                   PreparedStatement statement1 = con2.prepareStatement(qr);
        
                   ResultSet rs2 = statement1.executeQuery();
                    
                  JSONObject json = new JSONObject();
                  
                  while(rs2.next())
                  {
                   json.put("user_id", rs2.getString("user_id"));
                   json.put("firstname", rs2.getString("firstname"));
                   json.put("lastname", rs2.getString("lastname"));
                   json.put("email", rs2.getString("email"));
                   json.put("age", rs2.getString("age"));
                   json.put("country", rs2.getString("country"));
                   
                    out.print(json);
                     
                     //out.flush();
                  }
                  
                  
              }
              
              %>
              <br><br><br>
              
              <%
              
              
               if(request.getParameter("user_id")!=null && request.getParameter("user_id")!="")
              {
                  String userid=request.getParameter("user_id");
                  
                   Class.forName("com.mysql.jdbc.Driver");
        
                   Connection con2=DriverManager.getConnection("jdbc:mysql://localhost/practice","root","");
                   
                   String qr="select * from user left join userr on user.user_id=userr.contact_id where user_id='"+userid+"' ";
                  
                   PreparedStatement statement1 = con2.prepareStatement(qr);
        
                   ResultSet rs2 = statement1.executeQuery();
                     
                  JSONObject json = new JSONObject();
                  
                  while(rs2.next())
                  {
                   //json.put("user_id", rs2.getString("user_id"));
                   json.put("firstname", rs2.getString("firstname"));
                   json.put("lastname", rs2.getString("lastname"));
                   json.put("email", rs2.getString("email"));
                   json.put("age", rs2.getString("age"));
                   json.put("country", rs2.getString("country"));
                   json.put("mobile", rs2.getString("phone"));
                   json.put("comments", rs2.getString("comments"));
                   
                    out.print(json);
                     
                     //out.flush();
                  }
                  
                  
              }
                  %>
    </body>
</html>
