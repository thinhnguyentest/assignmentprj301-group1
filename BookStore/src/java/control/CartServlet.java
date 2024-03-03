package control;

import dao.BookDAO;
import entity.Order.CartItem;
import entity.Product.Book;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Admin
 */
@WebServlet(name = "CartServlet", urlPatterns = {"/cart"})
public class CartServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    public CartServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            request.getRequestDispatcher("cart.jsp").forward(request, response);
        } else {
            if (action.equalsIgnoreCase("buy")) {
                doGet_Buy(request, response);
            } else if (action.equalsIgnoreCase("remove")) {
                doGet_Remove(request, response);
            }
        }
    }



    protected void doGet_Remove(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");
        int index = isExisting(request.getParameter("id"), cart);
        cart.remove(index);
        session.setAttribute("cart", cart);
        response.sendRedirect("cart");
        
    }

    protected void doGet_Buy(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        if (session.getAttribute("cart") == null) {
            List<CartItem> cart = new ArrayList<CartItem>();
            cart.add(new CartItem(BookDAO.getBookById(Integer.parseInt(request.getParameter("id"))), 1));
            session.setAttribute("cart", cart);
        } else {
            List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");
            int index = isExisting(request.getParameter("id"), cart);
            if (index == -1) {
                cart.add(new CartItem(BookDAO.getBookById(Integer.parseInt(request.getParameter("id"))), 1));
            } else {
                int quantity = cart.get(index).getQuantity() + 1;
                cart.get(index).setQuantity(quantity);
            }
            session.setAttribute("cart", cart);
        }
        response.sendRedirect("cart");
    }

    private int isExisting(String id, List<CartItem> cart) {
        for (int i = 0; i < cart.size(); i++) {
            if (cart.get(i).getBook().getId() == Integer.parseInt(id)) {
                return i;
            }
        }
        return -1;
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    public static void main(String[] args) {
        CartServlet cl = new CartServlet();
        List<CartItem> cart = new ArrayList<>();
        List<Book> books = new ArrayList<>();
        // Tạo mẫu sản phẩm
        books = BookDAO.listBook();
        for (Book b : books) {
            cart.add(new CartItem(b, 1));
        }
        for (CartItem c : cart) {
            System.out.println(c.getBook().getTitle());
        }
    }
}
