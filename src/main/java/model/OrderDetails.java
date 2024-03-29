package model;

public class OrderDetails {
    private int order_id;
    private int product_id;
    private int quantity;

    public int getOrder_id() {
        return order_id;
    }

    public void setOrder_id(int order_id) {
        this.order_id = order_id;
    }

    public int getProduct_id() {
        return product_id;
    }

    public void setProduct_id(int product_id) {
        this.product_id = product_id;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public OrderDetails(int order_id, int quantity) {
        this.order_id = order_id;
        this.quantity = quantity;
    }

    public OrderDetails() {
    }
}
