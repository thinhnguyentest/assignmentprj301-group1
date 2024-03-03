<%-- 
    Document   : admin
    Created on : 29-02-2024, 10:00:51
    Author     : tuanngp
--%>

<%@ page isELIgnored ="false" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Trang quản lý admin</title>
        <!-- Bổ sung các tệp CSS và JavaScript ở đây -->
        <link rel="stylesheet" href="account_assets/css/admin.css"/>
    </head>
    <body>
        <header>
            <h1 style="margin: 12px"><a href="admin" style="text-decoration: none;color: #fff;font-weight: bold;transition: color 0.3s ease;">Quản lý admin</a></h1>
            <nav>
                <ul>
                    <li><a href="#users">Người dùng</a></li>
                    <li><a href="#books">Sách</a></li>
                    <li><a href="#transactions">Giao dịch</a></li>
                </ul>
            </nav>
            <p style="color: red; padding: 12px 0">${requestScope.statusAdmin}</p>
        </header>



        <!--Quan li user-->    
        <jsp:include page="adminUser.jsp"></jsp:include>
            <!--end-->

            <!--Quan li sach-->
        <jsp:include page="adminBook.jsp"></jsp:include>
        <!--end-->

        <section id="transactions">
            <h2>Quản lý Giao dịch</h2>
            <!-- Đặt bảng hoặc danh sách giao dịch ở đây -->
        </section>

        <footer>
            <p>&copy; 2024 Trang web bán sách</p>   
        </footer>

    </body>
</html>

