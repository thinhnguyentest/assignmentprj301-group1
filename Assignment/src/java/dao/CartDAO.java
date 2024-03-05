package dao;

import context.DBcontext;
import static context.DBcontext.getConnection;
import java.sql.SQLException;
import entity.Order.Bill;
import entity.Order.Cart;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Timestamp;
import java.time.LocalDateTime;

/*
 * @author tuanngp
 */
public class CartDAO {

    public static boolean addCart(Cart cart) {
        String QUERY = "INSERT INTO Carts (UserId, BookId, Quantity) "
                + "VALUES (?,?,?)";
        try (Connection conn = DBcontext.getConnection()) {
            try (PreparedStatement pst = conn.prepareStatement(QUERY)) {
                pst.setInt(1, cart.getUser().getId());
                pst.setInt(2, cart.getBook().getId());
                pst.setInt(2, cart.getQuantity());
                return pst.execute();
            }
        } catch (Exception e) {
        }
        return false;
    }
    public void addBill(Bill hd){
        String SQL = "insert into OrderDetails(OrderId, BookId, Quantity, Price) values(?,?,?,?)";
        try {
            PreparedStatement st = getConnection().prepareStatement(SQL);
            st.setInt(1, hd.getMaHD());
            st.setInt(2, hd.getBookId());
            st.setInt(3, hd.getQuantity());
            st.setDouble(4, hd.getPrice());
            st.executeUpdate();
            
            updateBookQuantity(hd.getBookId(), hd.getQuantity());
            getConnection().close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
     private void updateBookQuantity(int bookId, int quantityPurchased) {
        String SQL = "UPDATE Books SET Quantity = Quantity - ? WHERE BookId = ?";
        try {
            // Cập nhật số lượng sách
            PreparedStatement st = getConnection().prepareStatement(SQL);
            st.setInt(1, quantityPurchased);
            st.setInt(2, bookId);
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

}
