package com.demo.dao;

import com.demo.model.Supplier;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.ArrayList;

public class SupplierDAO extends DAO {

    //Lấy danh sách
    public List<Supplier> getListSupplier(String supplierName, String date) {
        List<Supplier> listSupplier = new ArrayList<>();
        String sql = "SELECT * FROM tblSupplier WHERE 1=1"; // 1=1 là mẹo để nối AND đằng sau

        if(supplierName != null && !supplierName.isEmpty()){
            sql += " AND LOWER(supplierName) LIKE LOWER(?)";
        }
        if (date != null && !date.isEmpty()){
            sql +=  " AND (" +
                    " strftime('%d/%m/%Y', addedDate) = ? OR " +
                    " strftime('%m/%Y', addedDate) = ? OR " +
                    " strftime('%Y', addedDate) = ? " +
                    ")";
        }

        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            int index = 1;
            if (supplierName != null && !supplierName.isEmpty()) {
                ps.setString(index++, "%" + supplierName + "%");
            }
            if (date != null && !date.isEmpty()) {
                ps.setString(index++, date);
                ps.setString(index++, date);
                ps.setString(index++, date);
            }

            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    listSupplier.add(new Supplier(
                            rs.getString("supplierId"),
                            rs.getString("supplierName"),
                            rs.getString("address"),
                            rs.getString("email"),
                            rs.getString("phone"),
                            rs.getString("addedDate"),
                            rs.getString("taxCode"),
                            rs.getString("description")
                    ));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return listSupplier;
    }

    // Kiểm tra trùng lặp
    public String checkDuplicate(String id, String email, String phone) {
        String sql = "SELECT * FROM tblSupplier WHERE supplierId = ? OR email = ? OR phone = ?";

        // BẮT BUỘC DÙNG CẤU TRÚC NÀY
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, id);
            ps.setString(2, email);
            ps.setString(3, phone);

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    if (rs.getString("supplierId").equalsIgnoreCase(id)) return "ID";
                    if (rs.getString("email").equalsIgnoreCase(email)) return "Email";
                    if (rs.getString("phone").equals(phone)) return "Phone";
                    return "Duplicate";
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return null;
    }

    // Thêm mới nhà cung cấp
    public boolean addSupplier(Supplier s) {
        String sql = "INSERT INTO tblSupplier (supplierId, supplierName, address, email, phone, addedDate, taxCode, description) VALUES(?, ?, ?, ?, ?, ?, ?, ?)";

        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)){

            ps.setString(1, s.getSupplierId());
            ps.setString(2, s.getSupplierName());
            ps.setString(3, s.getAddress());
            ps.setString(4, s.getEmail());
            ps.setString(5, s.getPhone());
            ps.setString(6, s.getAddedDate());
            ps.setString(7, s.getTaxCode());
            ps.setString(8, s.getDescription());

            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}