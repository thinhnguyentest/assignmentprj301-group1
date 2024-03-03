<%-- 
    Document   : adminBook
    Created on : 29-02-2024, 10:40:08
    Author     : tuanngp
--%>
<%@ page isELIgnored ="false" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="account_assets/css/admin.css"/>

    </head>

    <body>
        <section id="books">
            <!-- Thêm một trường ẩn để lưu giá trị action -->
            <input type="hidden" id="action">
            <button onclick="showBookForm()">Thêm sách</button>
            <h2>Danh sách sách</h2>
            <table>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Tác giả</th>
                        <th>Nhà xuất bản</th>
                        <th>Tiêu đề</th>
                        <th>Thể loại</th>
                        <th>Mô tả</th>
                        <th>Số lượng</th>
                        <th>Giá</th>
                        <th>Hình ảnh</th>
                        <th>Thao tác</th>
                    </tr>
                </thead>
                <tbody>
                    <!-- Hiển thị dữ liệu sách từ máy chủ -->
                    <c:forEach var="book" items="${requestScope.books}">
                        <tr>
                            <td>${book.id}</td>
                            <td>${book.author.name}</td>
                            <td>${book.publisher.publisherName}</td>
                            <td>${book.title}</td>
                            <td>${book.genre}</td>
                            <td>${book.description}</td>
                            <td>${book.quantity}</td>
                            <td>${book.price}</td>
                            <td><img src="assets/images/book/${book.image}" alt="Book Image" style="width: 120px"></td>
                            <td>
                                    <a href="#bookForm"><button onclick="editBook(${book.id})">Sửa</button></a>
                                    <button onclick="deleteBook(${book.id})">Xóa</button>
                                
                                    <input type="text" id="authorName_${book.id}" value="${book.author.name}" hidden>
                                    <input type="text" id="authorBirthday_${book.id}" value="${book.author.birthday}" hidden>
                                    <input type="text" id="authorBio_${book.id}" value="${book.author.bio}" hidden>
                                    <input type="text" id="publisherName_${book.id}" value="${book.publisher.publisherName}" hidden>
                                    <input type="text" id="establishedDate_${book.id}" value="${book.publisher.dateEstablished}" hidden>
                                    <input type="text" id="bookId_${book.id}" value="${book.id}" hidden>
                                    <input type="text" id="bookTitle_${book.id}" value="${book.title}" hidden>
                                    <input type="text" id="genre_${book.id}" value="${book.genre}" hidden>
                                    <input type="text" id="description_${book.id}" value="${book.description}" hidden>
                                    <input type="text" id="quantity_${book.id}" value="${book.quantity}" hidden> 
                                    <input type="text" id="price_${book.id}" value="${book.price}" hidden>
                                    <input type="text" id="image_${book.id}" value="${book.image}" hidden>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            <c:if test="${totalPagesBook > 1}">
                <div class="pagination">
                    <c:forEach var="i" begin="1" end="${totalPagesBook}">
                        <c:choose>
                            <c:when test="${i == currentPageBook}">
                                <span>${i}</span>
                                <input name="pageBook" value="${i}" hidden="">
                            </c:when>
                            <c:otherwise>
                                <a href="?pageBook=${i}">${i}</a>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                </div>
            </c:if>
            <!-- Biểu mẫu thêm/sửa sách -->
            <div id="bookForm" style="display: none;">
                <h3>Biểu mẫu Sách</h3>
                <form action="book" method="post">
                    <!--Author Information-->
                    <fieldset>
                        <legend>Author Information</legend>
                        <label for="authorName">Name:</label>
                        <input type="text" id="authorName" name="authorName" required><br>

                        <label for="birthday">Birthday:</label>
                        <input type="date" id="birthday" name="birthday" required><br>

                        <label for="bio">Bio:</label>
                        <textarea id="bio" name="bio" rows="4" cols="50" required></textarea><br>
                    </fieldset>

                    <!-- Publisher Information -->
                    <fieldset>
                        <legend>Publisher Information</legend>
                        <label for="publisherName">Name:</label>
                        <input type="text" id="publisherName" name="publisherName" required><br>

                        <label for="establishedDate">Date Established:</label>
                        <input type="date" id="establishedDate" name="establishedDate" required><br>
                    </fieldset>

                    <!-- Book Information -->
                    <fieldset>
                        <legend>Book Information</legend>
                        <label for="id">Id: </label>
                        <input type="text" id="id" name="id" required disabled=""><br>
                        
                        <label for="genre">Genre:</label>
                        <input type="text" id="genre" name="genre" required><br>

                        <label for="description">Description:</label>
                        <textarea id="description" name="description" rows="4" cols="50" required></textarea><br>

                        <label for="quantity">Quantity:</label>
                        <input type="text" id="quantity" name="quantity" required><br>

                        <label for="price">Price:</label>
                        <input type="text" id="price" name="price" step="0.01" required><br>

                        <label for="image">Select Image :</label>
                        <input type="file" name="image" id="image" required>
                    </fieldset>

                    <button type="button" onclick="saveBook()">Lưu</button>
                    <button type="button" onclick="cancelBookForm()">Hủy</button>
                </form>
            </div>
        </section>
    </body>
    <script src="account_assets/js/main.js">
    </script>
</html>