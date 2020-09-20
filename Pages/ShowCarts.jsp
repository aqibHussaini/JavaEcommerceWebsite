<%-- 
    Document   : ShowCarts
    Created on : Aug 21, 2020, 4:09:35 PM
    Author     : Bhatti
--%>

<%@page import="java.util.List"%>
<%@page import="com.Pojo.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page errorPage="500_Error_Page.jsp" %>
<%
    User u = (User) session.getAttribute("user");
    List<Order> cart = (List<Order>) session.getAttribute("cart" + u.getId());
    float sum = 0.0f;
%>
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
        <title>Cart Items</title>
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-light navbg">
            <div class="container">

                <a class="navbar-brand  text-white" href="Home.jsp" ><span class="fa fa-home"></span>   Home</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse " id="navbarSupportedContent">
                    <ul class="navbar-nav mr-auto ">
                        <li class="nav-item active">
                            <a class="nav-link active  text-white" href="Register.jsp"><span class="fa fa fa-user fa-lg"></span>    Registration <span class="sr-only">(current)</span></a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link active  text-white" href="Login.jsp"><span class="fa fa-sign-in fa-lg"></span>    Login</a>

                        </li>

                        <li class="nav-item">
                            <a class="nav-link active  text-white" href="ShowCarts.jsp"><span class="fa fa-info-circle fa-lg">   View Carts</a>
                        </li>
                    </ul>
                    <ul class="navbar-nav mr-right text-white">
                        <li class="nav-link active text-white" data-toggle="modal" data-target="#profileModal"style="cursor:pointer;" >     <i> <%= u.getName()%></i></li>
                        <a class=" nav-link active text-white" href="logout"><li>logout</li></a>          
                    </ul>
                </div>

            </div>
        </nav>
        <div id="container " >

            <div id="data">

            </div> 
        </div>
        <div id="loader" class="container-fluid text-center" style="display: none;">
            <div  class="fa fa-refresh fa-5x fa-lg fa-spin" style="margin-top: 280px;">

            </div>
        </div>

        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
        <script src="jquery.js"></script>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <script>
            function getCartData()
            {
                $("#loader").show();
                $("#data").hide();
                $.ajax({
                    url: "fetchCart.jsp",
                    type: 'get',
                    success: function (data, textStatus, jqXHR) {
                        $("#data").html(data);
                        $("#loader").hide();
                        $("#data").show();
                    },
                    error: function (jqXHR, textStatus, errorThrown) {

                    }

                })
            }
            $(document).ready(function () {
                getCartData();
            });
            function add(id)
            {
                $.ajax({
                    url: "maintainCart",
                    data: {id: id, do: "add"},
                    type: 'get',
                    success: function (data, textStatus, jqXHR) {
                        swal("Good job!", data, "success");
                        getCartData();
                    },
                    error: function (jqXHR, textStatus, errorThrown) {

                    }

                })
            }
            function sub(id)
            {
                $.ajax({
                    url: "maintainCart",
                    data: {id: id, do: "sub"},
                    type: 'get',
                    success: function (data, textStatus, jqXHR) {
                        swal("Good job!", data, "success");
                        getCartData();
                    },
                    error: function (jqXHR, textStatus, errorThrown) {

                    }

                })
            }
            function remove(id)
            {
                $.ajax({
                    url: "maintainCart",
                    data: {id: id, do: "remove"},
                    type: 'get',
                    success: function (data, textStatus, jqXHR) {
                        swal("Good job!", data, "success");
                        getCartData();
                    },
                    error: function (jqXHR, textStatus, errorThrown) {

                    }

                })
            }

        </script>
    </body>
</html>
