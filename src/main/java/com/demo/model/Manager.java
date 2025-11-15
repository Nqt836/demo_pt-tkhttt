package com.demo.model;

public class Manager extends SystemUser {
    private String jobPosition;

    // Constructor rỗng
    public Manager() {
        super(); // Gọi constructor của lớp SystemUser
    }

    // Constructor đầy đủ
    public Manager(String userId, String userName, String password, String fullname, String address, String email, String phone, String jobPosition) {
        super(userId, userName, password, fullname, address, email, phone);
        this.jobPosition = jobPosition;
    }

    // Getter and Setter
    public String getJobPosition() {
        return jobPosition;
    }

    public void setJobPosition(String jobPosition) {
        this.jobPosition = jobPosition;
    }


}
