<%-- 
    Document   : admin
    Created on : 29-02-2024, 10:00:51
    Author     : tuanngp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
            <h1>Quản lý admin</h1>
            <nav>
                <ul>
                    <li><a href="#users">Người dùng</a></li>
                    <li><a href="#books">Sách</a></li>
                    <li><a href="#transactions">Giao dịch</a></li>
                </ul>
            </nav>
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

