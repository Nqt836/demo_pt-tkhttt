package com.demo.model;

public class SystemUser {
    private String userId;
    private String userName;
    private String password;
    private String fullname;
    private String address;
    private String email;
    private String phone;

    // Constructor rỗng
    public SystemUser() {
    }

    // Constructor đăng nhập
    public SystemUser(String userName, String password) {
        this.userName = userName;
        this.password = password;
    }

    // Constructor đầy đủ
    public SystemUser(String userId, String userName, String password, String fullname, String address, String email, String phone) {
        this.userId = userId;
        this.userName = userName;
        this.password = password;
        this.fullname = fullname;
        this.address = address;
        this.email = email;
        this.phone = phone;
    }

    // Getter and Setter
    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }
}
