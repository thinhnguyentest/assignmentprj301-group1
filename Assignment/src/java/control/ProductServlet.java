package control;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */


import dao.BookDAO;
import entity.Product.Author;
import entity.Product.Book;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;

/**
 *
 * @author Admin
 */
@WebServlet(urlPatterns={"/product"})
public class ProductServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if(action==null){
            doGetDisplay(request, response);
        }else if(action.equals("newArrival")){
            doGetNewArrival(request, response);
        }else if(action.equals("show")){
            doGetDetail(request, response);
        }else if(action.equals("category")){
            doGetCatagory(request, response);
        }else if(action.equals("search")){
            doGetSearch(request, response);
        }
    }
    protected void doGetNewArrival(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        List<Book> books = BookDAO.getNewBooks(15);
        request.setAttribute("books", books);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/newArrival.jsp");
        dispatcher.forward(request, response);
    }
    protected void doGetDisplay(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String page = request.getParameter("page");
        if(page==null) page="1";
        int indexPage=Integer.parseInt(page);
        int totalPage=BookDAO.getNumberPage();
        List<Author> authors =BookDAO.getAuthors();
        List<Book> books = BookDAO.getPagingBook(indexPage);
        request.setAttribute("books", books);
        request.setAttribute("authors", authors);
        request.setAttribute("totalPage", totalPage);
        request.setAttribute("indexPage", indexPage);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/allBook.jsp");
        dispatcher.forward(request, response);
    }
    protected void doGetDetail(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String bookId= request.getParameter("bookId");
        Book book = BookDAO.getBookById(Integer.parseInt(bookId));
        request.setAttribute("book", book);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/bookDetail.jsp");
        dispatcher.forward(request, response);
    }
    protected void doGetSearch(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String data = request.getParameter("input");
        List<Book> books = BookDAO.searchBook("Title", data);
        request.setAttribute("books", books);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/searchPage.jsp");
        dispatcher.forward(request, response);
    }
    protected void doGetCatagory(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String data = request.getParameter("input");
        String category = request.getParameter("category");
        if(category.equals("AuthorId")){
            List<Book> books = BookDAO.searchBook(category, data);
        }
        List<Book> books = BookDAO.searchBook(category, data);
        request.setAttribute("books", books);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/category.jsp");
        dispatcher.forward(request, response);
    }
    public static void main(String[] args) {
        
        BookDAO.getAuthors().forEach(p -> System.out.println(p));
    }
}
