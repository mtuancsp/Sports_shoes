package model;

public class Addresses {
    private int address_id;
    private int user_id;
    private String details;
    private String ward;
    private String district;
    private String city;

    public Addresses() {
    }

    public Addresses(int address_id, int user_id, String details, String ward, String district, String city) {
        this.address_id = address_id;
        this.user_id = user_id;
        this.details = details;
        this.ward = ward;
        this.district = district;
        this.city = city;
    }

    public int getAddress_id() {
        return address_id;
    }

    public void setAddress_id(int address_id) {
        this.address_id = address_id;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public String getDetails() {
        return details;
    }

    public void setDetails(String details) {
        this.details = details;
    }

    public String getWard() {
        return ward;
    }

    public void setWard(String ward) {
        this.ward = ward;
    }

    public String getDistrict() {
        return district;
    }

    public void setDistrict(String district) {
        this.district = district;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }
}
