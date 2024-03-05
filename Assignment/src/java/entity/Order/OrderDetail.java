
package entity.Order;

import entity.Product.Book;

public class OrderDetail {

    int OrderDetailId;
    int OrderId;
    Book book;
    int quantity;
    Float price;
    int discountId;
    public OrderDetail() {
    }

    public OrderDetail(int detailId, int billId, Book book, int quantity, Float price, int discountId) {
        this.OrderDetailId = detailId;
        this.OrderId = billId;
        this.book = book;
        this.quantity = quantity;
        this.price = price;
        this.discountId = discountId;
    }

    public OrderDetail(int detailId, int billId, Book book, int quantity, Float price) {
        this.OrderDetailId = detailId;
        this.OrderId = billId;
        this.book = book;
        this.quantity = quantity;
        this.price = price;
    }

    public int getOrderDetailId() {
        return OrderDetailId;
    }

    public void setOrderDetailId(int OrderDetailId) {
        this.OrderDetailId = OrderDetailId;
    }

    public int getOrderId() {
        return OrderId;
    }

    public void setOrderId(int OrderId) {
        this.OrderId = OrderId;
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

    public Float getPrice() {
        return price;
    }

    public void setPrice(Float price) {
        this.price = price;
    }

    public int getDiscountId() {
        return discountId;
    }

    public void setDiscountId(int discountId) {
        this.discountId = discountId;
    }


  

  

}
