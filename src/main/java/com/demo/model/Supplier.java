package com.demo.model;

import java.util.Date;

public class Supplier {
    private String supplierId;
    private String supplierName;
    private String address;
    private String email;
    private String phone;
    private String addedDate;
    private String taxCode;
    private String description;

    // Constructor rỗng
    public Supplier() {}

    // Constructor đầy đủ
    public Supplier(String supplierId, String supplierName, String address, String email, String phone, String addedDate, String taxCode, String description) {
        this.supplierId = supplierId;
        this.supplierName = supplierName;
        this.address = address;
        this.email = email;
        this.phone = phone;
        this.addedDate = addedDate;
        this.taxCode = taxCode;
        this.description = description;
    }

    //Getter and Setter

    public String getSupplierId() {
        return supplierId;
    }

    public void setSupplierId(String supplierId) {
        this.supplierId = supplierId;
    }

    public String getSupplierName() {
        return supplierName;
    }

    public void setSupplierName(String supplierName) {
        this.supplierName = supplierName;
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

    public String getAddedDate() {
        return addedDate;
    }

    public void setAddedDate(String addedDate) {
        this.addedDate = addedDate;
    }

    public String getTaxCode() {
        return taxCode;
    }

    public void setTaxCode(String taxCode) {
        this.taxCode = taxCode;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}
