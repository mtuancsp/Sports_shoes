package model;

import java.security.Timestamp;

public class Reviews {
    private int order_id;
    private int rating;
    private String review;
    private int product_id;
    private Timestamp created_at;

    public Reviews() {
    }

    public Reviews(int review_id, int rating, String review, int product_id, Timestamp created_at) {
        this.order_id = review_id;
        this.rating = rating;
        this.review = review;
        this.product_id = product_id;
        this.created_at = created_at;
    }

    public int getOrder_id() {
        return order_id;
    }

    public void setOrder_id(int order_id) {
        this.order_id = order_id;
    }

    public int getRating() {
        return rating;
    }

    public void setRating(int rating) {
        this.rating = rating;
    }

    public String getReview() {
        return review;
    }

    public void setReview(String review) {
        this.review = review;
    }

    public int getProduct_id() {
        return product_id;
    }

    public void setProduct_id(int product_id) {
        this.product_id = product_id;
    }

    public Timestamp getCreated_at() {
        return created_at;
    }

    public void setCreated_at(Timestamp created_at) {
        this.created_at = created_at;
    }
}
