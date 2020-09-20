<%-- 
    Document   : 404_Error_page
    Created on : Aug 27, 2020, 12:10:31 PM
    Author     : Bhatti
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page isErrorPage="true" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sorry something went wrong....</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
    </head>
    <body>
        <div class="container  mt-5 text-center">
            <img class="img-fluid" src="img/HTML-404-Page-Animated.png" >
            <div class="text-center">
                <h1 class="display-3">Page not Found....</h1>
                <p class="text-capitalize">Sorry something went wrong....</p>
                <p > <%= exception%></p>
                <a class="btn btn-danger" href="Home.jsp">Go Home</a>

            </div>
        </div>


    </body>
</html>
