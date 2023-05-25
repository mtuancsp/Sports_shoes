package model;

public class Suppliers {
    private int supplier_id;
    private String supplier_name;
    private String phone;
    private String email;

    public Suppliers(int supplier_id, String supplier_name, String phone, String email) {
        this.supplier_id = supplier_id;
        this.supplier_name = supplier_name;
        this.phone = phone;
        this.email = email;
    }

    public int getSupplier_id() {
        return supplier_id;
    }

    public void setSupplier_id(int supplier_id) {
        this.supplier_id = supplier_id;
    }

    public String getSupplier_name() {
        return supplier_name;
    }

    public void setSupplier_name(String supplier_name) {
        this.supplier_name = supplier_name;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
}
