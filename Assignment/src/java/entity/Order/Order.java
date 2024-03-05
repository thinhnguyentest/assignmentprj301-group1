
package entity.Order;

public class Order {
    private int orderId;
    private String orderDate;
    private double orderAmount;
    private int userId;
    private int shippingMethodId;

    public Order() {
    }

    public Order(String orderDate, double orderAmount, int userId, int shippingMethodId) {
        this.orderDate = orderDate;
        this.orderAmount = orderAmount;
        this.userId = userId;
        this.shippingMethodId = shippingMethodId;
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public String getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(String orderDate) {
        this.orderDate = orderDate;
    }

    public double getOrderAmount() {
        return orderAmount;
    }

    public void setOrderAmount(double orderAmount) {
        this.orderAmount = orderAmount;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getShippingMethodId() {
        return shippingMethodId;
    }

    public void setShippingMethodId(int shippingMethodId) {
        this.shippingMethodId = shippingMethodId;
    }

}
