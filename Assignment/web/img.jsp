<%-- 
    Document   : img
    Created on : Mar 4, 2024, 6:10:17 PM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            .img{
                width: 100%;
                height: 400px; /* Đặt chiều cao mới ở đây, bạn có thể điều chỉnh giá trị theo ý muốn */
                object-fit: cover; /* Đảm bảo tỷ lệ khung hình được duy trì */
                margin-top: 50px;
            }
        </style>
    </head>
    <body>
        <img src="https://static1.thetravelimages.com/wordpress/wp-content/uploads/2019/11/Argosy-Cropped.jpg" class="img"/>
    </body>
</html>
