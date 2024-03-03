
import entity.Product.Author;
import entity.Product.Book;
import entity.Product.Publisher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Date;

@WebServlet(name = "BookServlet", urlPatterns = {"/book"})
public class BookServlet extends HttpServlet {

    private static final String ACTION_ADD = "add";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            // Get Author Information
            Author author = getAuthorFromRequest(request);

            // Get Publisher Information
            Publisher publisher = getPublisherFromRequest(request);

            // Get Book Information
            Book book = getBookFromRequest(request, author, publisher);

            String action = request.getParameter("action");
            switch (action) {
                case ACTION_ADD:
                    addBook(book, author, publisher);
                    break;
                default:
                    throw new IllegalArgumentException("Invalid action: " + action);
            }
        } catch (IllegalArgumentException e) {
            request.setAttribute("error", e.getMessage());
            request.getRequestDispatcher("/bookForm.jsp").forward(request, response);
        }
    }

    private Author getAuthorFromRequest(HttpServletRequest request) {
        String authorName = request.getParameter("authorName");
        String birthday = request.getParameter("birthday");
        String bio = request.getParameter("bio");
        return new Author(authorName, Date.valueOf(birthday), bio);
    }

    private Publisher getPublisherFromRequest(HttpServletRequest request) {
        String publisherName = request.getParameter("publisherName");
        String establishedDate = request.getParameter("establishedDate");
        return new Publisher(publisherName, Date.valueOf(establishedDate));
    }

    private Book getBookFromRequest(HttpServletRequest request, Author author, Publisher publisher) {
        int bookId = Integer.parseInt(request.getParameter("bookId"));
        String bookTitle = request.getParameter("bookTitle");
        String genre = request.getParameter("genre");
        String description = request.getParameter("description");
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        float price = Float.parseFloat(request.getParameter("price"));
        return new Book(bookId, bookTitle, genre, description, quantity, price, author.getId(), publisher.getPublisherId());
    }

    private void addBook(Book book, Author author, Publisher publisher) throws ServletException, IOException {
        author.addAuthor();
        publisher.addPublisher();
        book.addBook();
    }
}