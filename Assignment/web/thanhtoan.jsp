<%-- 
    Document   : thanhtoan
    Created on : Mar 1, 2024, 2:37:52 AM
    Author     : PC
--%>
<%@ page isELIgnored ="false" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>CheckOut</title>
        <link rel="stylesheet" href="assets/css/check.css"/>
        <link rel="stylesheet" href="accset/fonts/fontawesome-free-6.5.1-web/fontawesome-free-6.5.1-web/css/all.css"/>
    </head>
    <style>

        body {
            margin: 0;
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
            display: flex;
        }

        .container .container-thanhtoan,
        .container .container-type-pay,
        .container .container-cart {
            flex: 1;
            box-sizing: border-box;
            margin: 0 10px;
            background-color: #f5f5f5;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            padding: 20px;
            margin-top: 20px;
        }

        .container-thanhtoan {
            background-color: #f5f5f5;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .container-type-pay {
            margin-left: 50px;
            margin-top: 31px;
        }

        .container-cart {
            display: flex;
            justify-content: space-between;
            margin-top: 20px;
        }

        .order-details {
            border: 1px solid #ccc;
            padding: 10px;
            margin: 10px;
            border-radius: 8px;
        }

        .order-summary {

            padding: 10px;

            margin-left: 80px;
        }

        .order-summary h3 {
            border-bottom: none;
            padding-bottom: 0;
            margin-bottom: 10px;
        }

        .container-cart div {
            flex: 1;
        }

        h1, h2 {
            color: #333;
        }

        .phong-thuc {
            font-size: 18px;
            font-weight: bold;
            margin-bottom: 10px;
        }

        select {
            padding: 8px;
            margin-bottom: 10px;
        }

        input[type="text"],
        input[type="tel"] {
            padding: 8px;
            margin-bottom: 10px;
        }

        input[type="submit"] {
            padding: 10px;
            background-color: #007BFF;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #0056b3;
        }

        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
            margin: 0;
        }

        .container-thanhtoan {
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
            padding: 20px;
        }

        form {
            display: flex;
            flex-direction: column;
        }

        label {
            margin-bottom: 5px;
            font-weight: bold;
        }

        .section-title {
            font-size: 20px;
            font-family: Helvetica Neue, sans-serif !important;
        }

        .container-type-pay {
            background-color: #f5f5f5;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            padding: 20px;
            width: 33.33%;
            box-sizing: border-box;
        }

        .xac-nhan-thanh-toan {
            padding: 10px;
            background-color: #007BFF;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            width: 100%;
        }

        .xac-nhan-thanh-toan:hover {
            background-color: #0056b3;
        }



    </style>
    <body>

        <div class="container">
            <div class="container-thanhtoan">

                <form>
                    <p class="section-title"><i class="fa-solid fa-car-side"></i> Vận Chuyển</p>
                    <p class="section-title">Thông tin nhận hàng</p>
                    <!-- Tỉnh -->
                    <label for="tinh">Tỉnh:</label>
                    <input type="text" id="tinh" name="tinh" required>

                    <!-- Huyện -->
                    <label for="huyen">Huyện:</label>
                    <input type="text" id="huyen" name="huyen" required>

                    <!-- Xã -->
                    <label for="xa">Xã:</label>
                    <input type="text" id="xa" name="xa" required>

                    <label for="so-dien-thoai">SDT:</label>
                    <input type="tel" id="so-dien-thoai" name="so-dien-thoai" pattern="[0-9]{10,11}" required>

                    <label for="dia-chi-cu-the">Địa chỉ cụ thể:</label>
                    <input type="text" id="cu-the" name="cdia-chi-cu-the" required>
                </form>
            </div>





            <div class="container-type-pay">
                <p class="section-title"><i class="fa-brands fa-cc-paypal"></i> Thanh Toán</p>
               
                <select name="phuong-thuc-thanh-toan" id="phuong-thuc-thanh-toan-select" onchange="updatePaymentMethod()">
                    <option>Lựa Chọn</option>
                    <option value="Thanh toán khi nhận hàng">Thanh Toán Khi Nhận Hàng</option>
                    <option value="Chuyển Khoản Ngân Hàng">Chuyển Khoản Ngân Hàng</option>
                </select>
                <br> <br>
                <form action="checkout" method="post">
                    <input type="submit" value="Xác nhận thanh toán" class="xac-nhan-thanh-toan">
                </form>
                
            </div>



            <div class="container-cart">

                <c:forEach var="cart" items="${sessionScope.cart}">
                    <div class="order-details">

                        <p>Tên sách: ${cart.book.title}</p>
                        <p>Giá: ${cart.book.price}</p>
                        <p>Số lượng: ${cart.quantity}</p>
                        <p>Tạm tính: ${cart.book.price * cart.quantity}</p>
                    </div>
                </c:forEach>

                <div class="order-summary">
                    <h3 class="section-title"><i class="fa-solid fa-rectangle-list"></i> Tóm tắt đơn hàng</h3>
                      
                    <!-- Thêm ô Phí vận chuyển -->
                    <p>Phí vận chuyển: <input type="text" id="phi-van-chuyen"  name="phi-van-chuyen" /></p>
                    <!-- Thêm ô Tổng cộng -->
                    <p>Tổng cộng: <input type="text" id="tong-cong" name="tong-cong" required></p>
                </div>


            </div>

        </div>
        <script>
            function updatePaymentMethod() {
                var selectElement = document.getElementById("phuong-thuc-thanh-toan-select");
                var displayElement = document.getElementById("phuong-thuc-thanh-toan-display");
                displayElement.value = selectElement.value;
            }

            function voucherMedthod() {
                var selectElement = document.getElementById("select-voucher");
                var displayElement = document.getElementById("voucher-display");
                displayElement.value = selectElement.value;
            }
        </script>
    </body>
</html>
