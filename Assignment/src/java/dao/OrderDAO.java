package dao;
import context.DBcontext;
import entity.Account.User;
import entity.Order.CartItem;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

public class OrderDAO {

    public static void addOrder(User u, List<CartItem> cart) {

        try (Connection conn = DBcontext.getConnection()) {
            String sql = "insert into Orders(UserId, ShippingMethodId) "
                + "VALUES (?,?)";
            PreparedStatement ps;
             ResultSet rs;
            ps = conn.prepareStatement(sql);
            ps.setInt(1, u.getId());
            ps.setInt(2,1);
            ps.executeUpdate();

            String sql1 = "select top 1 OrderId from [Orders] order by OrderId desc";
            ps = conn.prepareStatement(sql1);
            rs = ps.executeQuery();

            if (rs.next()) {
                int OrderId = rs.getInt(1);
                for (CartItem c : cart) {
                    String sql2 = "insert into OrderDetails(OrderId,BookId,Quantity,Price,DiscountId)  values(?,?,?,?,?)";
                    ps = conn.prepareStatement(sql2);
                    ps.setInt(1, OrderId);
                    ps.setInt(2, c.getBook().getId());
                    ps.setInt(3, c.getQuantity());
                    ps.setFloat(4, c.getBook().getPrice());
                    ps.setInt(5, 1);
                    ps.executeUpdate();
                }
            }

            String sql3 = "update Books set Quantity = Quantity - ? "
                    + "where BookId = ?";
            ps = conn.prepareStatement(sql3);
            for (CartItem c : cart) {
                ps.setInt(1, c.getQuantity());
                ps.setInt(2, c.getBook().getId());
                ps.executeUpdate();
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } 
    }

    // public List<Order> getOrderInfo() {
    //     List<Order> list = new ArrayList<>();
    //     String sql = "select b.bill_id, u.user_name,b.phone,b.address,b.date,b.total,b.payment from bill b inner join users u on b.user_id = u.user_id";
    //     try {
    //         conn = new DBContext().getConnection();
    //         ps = conn.prepareStatement(sql);
    //         rs = ps.executeQuery();
    //         while (rs.next()) {
    //             User u = new User(rs.getString(2));
    //             list.add(new Bill(rs.getInt(1), u, rs.getFloat(6), rs.getString(7), rs.getString(4), rs.getDate(5), rs.getInt(3)));
    //         }
    //     } catch (SQLException e) {
    //         e.printStackTrace();
    //     }
    //     return list;
    // }

    // public Bill getBill() {
    //     List<Bill> list = new ArrayList<>();
    //     String sql = "select top 1 bill_id, total, date from [bill] order by bill_id desc";
    //     try {
    //         conn = new DBContext().getConnection();
    //         ps = conn.prepareStatement(sql);
    //         rs = ps.executeQuery();
    //         while (rs.next()) {
    //             return (new Bill(rs.getInt(1), rs.getFloat(2), rs.getDate(3)));
    //         }
    //     } catch (SQLException e) {
    //         e.printStackTrace();
    //     }
    //     return null;
    // }

    // public List<BillDetail> getDetail(int bill_id) {
    //     List<BillDetail> list = new ArrayList<>();
    //     String sql = "select d.detail_id, p.product_id, p.product_name, p.img, d.quantity, d.size, d.color, d.price from bill_detail d "
    //             + "inner join product p on d.product_id = p.product_id where d.bill_id = ?";
    //     try {
    //         conn = new DBContext().getConnection();
    //         ps = conn.prepareStatement(sql);
    //         ps.setInt(1, bill_id);
    //         rs = ps.executeQuery();
    //         while (rs.next()) {
    //             Product p = new Product(rs.getString(2), rs.getString(3), rs.getString(4));
    //             list.add(new BillDetail(rs.getInt(1), p, rs.getInt(5), rs.getString(6), rs.getString(7), rs.getFloat(8)));
    //         }
    //     } catch (SQLException e) {
    //         e.printStackTrace();
    //     }
    //     return list;
    // }


    // public List<Bill> getBillByID(int user_id) {
    //     List<Bill> list = new ArrayList<>();
    //     String sql = "select b.bill_id, b.date,b.total,b.payment, b.address, b.phone from bill b where user_id = ?";
    //     try {
    //         conn = new DBContext().getConnection();
    //         ps = conn.prepareStatement(sql);
    //         ps.setInt(1, user_id);
    //         rs = ps.executeQuery();
    //         while (rs.next()) {
    //             list.add(new Bill(rs.getInt(1), rs.getFloat(3), rs.getString(4), rs.getString(5), rs.getDate(2), rs.getInt(6)));
    //         }
    //     } catch (SQLException e) {
    //         e.printStackTrace();
    //     }
    //     return list;
    // }

    // public List<Bill> getBillByDay() {
    //     List<Bill> list = new ArrayList<>();
    //     String sql = "select b.bill_id, u.user_name,b.phone,b.address,b.date,b.total,b.payment from bill b inner join users u on b.user_id = u.user_id where date = cast(getdate() as Date)";
    //     try {
    //         conn = new DBContext().getConnection();
    //         ps = conn.prepareStatement(sql);
    //         rs = ps.executeQuery();
    //         while (rs.next()) {
    //             User u = new User(rs.getString(2));
    //             list.add(new Bill(rs.getInt(1), u, rs.getFloat(6), rs.getString(7), rs.getString(4), rs.getDate(5), rs.getInt(3)));
    //         }
    //     } catch (SQLException e) {
    //         e.printStackTrace();
    //     } 
    //     return list;
    // }

}
