<%-- 
    Document   : fetchOrder
    Created on : Aug 28, 2020, 7:45:23 AM
    Author     : Bhatti
--%>
  <%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.Dao.OrderDao"%>
<%@page import="com.Pojo.Order"%>
<%@page import="java.util.List"%>
<%
   
SimpleDateFormat sdf=new  SimpleDateFormat("dd-M-yyyy hh:mm:ss");
  %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
                <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
    </head>
    <body>
        <table class="table">
                <thead class="thead-dark">
                    <tr>
                        <th scope="col">Id</th>
                        <th scope="col">User_id</th>
                        <th scope="col">User_Name</th>
                        <th scope="col">Product_Id</th>
                        <th scope="col">price</th>
                        <th scope="col">Quantity</th>
                        <th scope="col">Time</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                   List<Order> list=OrderDao.select(); 
                       
                      
                    for( Order o: list)
                      
                    {
                    %>
                      <tr>
                     <td scope="row"><%=o.getO_id()%></td>
                     <td><%=o.getUser_id()%></td>
                     <td><%=o.getUser_name()%></td>
                     <td><%=o.getP_id()%></td>
                     <td><%=o.getPrice()%></td>
                     <td><%=o.getQuantity()%></td>
                     <td><%=sdf.format(o.getTime())%></td>
                   </tr>
                    <%
                        }
                    %>
                  
           
                </tbody>
            </table>

    </body>
</html>
