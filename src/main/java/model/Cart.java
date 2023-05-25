package model;

import java.sql.Timestamp;

public class Cart {
    private int user_id;
    private int product_id;
    private int quantity;
    private Timestamp created_at;


    public Cart( int user_id, int product_id, int quantity, java.sql.Timestamp created_at) {
        this.user_id = user_id;
        this.product_id = product_id;
        this.quantity = quantity;
        this.created_at = created_at;
    }


    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
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

    public Timestamp getCreated_at() {
        return created_at;
    }

    public void setCreated_at(Timestamp created_at) {
        this.created_at = created_at;
    }
}
