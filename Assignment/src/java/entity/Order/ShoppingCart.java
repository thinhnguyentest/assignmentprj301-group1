package entity.Order;

import entity.Product.Book;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public class ShoppingCart {

    private List<CartItem> items;

    public ShoppingCart() {
        items = new ArrayList<>();
    }

    public void addItem(Book book, int quantity) {
        // Check if book already exists in cart 
        for (CartItem item : items) {
            if (item.getBook().getId() == book.getId()) {
                item.setQuantity(item.getQuantity() + quantity);
                return;
            }
        }
        // Book not in cart, add new item 
        CartItem cartItem = new CartItem(book, quantity);
        items.add(cartItem);
    }

    public void removeItem(int bookId) {
        Iterator<CartItem> iterator = items.iterator();
        while (iterator.hasNext()) {
            CartItem item = iterator.next();
            if (item.getBook().getId() == bookId) {
                iterator.remove();
                return;
            }
        }
    }

    public void updateQuantity(int bookId, int newQuantity) {
        for (CartItem item : items) {
            if (item.getBook().getId() == bookId) {
                item.setQuantity(newQuantity);
                return;
            }
        }
    }

    public void clear() {
        items.clear();
    }

    public float getTotal() {
        float total = 0;
        for (CartItem item : items) {
            Book book = item.getBook();
            total += book.getPrice() * item.getQuantity();
        }
        return total;
    }

    public int getTotalQuantity() {
        int totalQuantity = 0;
        for (CartItem item : items) {
            totalQuantity += item.getQuantity();
        }
        return totalQuantity;
    }

    public List<CartItem> getItems() {
        return items;
    }
}
