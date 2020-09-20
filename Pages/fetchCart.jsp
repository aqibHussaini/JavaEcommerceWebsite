
<%@page import="java.util.List"%>
<%@page import="com.Pojo.*"%>
<%
    User u = (User) session.getAttribute("user");
    List<Order> cart = (List<Order>) session.getAttribute("cart"+u.getId());
   float sum=0.0f;
   try
   {
       Thread.sleep(1000);
   }
   catch(Exception ex)
   {
       
   }
%>

  <div class="container mt-3">
            <table class="table border">
                <thead class="thead-dark">
                    <tr>
                        <th scope="col">#</th>
                        <th scope="col">product name</th>
                        <th scope="col">product quantity</th>
                        <th scope="col">product price</th>
                        <th scope="col">Increment</th>
                        <th scope="col">Decrement</th>
                        <th scope="col">Remove Item</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        for (Order o : cart) {
                    %>
                    <tr>
                        <th scope="row"><%=o.getP_id()%></th>
                        <td><%= o.getName()%></td>
                        <td><%= o.getQuantity()%></td>
                        <td><%= o.getPrice()* o.getQuantity()%></td>
                        <% sum=sum+o.getPrice()* o.getQuantity(); %>
                        <td><a class="btn btn-outline-success btn-lg fa fa-plus fa-lg fa-3x" onclick="add(<%=o.getP_id()%>)" ></a></td>
                        <td><a class="btn btn-outline-warning btn-lg fa fa-minus fa-lg fa-3x" onclick="sub(<%=o.getP_id()%>)"></a></td>
                        <td><a class="btn btn-outline-danger btn-lg fa fa-trash fa-lg fa-3x"  onclick="remove(<%=o.getP_id()%>)"  ></a></td>
                    </tr>  
                    <%
                        }
                    %>
                    <tr>
                        <td ><a href="checkout" class="font-weight-bold text-uppercase btn btn-outline-success">checkout</a></td>
                        <td class="font-weight-bold text-uppercase btn btn-outline-success">Total = <%= sum%></td>
                    <tr>
                </tbody>
            </table>
        </div>