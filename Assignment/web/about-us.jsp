<%-- 
    Document   : about-us
    Created on : Feb 28, 2024, 3:16:37 PM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Giới thiệu Gác Xép Bookstore</title>
        <style>
            .conten-about-us{
                margin-top: 70px;
                padding-left: 8px;
                padding-right: 8px;
                box-sizing: border-box;
            }

            .text-heading {
                font-family: "Product Sans";
                font-size: 15px;
                line-height: 1.8;
                color: #252525; /* Thêm màu chữ mong muốn */
            }

            .text-heading h1 {
                font-size: 28px; /* Thêm kích thước chữ mong muốn */
                padding-left: 20px;
                font-size: 35px;
                font-weight: 400;
            }


            .read-more{
                font-weight: 550;
                cursor: pointer;
            }
        </style>
    </head>
    <body>
        <jsp:include page="header.jsp"></jsp:include>
        <jsp:include page="img.jsp"></jsp:include>
            <div class="conten-about-us">

                <div class="text-heading">
                    <h1>Giới thiệu</h1>
                    <p>Tiệm sách ngoại văn này là ý tưởng của hội bạn gái 3 đứa chúng mình từ những năm đầu Đại Học. Cái tên Gác Xép khởi nguồn từ căn xép nhỏ trên phố Lò Đúc nhà mình nơi những cuốn sách đầu tiên của tiệm được cất giữ. Trải qua gần 6 năm, Xép đã có một chỗ đứng nhất định trong lòng các bạn yêu sách, là địa chỉ uy tín được các bạn nhớ đến khi có nhu cầu mua sách ngoại văn. Để đáp lại sự yêu quý và ủng hộ của các bạn, bọn mình luôn cố gắng đa dạng và làm mới kho sách mỗi ngày. 


                    <p>Hiện tại Xép có 2 dịch vụ chính:</p>
                    <p>1. Sách có sẵn: Bọn mình bán cả sách mới và cũ, giao hàng toàn quốc, free ship với đơn trên 500,000đ. Các bạn có thể đặt sách qua website hoặc fanpage. Ngoài ra, nếu có nhu cầu xem sách trực tiếp hoặc lấy sách từ kho Đặng Thai Mai, vui lòng hẹn trước. </p>
                    <p>2. Order sách theo yêu cầu: Xép nhận đặt sách, CD, artbook và photobook  (cả used và new, các loại binding khác nhau và edition hiếm, ngôn ngữ Anh - Nhật - Hàn - Pháp - Đức). Các bạn vui lòng inbox để được báo giá. Sách về sau 3-4 tuần và cần đặt cọc 50% giá trị hàng. </p>

                    <p> 
                        <span class="introduce">Đọc thêm</span>
                        <span class="read-more"> review về Gác Xép</span>
                    </p>

                    <p>
                        <span class="introduce">Đọc thêm về</span>
                        <span class="read-more"> binding/format của sách: bìa cứng, bìa mềm, khổ nhỏ</span>
                    </p>

                    <p>
                        <span class="introduce">Đọc thêm về</span>
                        <span class="read-more">  binding/format của sách: bìa cứng, bìa mềm, khổ nhỏ</span>
                    </p>

                    <p>
                        <span class="introduce">Follow instagram để thỉnh thoảng nghe mấy điều nhảm nhí: </span>
                        <span class="read-more">@gacxeptiem</span>
                    </p>
                </div>
            </div>
        <jsp:include page="footer.jsp" ></jsp:include>
    </body>
</html>