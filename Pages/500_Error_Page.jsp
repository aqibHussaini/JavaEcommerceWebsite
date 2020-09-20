<%-- 
    Document   : 500_Error_Page
    Created on : Aug 22, 2020, 12:49:43 PM
    Author     : Bhatti
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page isErrorPage="true"  %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sorry something went wrong....</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
    </head>
    <body>
        <div class="container jumbotron mt-5 bg-info">
            <img class="img-fluid" src="https://media.istockphoto.com/photos/redhead-woman-using-computer-laptop-at-home-stressed-with-hand-on-picture-id1041334030" >
            <div class="text-center">
                <h1 >Sorry something went wrong....</h1>
                <p > <%= exception%></p>
                <a class="btn btn-danger" href="Home.jsp">Go back</a>

            </div>
        </div>


    </body>
</html>
