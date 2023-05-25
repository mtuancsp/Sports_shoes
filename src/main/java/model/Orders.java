package model;

import java.security.Timestamp;

public class Orders {
    private int order_id;
    private Timestamp order_date;
    private Timestamp shipped_date;
    private String status;
    private String comment;
    private int user_id;


    public Orders() {
    }

    public Orders(int order_id, Timestamp order_date,Timestamp shipped_date, String status, String comment, int user_id, int payment_id) {
        this.order_id = order_id;
        this.order_date = order_date;
        this.status = status;
        this.comment = comment;
        this.user_id = user_id;
    }

    public Timestamp getShipped_date() {
        return shipped_date;
    }

    public void setShipped_date(Timestamp shipped_date) {
        this.shipped_date = shipped_date;
    }

    public int getOrder_id() {
        return order_id;
    }

    public void setOrder_id(int order_id) {
        this.order_id = order_id;
    }

    public Timestamp getOrder_date() {
        return order_date;
    }

    public void setOrder_date(Timestamp order_date) {
        this.order_date = order_date;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

}
