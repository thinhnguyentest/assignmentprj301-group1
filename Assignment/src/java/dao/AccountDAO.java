package dao;

import context.DBcontext;
import entity.Account.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

/*
 * @author tuanngp
 */
public class AccountDAO {

    public static ArrayList<User> listUsers() {
        ArrayList<User> listUsers = new ArrayList<>();
        String QUERY = "SELECT * FROM [Users] WHERE Role='User'";
        try ( Connection conn = DBcontext.getConnection()) {
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(QUERY);
            while (rs.next()) {
                User user = new User(
                                        rs.getInt(1), 
                                        rs.getString(2), 
                                        rs.getString(3), 
                                        rs.getString(4), 
                                        rs.getString(5), 
                                        rs.getString(6), 
                                        rs.getString(7), 
                                        rs.getString(8), 
                                        rs.getBoolean(9));
                listUsers.add(user);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return listUsers;
    }
    
    public static User searchUser(String username) {
        String QUERY = "SELECT * FROM Users WHERE Username=?";
        User user = null;
        try (Connection conn = DBcontext.getConnection()){
            try(PreparedStatement pst = conn.prepareStatement(QUERY)) {
                pst.setString(1, username);
                ResultSet rs = pst.executeQuery();
                while (rs.next()) {
                    user = new User(
                                            rs.getInt(1), 
                                            rs.getString(2), 
                                            rs.getString(3), 
                                            rs.getString(4), 
                                            rs.getString(5), 
                                            rs.getString(6), 
                                            rs.getString(7), 
                                            rs.getString(8), 
                                            rs.getBoolean(9));
                }
            }
        } catch (Exception e) {
        }
        return user;
    }
    
    public static boolean authenticateUser(String username, String password) {
    User user = AccountDAO.searchUser(username);
    if (user == null) {
        return false;
    }
    return user.getPassword().equals(password);
}
    
    public static boolean registerUser(User u) {
        String QUERY = "INSERT INTO Users ([Username], [Password], [Email], [Phone], [Role], IsActive) " +
                        "VALUES (?,?,?,?,'User',1)";
        try(Connection conn = DBcontext.getConnection()) {
            try(PreparedStatement pst = conn.prepareStatement(QUERY)) {
                pst.setString(1, u.getUsername());
                pst.setString(2, u.getPassword());
                pst.setString(3, u.getEmail());
                pst.setString(4, u.getPhone());
                pst.execute();
                return true;
            }
        } catch (Exception e) {
            return false;
        }
    }
    
    public static ArrayList<User> getPagging(int offset, int itemsPerPage) {
        ArrayList<User> listUsers = new ArrayList<>();
        String QUERY = "SELECT * FROM Users " +
                       "ORDER BY UserId OFFSET " + offset + " ROWS FETCH NEXT " + itemsPerPage + " ROWS ONLY";
        try ( Connection conn = DBcontext.getConnection()) {
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(QUERY);
            while (rs.next()) {
                User user = new User(
                                        rs.getInt(1), 
                                        rs.getString(2), 
                                        rs.getString(3), 
                                        rs.getString(4), 
                                        rs.getString(5), 
                                        rs.getString(6), 
                                        rs.getString(7), 
                                        rs.getString(8), 
                                        rs.getBoolean(9));
                listUsers.add(user);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return listUsers;
    }
    
    public static int totalUser() {
        int count=0;
        String QUERY = "SELECT COUNT(*) FROM Users";
        try (Connection conn = DBcontext.getConnection()){
            try(PreparedStatement pst = conn.prepareStatement(QUERY)) {
                ResultSet rs = pst.executeQuery();
                while (rs.next()) {
                    count = rs.getInt(1);
                }
            }
        } catch (Exception e) {
        }
        return count;
    }
    
    public static boolean updateUser(User user) {
    String QUERY = "UPDATE Users SET Username=?, [Password]=?,Name=?, Email=?, Phone=?, [Address]=?, [Role]=?, IsActive=? WHERE UserID=?";
    try(Connection conn = DBcontext.getConnection()) {
        try(PreparedStatement pst = conn.prepareStatement(QUERY)) {
            pst.setString(1, user.getUsername());
            pst.setString(2, user.getPassword());
            pst.setString(3, user.getName());
            pst.setString(4, user.getEmail());
            pst.setString(5, user.getPhone());
            pst.setString(6, user.getAddress());
            pst.setString(7, user.getRole());
            pst.setBoolean(8, user.isIsActive());
            pst.setInt(9, user.getId());
            int rowsAffected = pst.executeUpdate();
            return rowsAffected > 0;
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
    return false;
}
    public static void main(String[] args) {
//        listUsers().forEach(p -> System.out.println(p));
//        System.out.println(searchUser("admin1"));
//        System.out.println(registerUser(new User("nguyengiaphuongtuan1@gmail.com", "01234567893", "tuantuan2", "tuantuan")));
        getPagging(1, 10).forEach(p -> System.out.println(p));
    }
}
