<%-- 
    Document   : productpage
    Created on : Aug 19, 2020, 11:32:55 PM
    Author     : Bhatti
--%>
<%@page import="java.util.List"%>
<%@page import="com.Dao.CategoryDao"%>
<%@page import="com.Pojo.Category"%>
<%@page errorPage="500_Error_Page.jsp" %>
<%
    User u = (User) session.getAttribute("user");
%>
<%@page import="com.Pojo.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
        <link rel="stylesheet" href="mystyle.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="https://fonts.googleapis.com/css2?family=Varela+Round&display=swap" rel="stylesheet">
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <title>product Page</title>
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-light navbg">
            <div class="container">

                <a class="navbar-brand  text-white" href="#" ></span>   EShop <span class="fa fa-heart fa-lg"></a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse " id="navbarSupportedContent">
                    <ul class="navbar-nav mr-auto ">
                         <li class="nav-item">
                            <a class="nav-link active  text-white" href="ShowCarts.jsp"><span class="fa fa-shopping-cart fa-lg">   View Carts</a>
                        </li>
                    </ul>
                    <ul class="navbar-nav mr-right text-white">
                        <li class="nav-link active text-white" data-toggle="modal" data-target="#profileModal"style="cursor:pointer;" >     <i> <%= u.getName()%></i></li>
                        <a class=" nav-link active text-white" href="logout"><li>logout</li></a>          
                    </ul>
                </div>

            </div>
        </nav>

        <div class="container ">
            <div class="row mt-5">
                <div class="col-md-3">
                    <ul class="list-group">
                        <a href="#" class="list-group-item list-group-item-action bg-primary text-center text-white">Category</a>

                        <%
                            List<Category> list = CategoryDao.select();
                            for (Category c : list) {
                        %>
                        <a href="#" class="list-group-item list-group-item-action" onclick="fetchByCat(<%=c.getC_id()%>)"> <%=c.getC_name()%></a>

                        <%

                            }%>
                    </ul>
                </div>
                    <div class="col-md-9" id="data" style="display: none;">
                   
                </div>
                <div class="col-md-9 text-center" id="loader" style="display: none;">
                    <i class="fa fa-refresh fa-lg fa-5x fa-spin"></i>
                </div>
            </div>
        </div>
        <!-- Modal -->
        <div class="modal fade" id="profileModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header colorj text-white">
                        <h5 class="modal-title text-uppercase" id="exampleModalLabel">my blog</h5>  
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body ">
                        <div class="container text-center">
                            <img src="img/<%=u.getPic()%>" style="max-width:100px; border-radius:50% ;">
                            <h5 class="modal-title text-uppercase " id="exampleModalLabel"><%= u.getName()%></h5>
                            <!--details-->
                            <div class="details" id="profile-details">
                                <table class="table">
                                    <tbody class="text-uppercase">
                                        <tr>
                                            <th scope="row" >ID</th>
                                            <td><%= u.getId()%></td>

                                        </tr>
                                        <tr>
                                            <th scope="row">Email</th>
                                            <td><%= u.getEmail()%></td>

                                        </tr>
                                        <tr>
                                            <th scope="row">password</th>
                                            <td><%= u.getPassword()%></td>

                                        </tr>
                                        <tr>
                                            <th scope="row">About</th>
                                            <td><%= u.getAbout()%></td>

                                        </tr>
                                        <tr>
                                            <th scope="row">register on</th>
                                            <td><%= u.getTime()%></td>

                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <!-- editd etails-->
                            <div class="container mt-2" id="edit-profile" style="display:none;">
                                <h5 class="display-5p">Edit carefully </h5>
                                <form action="editservlet" method="post" enctype="multipart/form-data">
                                    <table class="table">
                                        <tr>
                                            <td>
                                                ID    
                                            </td>
                                            <td><%= u.getId()%><td>

                                        </tr>
                                        <tr>
                                            <td>
                                                Email    
                                            </td>
                                            <td><input type="email" class="form-control" name="user_email" value="<%= u.getEmail()%>"></td>
                                        </tr>
                                        <tr>
                                            <td>
                                                Name    
                                            </td>
                                            <td><input type="text" class="form-control" name="user_Name" value="<%= u.getName()%>"></td>
                                        </tr>
                                        <tr>
                                            <td>
                                                Password    
                                            </td>
                                            <td><input type="password" class="form-control"  name="user_password" value="<%= u.getPassword()%>"></td>
                                        </tr>
                                        <tr>
                                            <td>
                                                Image    
                                            </td>
                                            <td><input type="file" class="form-control"  name="user_image" ></td>
                                        </tr>
                                        <tr>
                                            <td>
                                                About   
                                            </td>
                                            <td><textarea type="text" rows="3" class="form-control"  name="user_about"  ><%= u.getAbout()%></textarea></td>
                                        </tr>
                                        <tr>
                                            <td>
                                                save  
                                            </td>
                                            <td><input type="submit" class="form-control"   ></td>
                                        </tr>
                                    </table>
                                </form>
                            </div>
                        </div>

                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-primary text-capitalize" id="mytoggler">edit profile</button>
                    </div>
                </div>
            </div>
        </div>
        <!-- modal ended-->
        <!-- Optional JavaScript -->
        <!-- jQuery first, then Popper.js, then Bootstrap JS -->
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
        <script src="jquery.js"></script>
        <script>

                                                   let dped = false;

                                                   $(document).ready(function (e) {
                                                       fetchByCat(0);
                                                       $("#mytoggler").click(function () {
                                                           if (dped == false)
                                                           {
                                                               $("#profile-details").hide();
                                                               $("#edit-profile").show();
                                                               dped = true;
                                                               $("#mytoggler").text("see profile")
                                                           } else
                                                           {
                                                               $("#profile-details").show();
                                                               $("#edit-profile").hide();
                                                               dped = false;
                                                               $("#mytoggler").text("edit profile")
                                                           }

                                                       });
                                                   });
                                                   function fetchByCat(id)
                                                   {
                                                        $("#data").hide(); 
                                                       $("#loader").show();
                                                      
                                                       $.ajax(
                                                               {
                                                                   url: "fetchproduct.jsp",
                                                                   data: {cid: id},
                                                                   success: function (data, status, xhr) {
                                                                       $("#loader").hide(); 
                                                                       $("#data").html(data); 
                                                                       $("#data").show();
                                                                 }
                                                               });
                                                   }

        </script>
    </body>
</html>
