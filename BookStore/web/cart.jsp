<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Shopping Cart</title>

        <link rel="stylesheet" href="assets/css/cart.css">

        <script>
            $(document).ready(function () {
                $(".quantity-btn").on("click", function () {
                    var quantityInput = $(this).siblings(".quantity");
                    var currentQuantity = parseInt(quantityInput.val());

                    if ($(this).hasClass("increase")) {
                        quantityInput.val(currentQuantity + 1);
                    } else if ($(this).hasClass("decrease") && currentQuantity > 1) {
                        quantityInput.val(currentQuantity - 1);
                    }

                    // Trigger the input event to update total immediately
                    quantityInput.trigger("input");
                });

                $(".quantity").on("input", function () {
                    updateTotal();
                });

                function updateTotal() {
                    var total = 0;
                    $(".quantity-container").each(function () {
                        var quantity = parseInt($(this).find(".quantity").val());
                        var price = parseFloat($(this).find(".quantity").data("price"));
                        total += quantity * price;
                    });
                    $(".total-price").text(total.toFixed(0) + " VND");
                }

                // Initial update when the page loads
                updateTotal();
            });

        </script>
    </head>
    <body>

        <div class="" > 
            <div class="row">
                <div class="col">
                    <jsp:include page="header.jsp"></jsp:include>
                    </div>
                </div>
                <div class="card ">
                    <div class="row">
                        <div class="col-md-8 cart">
                            <div class="title">
                                <div class="row">
                                    <div class="col"><h4><b>SHOPPING CART</b></h4></div>
                                    <div class="col align-self-center text-right text-muted">${sessionScope.cart.size()} items</div>
                            </div>
                        </div>

                        <c:forEach var="cartItem" items="${sessionScope.cart}">
                            <div class="row border-top border-bottom main align-items-center">
                                <div class="col-2">
                                    <img class="img-fluid" src="${cartItem.book.image}" width="100">
                                </div>
                                <div class="col-3">
                                    <div class="row text-muted">${cartItem.book.title}</div>

                                </div>
                                <div class="col-3 quantity-container">
                                    <button class="quantity-btn decrease" style="width: 30px;" >-</button>
                                    <input type="text" class="quantity" style="width: 30px; text-align: center;" value="${cartItem.quantity}" data-price="${cartItem.book.price}">
                                    <button  class="quantity-btn increase" style="width: 30px;">+</button>
                                </div>
                                <div class="col-2 total">
                                    ${cartItem.book.price} VND
                                </div>
                                <div class="col-2">
                                    <form action="${pageContext.request.contextPath}/cart">
                                        <input type="hidden" name="id" value="${cartItem.book.id}">
                                        <input type="hidden" name="action" value="remove">
                                        <button type="submit" class="remove-btn">Xóa</button>
                                    </form>
                                </div>
                            </div>
                        </c:forEach>


                        <div class="back-to-shop">
                            <a href="/product">&leftarrow;</a>
                            <span class="text-muted">Back to shop</span>
                        </div>
                    </div>

                    <div class="col-md-4 summary">
                        <div><h5><b>Summary</b></h5></div>
                        <hr>
                        <div class="row">
                            <div class="col" style="padding-left: 0;">ITEMS ${sessionScope.cart.size()}</div>
                            <div class="col text-right"> ${total }</div>
                        </div>

                        <form>
                            <!--                        <p>SHIPPING</p>
                                                    <select>
                                                        <option class="text-muted">Giao hàng tiêu chuẩn - 30000 VND</option>
                                                        <option class="text-muted">Giao hàng nhanh - 45000 VND</option>
                                                    </select>-->

                            <p>GIVE CODE</p>
                            <input id="code" placeholder="Enter your code">
                        </form>

                        <div class="row" style="border-top: 1px solid rgba(0,0,0,.1); padding: 2vh 0;">
                            <div class="col">TOTAL PRICE</div>
                            <div class="col text-right total-price">0 VND</div>
                        </div>

                        <a href="${pageContext.request.contextPath}/checkout" class="btn btn-primary">CHECKOUT</a>
                    </div>
                </div>
                <!-- Footer Content -->

            </div>

            <div class="row">
                <div class="col">
                    <jsp:include page="footer.jsp"></jsp:include>
                </div>
            </div>

        </div>
    </body>
</html>
