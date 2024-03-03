
import dao.AccountDAO;
import dao.BookDAO;
import entity.Account.User;
import entity.Product.Book;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;



@WebServlet(name = "AdminServlet", urlPatterns = "/admin")
public class AdminServlet extends HttpServlet {

    private static final int ITEMS_PER_PAGE = 10;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int totalBooks = BookDAO.totalBook();
        int totalPagesBook = (int) Math.ceil((double) totalBooks / ITEMS_PER_PAGE);

        int totalUsers = AccountDAO.totalUser();
        int totalPagesUser = (int) Math.ceil((double) totalUsers / ITEMS_PER_PAGE);

        String currentPageBookParam = request.getParameter("pageBook");
        int currentPageBook = (currentPageBookParam != null) ? Integer.parseInt(currentPageBookParam) : 1;
        int offsetBook = (currentPageBook - 1) * ITEMS_PER_PAGE;

        String currentPageUserParam = request.getParameter("pageUser");
        int currentPageUser = (currentPageUserParam != null) ? Integer.parseInt(currentPageUserParam) : 1;
        int offsetUser = (currentPageUser - 1) * ITEMS_PER_PAGE;

        ArrayList<Book> books = BookDAO.getPagging(offsetBook, ITEMS_PER_PAGE);
        ArrayList<User> users = AccountDAO.getPagging(offsetUser, ITEMS_PER_PAGE);

        // Pass the data to the JSP page for rendering
        request.setAttribute("books", books);
        request.setAttribute("currentPageBook", currentPageBook);
        request.setAttribute("totalPagesBook", totalPagesBook);
        
        request.setAttribute("users", users);
        request.setAttribute("totalPagesUser", totalPagesUser);    
        request.setAttribute("currentPageUser", currentPageUser);

        request.getRequestDispatcher("/admin.jsp").forward(request, response);
    }
    
    public static void main(String[] args) {
        BookDAO.getPagging(1, 10).forEach(p -> System.out.println(p));
    }
}