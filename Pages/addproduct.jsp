<%-- 
    Document   : addproduct
    Created on : Aug 20, 2020, 10:58:39 AM
    Author     : Bhatti
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.helper.connectDB"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.List"%>
<%@page import="com.Pojo.Category"%>
<%@page import="com.Dao.CategoryDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
        <link rel="stylesheet" href="mystyle.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="https://fonts.googleapis.com/css2?family=Varela+Round&display=swap" rel="stylesheet">
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <title>product Form</title>
    </head>
    <body>
      <body>
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark text-uppercase" style="background: #1976d2!important;">
            <a class="navbar-brand" href="#">admin panel</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">

                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle active" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            User
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="#">view user</a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="#">Something else here</a>
                        </div>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle active" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            products
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="addproduct.jsp">add products</a>
                            <a class="dropdown-item" href="viewProducts.jsp">view products</a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="#">Something else here</a>
                        </div>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle active" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            categories
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="category_form.jsp">add category</a>
                            <a class="dropdown-item" href="#">view category</a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="#">Something else here</a>
                        </div>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle active" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            orders
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">

                            <a class="dropdown-item" href="#">view orders</a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="#">Something else here</a>
                        </div>
                    </li>

                </ul>
                <ul class="navbar-nav mr-right text-white">
                    <li class="nav-link active" data-toggle="#" data-target="#" style="cursor:pointer;" >user</li>
                    <a class=" nav-link active" href="logout.jsp"><li>logout</li></a>          
                </ul>
            </div>
        </nav>
        <div class="container">
            <div class="row mt-5">
                <div class="col-md-6 offset-md-3 col-sm-12 col-12">
                    <div class="card">
                      <div class="card-header text-white text-capitalize text-center bg-primary">
                          <h1>category form</h1>
                    </div>   
                         <div class="card-body">
                             <form action="productServlet" id="P_Form" method="post" enctype="multipart/form-data">
                                <div class="form-group">
                                    <label >product name</label>
                                    <input type="text" class="form-control" name="p_name" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter p_name" required="">
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputPassword1">category</label>
                                    <select class="form-control" name="c_id" >
                                        <%
                                        List<Category> list=CategoryDao.select();
                                        for(Category c:list)
                                        {
                                        %>
                                          
                                        <option value="<%=c.getC_id()%>" ><%=c.getC_name()%></option>
                                      <%
                                      
                                          }%>
                                          
                                    </select>
                                      
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputPassword1">product price</label>
                                    <input type="float" class="form-control" name="p_price" id="exampleInputPassword1" placeholder="p_price" required>
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputPassword1">product pic</label>
                                    <input type="file" class="form-control" name="p_pic" id="exampleInputPassword1" placeholder="c_description" required>
                                </div>
                                          
                                  <div class="form-group text-center" id="btn">
                                         <button type="submit" class="btn btn-outline-danger btn-lg">save</button>
                             
                                  </div>
                                          <div id="loader" class="form-group text-center" style="display: none;">
                                              <i class="fa fa-refresh fa-5x fa-spin"> </i>
                                          </div>
                            </form>
                    </div>
                    </div>
               </div>   
            </div>
        </div>
              
                                          
           <!-- Optional JavaScript -->
        <!-- jQuery first, then Popper.js, then Bootstrap JS -->
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
<script src="jquery.js"></script>
         <script>
            $("document").ready(function () {
                $("#P_Form").submit(function (event) {
                    event.preventDefault();
                    //var data=$("#Rform").serialize(); without pic
                    let form = new FormData(this); // with pic
                    $("#loader").show();
                    $("#btn").hide();
                    $.ajax({
                        url: "productServlet",
                        type: 'POST',
                        data: form,
                        success: function (data) {
                            swal("Good job!", "data saved " + data, "success");
                            $("#loader").hide();
                            $("#btn").show();
                            },
                        error: function (data) {
                            swal("oh no!", "something went wrong " + data, "failure");
                            $("#loader").hide();
                            $("#btn").show();
                        },
                        processData: false,
                        contentType: false
                    });
                });
            });

        </script>
    </body>
</html>
