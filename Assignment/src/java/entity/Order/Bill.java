package entity.Order;

import entity.Account.User;
import java.math.BigDecimal;
import java.sql.Timestamp;

public class Bill {

    private int MaHD;
    private int bookId;
    private int quantity;
    private int DiscountId;
    private double price;
    private String typePay;
    private Timestamp timeNow;

    public Bill() {
    }

    public Bill(int MaHD, int bookId, int quantity, int DiscountId, double price, String typePay, Timestamp timeNow) {
        this.MaHD = MaHD;
        this.bookId = bookId;
        this.quantity = quantity;
        this.DiscountId = DiscountId;
        this.price = price;
        this.typePay = typePay;
        this.timeNow = timeNow;
    }

    public int getMaHD() {
        return MaHD;
    }

    public void setMaHD(int MaHD) {
        this.MaHD = MaHD;
    }

    public int getBookId() {
        return bookId;
    }

    public void setBookId(int bookId) {
        this.bookId = bookId;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getDiscountId() {
        return DiscountId;
    }

    public void setDiscountId(int DiscountId) {
        this.DiscountId = DiscountId;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getTypePay() {
        return typePay;
    }

    public void setTypePay(String typePay) {
        this.typePay = typePay;
    }

    public Timestamp getTimeNow() {
        return timeNow;
    }

    public void setTimeNow(Timestamp timeNow) {
        this.timeNow = timeNow;
    }

    @Override
    public String toString() {
        return "HoaDon{" + "MaHD=" + MaHD + ", bookId=" + bookId + ", quantity=" + quantity + ", DiscountId=" + DiscountId + ", price=" + price + ", typePay=" + typePay + ", timeNow=" + timeNow + '}';
    }

    
}