package control;

import dao.AccountDAO;
import entity.Account.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

/**
 *
 * @author PC
 */
@WebServlet(name = "LoginServlet", urlPatterns = {"/login"})
public class LoginServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String remember = request.getParameter("remember");
        HttpSession session = request.getSession();
        Cookie cu = new Cookie("userC", username);
        Cookie cp = new Cookie("passC", password);
        Cookie cr = new Cookie("rememC", remember);
        if (cr != null && cr.equals("ON")) {
            cu.setMaxAge(60 * 60 * 24 * 7); // 7 ngay
            cp.setMaxAge(60 * 60 * 24 * 7);
            cr.setMaxAge(60 * 60 * 24 * 7);
        } else {
            cu.setMaxAge(0); // 7 ngay
            cp.setMaxAge(0);
            cr.setMaxAge(0);
        }
        response.addCookie(cu);
        response.addCookie(cp);
        response.addCookie(cr);

        if (AccountDAO.authenticateUser(username, password)) {
            User user = AccountDAO.searchUser(username);
            if (user == null) {
                request.setAttribute("ms", "user or password invalid");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            } else if (user.getRole().equals("admin")) {
                session.setAttribute("admin", user);
                session.setMaxInactiveInterval(60 * 60 * 24);
                response.sendRedirect("admin");
            } else if (user.getRole().equals("user")) {
                session.setAttribute("user", user);
                session.setMaxInactiveInterval(60 * 60 * 24);
                response.sendRedirect("home");
            }
        }
    }

    private void validateInput(String username, String password, HttpServletRequest request) {
        if (username == null || username.isEmpty() || username.length() < 6) {
            setErrorStatus("Tên đăng nhập phải từ 6 kí tự trở lên.", request);
        }
        if (password == null || password.isEmpty() || password.length() < 8) {
            setErrorStatus("Mật khẩu phải từ 8 kí tự trở lên.", request);
        }
    }

    private void setErrorStatus(String message, HttpServletRequest request) {
        request.setAttribute("status", message);
    }
}
