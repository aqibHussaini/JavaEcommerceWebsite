<%@page import="com.Dao.ProductDao"%>
<%@page import="com.Pojo.Product"%>
<%@page import="java.util.List"%>

<!doctype html>
<html lang="en">
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
        <link rel="stylesheet" href="mystyle.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="https://fonts.googleapis.com/css2?family=Varela+Round&display=swap" rel="stylesheet">
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <title>Home Page,</title>
        
    </head>
    <body>

        <!--    navbar start ... -->
        <%@include file="navbar.jsp" %>
        <!--    navbar end ... -->

        <header class="header ">
            <div class="container h-100 ">
                <div class="row text-center  h-100 align-items-center" >
                    <div class="col-md-12 col-12 col-sm-12">
                        <h1 class="display-2">welcome to eshopping</h1>
                        <p>Ecommerce, also known as electronic commerce or internet commerce, refers to the buying and selling of goods or services using the internet, and the transfer of money and data to execute these transactions. Ecommerce is often used to refer to the sale of physical products online, but it can also describe any kind of commercial transaction that is facilitated through the internet.</p>
                        <button class="btn  text-white btn-lg btn-bg">Register</button>
                        <button class="btn  text-white btn-lg btn-bg">Login</button>
                    </div>
                </div>
            </div>
        </header>
        <section>
            <div class="container mt-2  pt-5">
                <h3 class="text-center ">Recent products</h3>
                <hr class="w-25 mx-auto"/>
                <div class="row mt-2">
                   <%
                   List<Product>  latestlist=ProductDao.getLatestProduct();  
                   for(Product p:latestlist)
                   {
                   %>
                     <div class="col-md-4 col-12">
                        <div class="card" >
                            <img class="card-img-top " src="img/<%=p.getP_pic()%>" height="300px" width="200px" alt="Card image cap">
                            <div class="card-body text-center navbg text-white">
                                <h5 class="card-title">Product ID : <%=p.getP_id()%></h5>
                                <p class="card-text">Product Name  : <%=p.getP_pname()%></p>
                                <p class="card-text">Product Price  : <%=p.getP_price()%></p>
                            </div>
                        </div>
                    </div> 
                   <%
                    }
                   %>
                  
                </div>

            </div>
        </section>
        <section class="container  mt-2 pt-5">
            <h3 class="text-center text-capitalize">about us</h3>
            <hr class="w-25 mx-auto"/>
            <div class="row mb-5">
                <div class="col-md-6 col-lg-6 col-12">
                    <img src="https://images.pexels.com/photos/1024864/pexels-photo-1024864.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940" class="img-fluid">
                </div>   
                <div class="col-md-6 col-lg-6 col-12" >
                    <h1>Who Am I?</h1>
                    <hr>
                    <p>
                        Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. 
                    </p>
                    <button class="btn btn-outline-primary">About Us</button>
                </div>   
            </div>
        </section>
        <section class="container">
            <div class="jumbotron jumbotron-fluid navbg text-white text-center">
                <div class="container">
                    <h1 class="display-2s">This is footer</h1>
                    <p class="lead">This is a modified jumbotron that occupies the entire horizontal space of its parent.</p>
                    <a href="https://google.com" class="font-weight-bold text-white">Google</a><br>
                    <a href="https://facebook.com" class="font-weight-bold  text-white ">Facebook</a><br>
                    <a href="http://tectnology.unaux.com" class="font-weight-bold  text-white ">Aqib bhatti's website</a><br>
                    <a href="https://aqibhussaini.github.io/mywebsite.github.io/" class="font-weight-bold  text-white ">Aqib bhatti's Web template</a><br>
                    <a href="https://aqibhussaini.github.io/mycoronaData.github.io/" class="font-weight-bold  text-white ">Aqib bhatti's Corona Data App</a><br>
                    
                </div>
            </div>
        </section>
        <!-- Optional JavaScript -->
        <!-- jQuery first, then Popper.js, then Bootstrap JS -->
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
    </body>
</html>