
package entity.Order;

import entity.Account.User;
import entity.Product.Book;

/*
 * @author tuanngp
 */
public class Cart {
    private int cartId;
    private User userInfo;
    private Book book;
    private int quantity;

    public Cart() {
    }

    public Cart(int cartId, User userInfo, Book book, int quantity) {
        this.cartId = cartId;
        this.userInfo = userInfo;
        this.book = book;
        this.quantity = quantity;
    }
   
    public int getCartId() {
        return cartId;
    }

    public void setCartId(int cartId) {
        this.cartId = cartId;
    }

    public User getUser() {
        return userInfo;
    }

    public void setUser(User userInfo) {
        this.userInfo = userInfo;
    }

    public Book getBook() {
        return book;
    }

    public void setBook(Book book) {
        this.book = book;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    @Override
    public String toString() {
        return "Cart{" + "cartId=" + cartId + ", userInfo=" + userInfo + ", book=" + book + ", quantity=" + quantity + '}';
    }


}
