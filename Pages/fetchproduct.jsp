<%-- 
    Document   : fetchproduct
    Created on : Aug 20, 2020, 2:08:35 PM
    Author     : Bhatti
--%>

<%@page import="java.util.List"%>
<%@page import="com.Dao.ProductDao"%>
<%@page import="com.Pojo.Product"%>
<div class="row mt-3">
    <%    
        try
        {
           Thread.sleep(1500);  
        }
        catch(Exception e)
        {
            
        }
       
        int cid = Integer.parseInt(request.getParameter("cid"));
        List<Product> list = null;
        if (cid == 0) {
            list = ProductDao.select();
        } else if (cid > 0) {
            list = ProductDao.select(cid);
        }
        for (Product p : list) {

    %>
  
    <div class="card my-3 mx-3" style="width: 18rem;">
        <div class="card-header bg-primary">
            <h5 class="text-center  text-uppercase text-white">Product ID : <%=p.getP_id()%> </h5> 
        </div>
      
        <img class="card-img-top" src="img/<%=p.getP_pic()%>" alt="Card image cap">
        <div class="card-body">
            <b class="card-title font-weight-bold">Product name : <%=p.getP_pname()%></b>
            <p class="card-text font-weight-bold">Product price : <%=p.getP_price()%> </p>
        </div>
        <div class="card-footer ">
            <a href="cartServlet?id=<%=p.getP_id()%>" class="btn btn-outline-success fa fa-shopping-cart fa-lg btn-lg" > add to cart</a>
        </div>
    </div>
        
    <%
        }
    %>

</div>