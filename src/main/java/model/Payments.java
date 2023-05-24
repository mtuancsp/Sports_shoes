package model;

import java.security.Timestamp;

public class Payments {
    private int payment_id;
    private String payment_method;
    private int order_id;
    private int amount;
    private Timestamp payment_date;

    public Payments() {
    }

    public Payments(int payment_id, String payment_method, int order_id, int amount, Timestamp payment_date) {
        this.payment_id = payment_id;
        this.payment_method = payment_method;
        this.order_id = order_id;
        this.amount = amount;
        this.payment_date = payment_date;
    }

    public int getPayment_id() {
        return payment_id;
    }

    public void setPayment_id(int payment_id) {
        this.payment_id = payment_id;
    }

    public String getPayment_method() {
        return payment_method;
    }

    public void setPayment_method(String payment_method) {
        this.payment_method = payment_method;
    }

    public int getOrder_id() {
        return order_id;
    }

    public void setOrder_id(int order_id) {
        this.order_id = order_id;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    public Timestamp getPayment_date() {
        return payment_date;
    }

    public void setPayment_date(Timestamp payment_date) {
        this.payment_date = payment_date;
    }
}
