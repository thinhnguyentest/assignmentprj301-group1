package dao;

import context.DBcontext;
import entity.Product.Author;
import entity.Product.Book;
import entity.Product.Publisher;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/*
 * @author tuanngp
 */
public class BookDAO {

    public static boolean addBook(Book b) {
        String QUERY = "INSERT INTO Books (Title, Genre, Description, Quantity, Price, AuthorId, PublisherId) "
                + "VALUES (?,?,?,?,?,?,?)";
        try (Connection conn = DBcontext.getConnection()) {
            try (PreparedStatement pst = conn.prepareStatement(QUERY)) {
                pst.setString(1, b.getTitle());
                pst.setString(2, b.getGenre());
                pst.setString(3, b.getDescription());
                pst.setInt(4, b.getQuantity());
                pst.setFloat(5, b.getPrice());
                pst.setInt(6, b.getAuthor().getId());
                pst.setInt(7, b.getPublisher().getPublisherId());
                return pst.execute();
            }
        } catch (Exception e) {
        }
        return false;
    }

    public static boolean addAuthor(Author author) {
        String QUERY = "INSERT INTO Authors (Name, Birthday, Bio) "
                + "VALUES (?,?,?)";
        try (Connection conn = DBcontext.getConnection()) {
            try (PreparedStatement pst = conn.prepareStatement(QUERY)) {
                pst.setString(1, author.getName());
                pst.setDate(2, author.getBirthday());
                pst.setString(3, author.getBio());
                return pst.execute();
            }
        } catch (Exception e) {
        }
        return false;
    }

    public static boolean addPublisher(Publisher p) {
        String QUERY = "INSERT INTO Publishers (Name, DateEstablished) "
                + "VALUES (?,?)";
        try (Connection conn = DBcontext.getConnection()) {
            try (PreparedStatement pst = conn.prepareStatement(QUERY)) {
                pst.setString(1, p.getPublisherName());
                pst.setDate(2, p.getDateEstablished());
                return pst.execute();
            }
        } catch (Exception e) {
        }
        return false;
    }

//    ---------------------------------------------------------------------------------------------
    public static ArrayList<Book> listBook() {
        ArrayList<Book> list = new ArrayList<>();
        String Query = "SELECT * FROM Books";
        try (Connection conn = DBcontext.getConnection()) {
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(Query);
            while (rs.next()) {
                list.add(new Book(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getInt(5),
                        rs.getFloat(6),
                        rs.getInt(7),
                        rs.getInt(8)
                ));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public static List<String> getImages(int id) {
        List<String> list = new ArrayList<>();
        String QUERY = "SELECT * FROM ImageStoring WHERE BookId=?";
        try (Connection conn = DBcontext.getConnection()) {
            try (PreparedStatement pst = conn.prepareStatement(QUERY)) {
                pst.setInt(1, id);
                ResultSet rs = pst.executeQuery();
                while (rs.next()) {
                    list.add(rs.getString("FilePath"));
                }
            }
        } catch (Exception e) {
        }
        return list;
    }

    public static Author getAuthor(int id) {
        String QUERY = "SELECT * FROM Authors WHERE AuthorId=?";
        Author author = new Author();
        try (Connection conn = DBcontext.getConnection()) {
            try (PreparedStatement pst = conn.prepareStatement(QUERY)) {
                pst.setInt(1, id);
                ResultSet rs = pst.executeQuery();
                while (rs.next()) {
                    author = new Author(
                            rs.getInt(1),
                            rs.getString(2),
                            rs.getDate(3),
                            rs.getString(4));
                }
            }
        } catch (Exception e) {
        }
        return author;
    }
    public static List<Author> getAuthors(){
        List<Author> list = new ArrayList<>();
        String QUERY = "SELECT * FROM Authors";
        try (Connection conn = DBcontext.getConnection()) {
            try (PreparedStatement pst = conn.prepareStatement(QUERY)) {
                ResultSet rs = pst.executeQuery();
                while (rs.next()) {
                    list.add(new Author(
                            rs.getInt(1),
                            rs.getString(2),
                            rs.getDate(3),
                            rs.getString(4)));
                }
            }
        } catch (Exception e) {
        }
        return list;
    }

    public static Publisher getPublisher(int id) {
        String QUERY = "SELECT * FROM Publishers WHERE PublisherId=?";
        Publisher publisher = new Publisher();
        try (Connection conn = DBcontext.getConnection()) {
            try (PreparedStatement pst = conn.prepareStatement(QUERY)) {
                pst.setInt(1, id);
                ResultSet rs = pst.executeQuery();
                while (rs.next()) {
                    publisher = new Publisher(
                            rs.getInt(1),
                            rs.getString(2),
                            rs.getDate(3));
                }
            }
        } catch (Exception e) {
        }
        return publisher;
    }

    public static ArrayList<Book> searchBook(String Column, String data) {
        String SEARCH = "SELECT * FROM [Books] WHERE " + Column + " LIKE ?";
        ArrayList<Book> list = new ArrayList<>();
        try (Connection conn = DBcontext.getConnection()) {
            try (PreparedStatement preparedStatement = conn.prepareStatement(SEARCH)) {
                preparedStatement.setString(1, "%" + data + "%");
                ResultSet rs = preparedStatement.executeQuery();
                while (rs.next()) {
                    list.add(new Book(rs.getInt(1),
                            rs.getString(2),
                            rs.getString(3),
                            rs.getString(4),
                            rs.getInt(5),
                            rs.getFloat(6),
                            rs.getInt(7),
                            rs.getInt(8)
                    ));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public static Book getBookById(int id) {
        String sql = "SELECT * FROM Books WHERE BookId = ?";
        Book book = null;

        try (Connection conn = DBcontext.getConnection()) {
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setInt(1, id);

            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                book = new Book(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getInt(5),
                        rs.getFloat(6),
                        rs.getInt(7),
                        rs.getInt(8));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return book;
    }
    public static List<Book> getNewBooks(int top) {
        List<Book> list = new ArrayList<>();
        String QUERY = "SELECT TOP (?) * FROM Books ORDER BY BookId DESC";
        try (Connection conn = DBcontext.getConnection()) {
            try (PreparedStatement pst = conn.prepareStatement(QUERY)) {
                pst.setInt(1, top);
                ResultSet rs = pst.executeQuery();
                while (rs.next()) {
                    list.add(new Book(rs.getInt(1),
                            rs.getString(2),
                            rs.getString(3),
                            rs.getString(4),
                            rs.getInt(5),
                            rs.getFloat(6),
                            rs.getInt(7),
                            rs.getInt(8)
                    ));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Print the stack trace for the SQLException
        }
        return list;
    }
    
      

//    ----------------------------------------------------------------------------------------------------
    public static boolean update(Book b) {
        String QUERY = "UPDATE Books SET Title=?, Genre=?, Description=?, Quantity=?, Price=?, AuthorId=?, PublisherId=? WHERE BookId=?";
        try (Connection conn = DBcontext.getConnection()) {
            try (PreparedStatement pst = conn.prepareStatement(QUERY)) {
                pst.setString(1, b.getTitle());
                pst.setString(2, b.getGenre());
                pst.setString(3, b.getDescription());
                pst.setInt(4, b.getQuantity());
                pst.setFloat(5, b.getPrice());
                pst.setInt(6, b.getAuthor().getId());
                pst.setInt(7, b.getPublisher().getPublisherId());
                pst.setInt(8, b.getId());
                return pst.execute();
            }
        } catch (SQLException e) {
        }
        return false;
    }

//    PAGING-----------------------------------------------------------------------------------------------
    public static int getNumberPage() {
        int count = 0;
        String QUERY = "SELECT COUNT(*) FROM Books";
        try (Connection conn = DBcontext.getConnection()) {
            try (PreparedStatement pst = conn.prepareStatement(QUERY)) {
                ResultSet rs = pst.executeQuery();
                if (rs.next()) {
                    count = rs.getInt(1);
                }
            }
        } catch (Exception e) {
        }
        return count % 15 == 0 ? count / 15 : count / 15 + 1;
    }

    public static List<Book> getPagingBook(int index) {
        List<Book> list = new ArrayList<>();
        String QUERY = "SELECT * FROM Books ORDER BY BookId ASC OFFSET ? ROWS FETCH NEXT 15 ROWS ONLY";
        try (Connection conn = DBcontext.getConnection()) {
            try (PreparedStatement pst = conn.prepareStatement(QUERY)) {
                int offset = (index - 1) * 15;
                pst.setInt(1, offset);
                ResultSet rs = pst.executeQuery();
                while (rs.next()) {
                    list.add(new Book(rs.getInt(1),
                            rs.getString(2),
                            rs.getString(3),
                            rs.getString(4),
                            rs.getInt(5),
                            rs.getFloat(6),
                            rs.getInt(7),
                            rs.getInt(8)
                    ));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Print the stack trace for the SQLException
        }
        return list;
    }

    public static int totalBook() {
        int count = 0;
        String QUERY = "SELECT COUNT(*) FROM Books";
        try (Connection conn = DBcontext.getConnection()) {
            try (PreparedStatement pst = conn.prepareStatement(QUERY)) {
                ResultSet rs = pst.executeQuery();
                while (rs.next()) {
                    count = rs.getInt(1);
                }
            }
        } catch (Exception e) {
        }
        return count;
    }

    public static ArrayList<Book> getPagging(int offset, int itemsPerPage) {
        String QUERY = "SELECT * FROM Books "
                + "ORDER BY BookId OFFSET " + offset + " ROWS FETCH NEXT " + itemsPerPage + " ROWS ONLY";
        ArrayList<Book> list = new ArrayList<>();
        try (Connection conn = DBcontext.getConnection()) {
            try (PreparedStatement preparedStatement = conn.prepareStatement(QUERY)) {
                ResultSet rs = preparedStatement.executeQuery();
                while (rs.next()) {
                    list.add(new Book(rs.getInt(1),
                            rs.getString(2),
                            rs.getString(3),
                            rs.getString(4),
                            rs.getInt(5),
                            rs.getFloat(6),
                            rs.getInt(7),
                            rs.getInt(8)
                    ));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public static void main(String[] args) {
//        listBook().forEach(p -> System.out.println(p));
//        searchBook("Genre", "mys").forEach(p -> System.out.println(p));

//        System.out.println(getAuthor(1));
    }

}
