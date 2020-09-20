<%-- 
    Document   : Login
    Created on : Aug 17, 2020, 11:56:10 PM
    Author     : Bhatti
--%>

<%@page import="com.helper.Message"%>
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
    </head>
    <body>
        <%@include file="navbar.jsp" %>
        <div class="container " >

            <div class="row mt-5">
                <div class="col-md-6 offset-md-3 mt-2">
                    <div class="card shadow-lg">
                        <div class="card-header bg-primary text-center">
                            <span class="fa fa-user-plus fa-5x"></span>
                            <h4 class="card-text text-center  text-white"> Login Form</h4>
                        </div>
                        <%
                        Message m=(Message)session.getAttribute("msg");
                        if(m!=null)
                        {
                         %> 
                           <div class="alert <%=m.getCssclass()%>" role="alert">
                                <%=m.getContent()%>
                            </div>
                           <%
                        }
                        session.removeAttribute("msg");
                        %>
                      
                        <div class="card-body">
                            <form action="loginservlet" method="post" id="loginform">
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Email address</label>
                                    <input type="email" class="form-control" name="email" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email" required="">
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputPassword1">Password</label>
                                    <input type="password" class="form-control" name="password" id="exampleInputPassword1" placeholder="Password" required="">
                                </div>
                                <div class="form-group">
                                    <a href="Register.jsp"> Don't have account register here</a>
                                </div>
                                <div >
                                    <button type="submit" class="btn btn-success btn-block" >Submit</button>                              
                                </div>

                            </form>
                        </div>   
                    </div>

                </div>   

            </div>
        </div>
        <!-- jQuery first, then Popper.js, then Bootstrap JS -->
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>

    </body>
</html>
