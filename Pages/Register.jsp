<%-- 
    Document   : Register
    Created on : Aug 17, 2020, 11:31:28 PM
    Author     : Bhatti
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
        <link rel="stylesheet" href="mystyle.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="https://fonts.googleapis.com/css2?family=Varela+Round&display=swap" rel="stylesheet">

    <body style="background-image: linear-gradient(-225deg, #69EACB 0%, #EACCF8 48%, #6654F1 100%);" >
        <!--    navbar start....    -->
        <%@include file="navbar.jsp" %>
        <!--    navbar end....    -->

        <div class="container mt-2" >
            <div class="row">
                <div class="col-md-6  offset-md-3">
                    <div class="card shadow-lg">
                        <div class="card-header text-center bg-primary text-white">
                            <h2>Registration</h2>
                        </div>
                        <div class="card-body ">

                            <form action="registerServlet" method="post" id="Rform" enctype="multipart/form-data">
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Name</label>
                                    <input type="text" name="name" class="form-control" required>
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Email address</label>
                                    <input type="email" name="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" required>
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputPassword1">Password</label>
                                    <input type="password" name="password" class="form-control" id="exampleInputPassword1" required>
                                </div>
                                <div class="form-group">
                                    <label for="Gender">Gender</label>
                                    <br>
                                    <input type="radio" name="Gender"    id="Gender" value="Male" required>Male
                                    <input type="radio" name="Gender"   id="Gender"value="Female" required>FeMale
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputPassword1">About</label>
                                    <textarea type="text" name="about" class="form-control" id="exampleInputPassword1" rows="5" required></textarea>
                                </div>
                                <div class="form-group ">
                                    <input type="file" class="form-control-file " name="pic"/>
                                </div>
                                <div class="form-group form-check">
                                    <input type="checkbox" class="form-check-input" name="terms" id="exampleCheck1" required>
                                    <label class="form-check-label"   for="exampleCheck1">Check me out</label>
                                </div>
                                <div class="form-group">
                                    <a href="Login.jsp"> Already have an account</a>
                                </div>
                                <div class="text-center">
                                    <div id="loader" style="display: none;">
                                        <i class="fa fa-refresh  fa-5x fa-spin"></i>
                                    </div>
                                    <div id="btn">
                                        <button type="submit" class="btn btn-danger   btn-lg text-center">Submit</button>   
                                    </div>

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
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
        <script src="jquery.js"></script>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <script>
            $("document").ready(function () {
                $("#Rform").submit(function (event) {
                    event.preventDefault();
                    //var data=$("#Rform").serialize(); without pic
                    let form = new FormData(this); // with pic
                    $("#loader").show();
                    $("#btn").hide();
                    $.ajax({
                        url: "registerServlet",
                        type: 'POST',
                        data: form,
                        success: function (data1) {
                            swal("Good job!", "data saved " + data1, "success");
                            $("#loader").hide();
                            $("#btn").show();
                        },
                        error: function (data1) {
                            swal("oh no!", "something went wrong " + data1, "failure");
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
</head>
<body>
</body>
</html>
