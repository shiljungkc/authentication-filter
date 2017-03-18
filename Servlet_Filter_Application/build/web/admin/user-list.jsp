<%-- 
    Document   : project-list
    Created on : Mar 17, 2017, 7:57:07 PM
    Author     : User
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<c:set var="SITE_URL" value="${pageContext.request.contextPath}"></c:set>
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


            <!--====================jquery CDN =======================-->


            <script src="https://code.jquery.com/jquery-3.2.0.min.js"
                    integrity="sha256-JAW99MJVpJBGcbzEuXk4Az05s/XyDdBomFqNlM3ic+I="
                    crossorigin="anonymous">
            </script>




        </head>
        <body>



            <!--===================== Display user Templates=======================-->
            <div class="container-fluid" style="max-width:600px;padding:20px">

                <div class="bs-callout bs-callout-warning" style="border-left:solid 5px orange;padding-left:10px;" id="callout-tables-responsive-overflow">
                    <h4>Users List</h4>
                    <p>
                        list of the users that can access the admin panel
                    </p>
                </div>
                <a href="${SITE_URL}/admin/logout"><button type="button" style="margin:20px 0px;height:35px" class="btn btn-primary btn-sm btn-info active">LogOut</button></a></h4>
        <button type="button" id="addUserBtn" class="btn btn-default" aria-label="Left Align">
            <span class="glyphicon glyphicon-plus" aria-hidden="true"> AddUser</span>
        </button>
        <table style="border:solid 1px orange" class="table table-striped table-hover table-responsive">

            <tr>
                <th>
                    Users:
                </th>
                <th>
                    UserName:
                </th>
                <th>
                    Password:
                </th>
                <th>
                    Status:
                </th>
                <th colspan="2" style="text-align:center">
                    Operation
                </th>

            </tr>

            <c:forEach var="users" items="${userList}">

                <tr>
                    <td>     <button type="button" class="btn btn-default" aria-label="Left Align">
                            <span class="glyphicon glyphicon-user" aria-hidden="true"></span>
                        </button>
                    </td>
                    <td>${users.userName}</td>
                    <td>${users.password}</td>
                    <td>${users.status}</td>
                    <td>
                        <a href="${SITE_URL}/admin/delete?un=${users.userName}">
                            <button type="button" class="btn btn-default" aria-label="Left Align">
                                <span class="glyphicon glyphicon-trash" style="color:red" aria-hidden="true"></span>
                            </button>
                        </a>
                    </td>
                    <td>
                        <button style="max-width:500px" type="button" class="btn btn-default" aria-label="Left Align">
                            <span class="glyphicon glyphicon-pencil" style="max-width:500px" aria-hidden="true"> Edit</span>
                        </button>
                    </td>
                </tr>

            </c:forEach>


        </table>


    </div>
    <!--===================== end of display user Templates================-->

    <!--=========================start of Model Window ========================-->

    <!-- Modal -->
    <form name="add-user-form" action="${SITE_URL}/admin/addUser" method="POST">
    <div>
        <div style="position:fixed;top:0px;left:400px" class="modal-dialog" role="document" id="modelWindow">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close" id="close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">ADD USERS</h4>
                </div>
                <div class="modal-body">

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
                                <input type="checkbox" id="status" name="status"> Status
                            </label>
                        </div>

                 


                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" id="close" >Close</button>
                    <button type="submit" class="btn btn-primary" id="insertUserBtn">Add</button>
                </div>
            </div>
        </div>
    </div>
       </form>

    <script>

        $(document).ready(function () {

            $("#close").on("click", function () {
                $("#modelWindow").hide();

            });
            

            $("#modelWindow").hide();
            $("#addUserBtn").on("click", function () {

                $("#modelWindow").show();

            });

        });

    </script>

    <!--==========================end of the Model Window=====================-->


</body>
</html>
