package model;

import java.security.Timestamp;

public class Products {
    private int product_id;
    private String product_name;
    private int price;
    private String description;
    private int user_id;
    private int category_id;
    private int quantity_in_stock;
    private java.sql.Timestamp created_at;

    public Products() {
    }

    public Products(int product_id, String product_name, int price, String description, int user_id, int category_id, int quantityInStock, java.sql.Timestamp created_at) {
        this.product_id = product_id;
        this.product_name = product_name;
        this.price = price;
        this.description = description;
        this.user_id = user_id;
        this.category_id = category_id;
        this.quantity_in_stock = quantityInStock;
        this.created_at = created_at;
    }

    public int getProduct_id() {
        return product_id;
    }

    public void setProduct_id(int product_id) {
        this.product_id = product_id;
    }

    public String getProduct_name() {
        return product_name;
    }

    public void setProduct_name(String product_name) {
        this.product_name = product_name;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public int getCategory_id() {
        return category_id;
    }

    public void setCategory_id(int category_id) {
        this.category_id = category_id;
    }

    public int getQuantity_in_stock() {
        return quantity_in_stock;
    }

    public void setQuantity_in_stock(int quantity_in_stock) {
        this.quantity_in_stock = quantity_in_stock;
    }

    public java.sql.Timestamp getCreated_at() {
        return created_at;
    }

    public void setCreated_at(java.sql.Timestamp created_at) {
        this.created_at = created_at;
    }
}
