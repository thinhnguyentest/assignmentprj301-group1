
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User manager</title>
    </head>
    <body>
        <section id="users">
            <h2>Danh sách Người dùng</h2>
            <table>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Tên đăng nhập</th>
                        <th>Mật khẩu</th>
                        <th>Tên</th>
                        <th>Email</th>
                        <th>Điện thoại</th>
                        <th>Địa chỉ</th>
                        <th>Vai trò</th>
                        <th>Trạng thái</th>
                        <th>Thao tác</th>
                    </tr>
                </thead>
                <tbody>
                    <!-- Hiển thị dữ liệu người dùng từ máy chủ -->
                    <c:forEach var="user" items="${users}">
                        <tr data-user-id="${user.id}" 
                            data-user-username="${user.username}" 
                            data-user-password="${user.password}" 
                            data-user-name="${user.name}" 
                            data-user-email="${user.email}" 
                            data-user-phone="${user.phone}" 
                            data-user-address="${user.address}" 
                            data-user-role="${user.role}" 
                            data-user-is-active="${user.isActive}">
                            <td>${user.id}</td>
                            <td>${user.username}</td>
                            <td>${user.password}</td>
                            <td>${user.name}</td>
                            <td>${user.email}</td>
                            <td>${user.phone}</td>
                            <td>${user.address}</td>
                            <td>${user.role}</td>
                            <td>${user.isActive?"Hoạt động":"Không hoạt động"}</td>
                            <td>
                                <a href="#userForm" style="padding: 20px;">
                                    <button onclick="editUser(${user.id})">Sửa</button>
                                </a>
                                <form action="userAdmin" style="box-shadow: none">
                                    <input type="text" name="action" value="delete" hidden>
                                    <input type="text" name="userId" value="${user.id}" hidden><br>
                                    <button onclick="parentNode.submit()">Xóa</button>
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                    <!-- Thêm các dòng khác tương tự cho các người dùng khác -->
                </tbody>
            </table>
            <c:if test="${totalPagesUser > 1}">
                <div class="pagination">
                    <c:forEach var="i" begin="1" end="${totalPagesUser}">
                        <c:choose>
                            <c:when test="${i == currentPageUser}">
                                <input name="pageUser" value="${i}" hidden="">
                                <span>${i}</span>
                            </c:when>
                            <c:otherwise>
                                <a href="?pageUser=${i}#users">${i}</a>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                </div>
            </c:if>

            <!-- Biểu mẫu thêm/sửa người dùng -->
            <div id="userForm" style="display: none">
                <form action="userAdmin">
                    <input type="text" name="action" value="update" hidden>
                    <fieldset>
                        <legend>User Information</legend>
                        <label for="userId">ID:</label>
                        <input type="text" id="userId" name="userId" readonly><br>

                        <label for="username">Tên đăng nhập:</label>
                        <input type="text" id="username" name="username" readonly><br>

                        <label for="password">Mật khẩu:</label>
                        <input type="password" id="password" name="password" readonly><br>

                        <label for="name">Tên:</label>
                        <input type="text" id="name" name="name" readonly><br>

                        <label for="email">Email:</label>
                        <input type="email" id="email" name="email" readonly><br>

                        <label for="phone">Điện thoại:</label>
                        <input type="tel" id="phone" name="phone" readonly><br>

                        <label for="address">Địa chỉ:</label>
                        <input type="text" id="address" name="address" readonly><br>

                        <label for="role">Chức vụ:</label>
                        <select id="role" name="role">
                            <option value="admin">Admin</option>
                            <option value="user">User</option>
                        </select><br>

                        <label for="isActive">Trạng thái:</label>
                        <select id="isActive" name="isActive">
                            <option value="true">Hoạt động</option>
                            <option value="false">Không hoạt động</option>
                        </select>
                    </fieldset>

                    <button type="button" onclick="parentNode.submit()">Lưu</button>
                    <a href="#users"><button type="button" onclick="cancelUserForm()">Hủy</button></a>
                </form>
            </div>
        </section>
    </body>
    <script src="account_assets/js/main.js"></script>
</html>

