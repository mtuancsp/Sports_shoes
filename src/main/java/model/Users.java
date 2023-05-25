package model;

import java.sql.Timestamp;
import java.util.Date;

public class Users {
    private int user_id;
    private String username;
    private String password;
    private String phone;
    private String email;
    private String role;
    private String full_name;
    private Date birthday;
    private String avatar_path;
    private Timestamp created_at;
    private String status;

    public Users(int user_id, String username, String password, String phone, String email, String role, String full_name, Date birthday, String avatar_path, java.sql.Timestamp created_at, String status) {
        this.user_id = user_id;
        this.username = username;
        this.password = password;
        this.phone = phone;
        this.email = email;
        this.role = role;
        this.full_name = full_name;
        this.birthday = birthday;
        this.avatar_path = avatar_path;
        this.created_at = created_at;
        this.status = status;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
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

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public String getFull_name() {
        return full_name;
    }

    public void setFull_name(String full_name) {
        this.full_name = full_name;
    }

    public Date getBirthday() {
        return birthday;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    public String getAvatar_path() {
        return avatar_path;
    }

    public void setAvatar_path(String avatar_path) {
        this.avatar_path = avatar_path;
    }

    public java.sql.Timestamp getCreated_at() {
        return created_at;
    }

    public void setCreated_at(java.sql.Timestamp created_at) {
        this.created_at = created_at;
    }
    public String getStatus() {
        return status;
    }
    public void setStatus(String status) {
        this.status = status;
    }
}