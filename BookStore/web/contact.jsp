<%-- 
    Document   : contact
    Created on : Feb 28, 2024, 3:20:43 PM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Contact Gác Xếp Bookstore</title>
        <link rel="stylesheet" href="accset/style.css"/>
        <link rel="stylesheet" href="accset/fonts/fontawesome-free-6.5.1-web/css/all.css"/>
    </head>
    <body>
        <div id = "content-contact">

            <div class="list-contact">
                <ul class="info-contact">

                    <li class="li-footer"><i class="fa-solid fa-location-dot"><span class="text"> Address: Unit 302, 23C Tong Dan, Hoan Kiem, Hanoi Opening time: 1:30pm - 6pm (Mon - Fri), 9am - 6pm (Sat - Sun), Hà Nội</span></i></li>
                    <li class="li-footer"><i class="fa-solid fa-phone"><span class="text"> 0392115222</span></i></li>
                    <li class="li-footer"><i class="fa-solid fa-envelope"><span class="text"> tiemsachgacxep@gmail.com</span></i></li>

                    <h1 class="title-head-contact">Liên hệ</h1>
                    <div class="send">
                        <form action="" method="">
                            <input placeholder="Họ và tên" type="text" name="fullname" required/> <br>
                            <input placeholder="Email" type="text" name="email" required/> <br>
                            <textarea placeholder="Nội dung" name="comment" rows="5"></textarea>

                            <div class="send-the-contact">
                                <button type="submit">
                                    <span class="button-text">Gửi liên hệ</span>
                                </button>
                            </div>
                        </form>
                    </div>
                </ul>
                <div class="gg-map">
                    <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3835.8560693164577!2d108.25831637589107!3d15.968891042114784!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3142116949840599%3A0x365b35580f52e8d5!2sFPT%20University%20Danang!5e0!3m2!1sen!2s!4v1709069993399!5m2!1sen!2s" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
                </div>
            </div>
        </div>
    </body>
</html>
