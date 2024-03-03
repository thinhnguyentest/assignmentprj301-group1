<%-- 
    Document   : faq
    Created on : Feb 28, 2024, 3:28:56 PM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
<!--        <link rel="stylesheet" href="accset/style.css"/>-->
        <style>
            body {
                font-family: Arial, sans-serif;
                line-height: 1.6;
            }
        </style>
    </head>

    <body>
                <jsp:include page="header.jsp"></jsp:include>

        <div class="header">
            <h1 class = "faq">FAQ</h1>

            <div id = "content-faq">
                <h3 class = "general">1. How do I find a book?</h3>
                <p class = "content">You'll find results easily by typing a title, an author, an ISBN, a keyword or a tag that is relevant to what you are looking for (e.g. Travel, Japanese Literature, LGBT....) into the search bar at the top of our page. You can also browse the categories defined by Genres and Sub-genres, or narrow down results by using the filters (Price range, Format...).
                </p>
                <p> Happy browsing! </p>


                <h3 class = "general">2. How can I order books that are not available?</h3>
                <ul class = "used-book">
                    <li>If the books you need are not readily available, please send us a request on our Facebook page.</li>
                    <li>Send us the title and condition you are looking for and we will provide a quotation accordingly, which is valid for 2 days since the query.</li>
                    <li>You will be asked to make a deposit of 50% of the quotation value.</li>
                    <li>Once the books arrive, we will inform you and send to your shipping address.</li>
                </ul>

                <h3 class = "general">3. Does Gac Xep Bookstore have a storefront?</h3>
                <p class = "content">Yes! Visit us at 302, 23C Tong Dan street, Hoan Kiem, Hanoi. Contact our Facebook  for more information on opening hours. </p>


                <h3 class = "general">4. How do you define the used book's condition?</h3>

                <p>
                    <span class="condition new">* New:</span>
                    <span class="content">Just like it sounds. A brand-new, unused, unread copy in perfect condition.</span>
                </p>


                <p>
                    <span class="condition like-new">* Like New:</span>
                    <span class="content">An apparently unread copy in perfect condition. Dust cover is intact; pages are clean and are not marred by notes or folds of any kind.</span>
                </p>

                <p>
                    <span class="condition verygood">* Very Good:</span>
                    <span class = "content">A copy that has been read, but remains in excellent condition. Pages are intact and are not marred by notes or highlighting, but may contain a neat previous owner name. The spine remains undamaged.</span>
                </p>

                <p>
                    <span class="condition good">* Good:</span>
                    <span class = "content">A copy that has been read, but remains in clean condition. All pages are intact, and the cover is intact. The spine may show signs of wear. Pages can include limited notes and highlighting, and the copy can include "From the library of" labels or previous owner inscriptions.</span>
                </p>

                <p>
                    <span class="condition acceptable">* Acceptable:</span>
                    <span class = "content"> A readable copy. All pages are intact, and the cover is intact (the dust cover may be missing). Pages can include considerable notes--in pen or highlighter--but the notes cannot obscure the text.</span>
                </p>

                <h3 class ="general">5. How do I place an order?</h3>
                <p class = "content">Currently, we accept orders on Facebook and Website. However, please be noted that only orders from Website are eligible for Reward Point Program. </p>


                <h3 class ="general">6. What are the shipping rates/ delivery times?</h3>
                <p>The shipping rate to your specific address could be found on the payment page once you enter the correct information. In general, transit time will take 1-2 days for Hanoi, and 3-5 days for other cities.</p>
                <p class = "content">In case the transit time takes longer than usual, please inform us on our Facebook page so we can assist you in tracking the order.  </p>


                <h3 class ="general">7. What payment methods do you offer?</h3>
                <p class = "content">We accept COD (Cash on Delivery), Bank transfer, VNPay and Momo. Please carefully read and follow the instruction on the payment page when you make the purchase. We also accept cash and credit card payments when you purchase at our location. </p>


                <h3 class ="general">8. How can I save books that I'm interested in?</h3>
                <p class = "content">The Wish List is designed to allow you to save items that you are interested in purchasing at a later time. When you buy an item on your Wish List, we’ll automatically remove it for you. Once you've found an item you would be interested in, simply open the product page and click on the heart symbol located under the price to add it to your Wish List. </p>


                <h3 class ="general">9. How does Reward Point Program works?</h3>
                <p class = "content">Only orders from the Website are eligible to earn Rewards Points. For every 10,000VND spent, you will earn 1 Rewards point. Your accumulated Rewards Points could be redeemed for Free Delivery, Discount Coupon, Gifts, etc.</p>

            </div>

        </div>
    </body>
</html>
