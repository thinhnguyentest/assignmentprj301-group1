/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

package entity.Order;

import entity.Product.Book;
import java.util.ArrayList;
import java.util.List;

public class ShoppingCart {

    private List<CartItem> items;

    public ShoppingCart() {
        items = new ArrayList<>();
    }

    public void addItem(Book book, int quantity) {
        // Check if book already exists in cart 
        for(CartItem item : items) {
            if(item.getBook().getId() == book.getId()) {
                item.setQuantity(item.getQuantity() + quantity);
                return;
            }
        }
        // Book not in cart, add new item 
        CartItem cartItem = new CartItem(book, quantity);
        items.add(cartItem);
    }

    public void removeItem(int bookId) {
        for(CartItem item : items) {
            if(item.getBook().getId() == bookId) {
                items.remove(item);
                return; 
            }
        }
    }

    public float getTotal() {
        float total = 0;
        for(CartItem item : items) {
            Book book = item.getBook();
            total += book.getPrice() * item.getQuantity();
        }
        return total;
    }

    public List<CartItem> getItems() {
        return items; 
    }
}