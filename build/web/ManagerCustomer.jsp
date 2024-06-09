<%-- 
    Document   : ManagerCustomer
    Created on : Feb 27, 2022, 10:49:45 PM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
       if (request.getSession().getAttribute("role_admin") == null) {
           response.sendRedirect("home");
       }
%>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Manager Product</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link href="css/ManagerProduct.css" rel="stylesheet" type="text/css"/>
        <link
            href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
            rel="stylesheet"
            />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/styles.css" rel="stylesheet" />
        <!-- Include DataTables CSS -->
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/2.0.1/css/dataTables.dataTables.min.css">
        <!-- Include DataTables JS -->
        <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/2.0.1/js/dataTables.min.js"></script>
        <style>
            body{
                font-size: medium;
            }
        </style>
        <script>
            function back() {
                window.location.href = "home";
            }

            window.onload = function () {
                var table = $('#myTable').DataTable();
                var jsonString = document.getElementById("accounts").value;
                console.log(jsonString);
                var accounts = JSON.parse(jsonString);
                for (var i = 0; i < accounts.length; i++) {
                    table.row.add([
                        accounts[i].uid,
                        accounts[i].user,
                        accounts[i].isSell,
                        accounts[i].active ? 'active' : 'blocked',
                        '<a href="loadAccount?pid=' + accounts[i].uid + '"  class="edit" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="Edit">&#xE254;</i></a>'
                    ]).draw();
                }
            };
        </script>

    <body>
        <%@include file="components/adminNavbarComponent.jsp" %>
        <div class="container">
            <div class="table-wrapper">
                <div class="table-title">
                    <div class="row">
                        <h2>Manage <b>Customer</b></h2>   
                    </div>
                </div>
                <input type="hidden" id="accounts" value='${requestScope.accounts}'/>
                <table id="myTable">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>User</th>
                            <th>IsSell</th>
                            <th>Active</th>
                            <th>Edit</th>
                        </tr>
                    </thead>
                    <tbody>

                    </tbody>
                </table>
            </div>
            <a href="#">
                <button type="button" class="btn btn-primary" onclick="back()">Back to home</button>


                </body>
                </html>
