<%-- 
    Document   : login
    Created on : Mar 17, 2017, 7:54:05 PM
    Author     : User
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>



        <link href="../assests/libs/css/bootstrap.css" rel="stylesheet" type="text/css"/>

        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

        <!-- Optional theme -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

        <!-- Latest compiled and minified JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>


    </head>
    <body style="padding-top:100px">
        <c:set var="STIE_URL" value="${pageContext.request.contextPath}"></c:set>
        <c:if test="${param.error!=null}">
            <div class="alert alert-warning alert-dismissible fade in" role="alert">
                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button> 
                <strong>Invalid </strong>
                Check User Name Or Password. 
            </div>     
        </c:if>
        <c:if test="${param.inactive!=null}">
           <div class="alert alert-warning alert-dismissible fade in" role="alert">
                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button> 
               User Inactive Report to Your Admin
            </div>  
        </c:if>
        


<div class=" container-fluid login-form-wrapper" style="max-width:600px" >
        <form method="POST" action="${pageContext.request.contextPath}/admin/login">
            <div class="form-group">
                <label for="userName">Email address</label>
                <input type="text" name="userName" class="form-control" id="userName" placeholder="User Name">
            </div>
            <div class="form-group">
                <label for="exampleInputPassword1">Password</label>
                <input type="password" name="password" class="form-control" id="password" placeholder="Password">
            </div>
            
            <div class="checkbox">
                <label>
                    <input type="checkbox" id="rememberMe" name="rememberMe"> Remember Me
                </label>
            </div>
            <button type="submit" class="btn btn-default">Login</button>
        </form>
            
 </div>




 
    </body>
</html>
