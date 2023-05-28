package model;

public class Products implements Comparable<Products>{
    private int product_id;
    private String product_name;
    private int price;
    private String description;
    private String supplier;
    private String category;
    private int quantity_in_stock;
    private java.sql.Timestamp created_at;
    private String image;
    public Products() {
    }
    public Products(String product_name,int price,String description,String supplier,String category, int quantity_in_stock, String image) {
        this.product_name = product_name;
        this.price = price;
        this.description = description;
        this.supplier = supplier;
        this.category = category;
        this.quantity_in_stock = quantity_in_stock;
        this.image = image;
    }

    public Products(int product_id, String product_name, int price, String description, String supplier, String category, int quantityInStock, java.sql.Timestamp created_at, String image) {
        this.product_id = product_id;
        this.product_name = product_name;
        this.price = price;
        this.description = description;
        this.supplier = supplier;
        this.category = category;
        this.quantity_in_stock = quantityInStock;
        this.created_at = created_at;
        this.image = image;
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

    public String getSupplier() {
        return supplier;
    }

    public void setSupplier(String supplier) {
        this.supplier = supplier;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
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
    public String getImage() {
        return image;
    }
    public void setImage(String image) {
        this.image = image;
    }
    @Override
    public String toString() {
        return "Products{" +
                "product_id=" + product_id +
                ", product_name='" + product_name + '\'' +
                ", price=" + price +
                ", description='" + description + '\'' +
                ", supplier='" + supplier + '\'' +
                ", category='" + category + '\'' +
                ", quantity_in_stock=" + quantity_in_stock +
                ", created_at=" + created_at +
                ", image='" + image + '\'' +
                '}';
    }

    @Override
    public int compareTo(Products o) {
        return this.product_id - o.product_id;
    }
}
