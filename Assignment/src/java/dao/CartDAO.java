package dao;

import static context.DBcontext.getConnection;
import java.sql.SQLException;
import entity.Order.Bill;
import java.sql.PreparedStatement;
import java.sql.Timestamp;
import java.time.LocalDateTime;

/*
 * @author tuanngp
 */
public class CartDAO {

    public void addBill(Bill hd) {
     
        String SQL = "insert into OrderDetails(OrderId, BookId , Quantity ,Price ) values(?,?,?,?) ";

        try {
            PreparedStatement st = getConnection().prepareStatement(SQL);
            st.setInt(1, hd.getMaHD());
            st.setInt(2, hd.getBookId());
            st.setInt(3, hd.getQuantity());
            st.setDouble(4, hd.getPrice());
            st.executeUpdate();
            
           getConnection().close();
        }catch(SQLException e){
            e.printStackTrace();
        }
    }
    public static void main(String[] args) throws SQLException, ClassNotFoundException {
        CartDAO dao = new CartDAO();
        Bill h = new Bill(1, 3, 5, 0, 24, "Credit Card", Timestamp.valueOf(LocalDateTime.now()));
        dao.addBill(h);
        System.out.println(h);
    }
}
    