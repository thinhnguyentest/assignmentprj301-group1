<%-- 
    Document   : contact
    Created on : Mar 4, 2024, 6:21:17 PM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Contact Gác Xép</title>
        <link rel="stylesheet" href="accset/fonts/fontawesome-free-6.5.1-web/css/all.css"/>
        <style>
            #content-contact{
                margin-top: 70px;
            }

            #content-contact .text{
                font-family: "Product Sans";
                cursor: pointer;
                color: #363636;
                font-weight: 300;
                line-height: 1.6;
            }



            #content-contact .li-footer{
                font-size: 14px;
                position: relative;
                color: #363636;
                opacity: 1;
                margin-bottom: 10px !important;
                line-height: 20px;

            }


            .title-head-contact{
                color: #252525;
                font-size: 18px !important;
                font-family: "Product Sans";
                font-weight: 400;
                text-transform: none;
                position: relative;
                display: block;
                margin: 0;
                padding-bottom: 10px;
                margin-top: 50px;
            }


            .info-contact{
                padding-left: 0;
                list-style: none outside;
            }

            .send input{
                display: block;
                padding: 0px 10px;
                background-color: #fff;
                margin: 0 0 10px;
                line-height: 1.5;
                min-height: 45px;
                background-image: none;
                border: 1px solid #ebebeb;
            }

            .send textarea{
                display: block;
                width: 100%;
                font-family: "Product Sans";
                line-height: 1.5;
                background-color: #fff;
                background-image: none;
                border: 1px solid #ebebeb;
            }


            .send input,
            .send textarea {
                width: 100%; /* Set the width to 100% */
                box-sizing: border-box; /* Include padding and border in the element's total width */
                margin-bottom: 10px; /* Add margin to separate the fields */
                padding: 0 10px;
            }
            .row{
                margin-right: -15px;
                margin-left: -15px;
            }

            .send-the-contact button {
                display: inline;
                padding: 0 25px;
                background: #498374;
                color: #fff;
                border-radius: 5px;
                font-size: 14px;
                font-family: "Product Sans";
                height: 50px;
                line-height: 50px;
                text-align: center;
                white-space: nowrap;
                outline: none !important;
                cursor: pointer; /* Áp dụng cursor cho toàn bộ nút */
                border: none;
            }

            .list-contact {
                display: flex;
            }
            .info-contact {
                width: 33%;
            }

            .send {
                width: 90%;
            }
            
            
          
            .gg-map {
                width: 67%;
                float: right;
                position: relative;
                /* padding-bottom: 45%; */
                margin-top: 65px;


            }
            .gg-map iframe {
                margin-top: -50px;
                position: absolute;
                top: 0;
                left: 0;
                width: 100%;
                height: 90%;
            }
            
            .send-the-contact{
                margin-top: 30px;
                margin-bottom: 50px;
            }
            

        </style>
    </head>
    
    <body>
       <jsp:include page="header.jsp"></jsp:include>
       <jsp:include page="img.jsp"></jsp:include>
            <div id = "content-contact">

                <div class="list-contact">
                    <ul class="info-contact">

                        <li class="li-footer"><i class="fa-solid fa-location-dot"><span class="text"> Address: Khu Đô Thị FPT Opening time: 1:30pm - 6pm (Mon - Fri), 9am - 6pm (Sat - Sun), Đà Nẵng</span></i></li>
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
        <jsp:include page="footer.jsp" ></jsp:include>
    </body>
</html>
