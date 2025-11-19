package com.demo.dao;

import com.demo.model.Supplier;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.ArrayList;


public class SupplierDAO extends DAO {

    // Danh sách nhà cung cấp
    public List<Supplier> getListSupplier(String supplierName, String date) {
        List<Supplier> listSupplier = new ArrayList<>();

        String sql = "SELECT * FROM tblSupplier WHERE 1=1"; // 1=1 là mẹo để có thể nôi AND ở sau

        // Tìm kiếm theo tên
        if(supplierName != null && !supplierName.isEmpty()){
            sql += " AND LOWER (supplierName) LIKE LOWER(?)"; // thêm lower để tìm theo tiếng việt khoog phân biệt hoa thường
        }
        // Tìm kiếm theo ngày/tháng/năm, tháng/năm, năm
        if (date != null && !date.isEmpty()){
            sql +=  " AND (" +
                    " strftime('%d/%m/%Y', addedDate) = ? OR " +
                    " strftime('%m/%Y', addedDate) = ? OR " +
                    " strftime('%Y', addedDate) = ? " +
                    ")";
        }

        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            int index = 1; // Thiết lập index (dấu ?) theo đúng thứ tự

            if (supplierName != null && !supplierName.isEmpty()) {
                ps.setString(index++, "%" + supplierName + "%");
            }

            if (date != null && !date.isEmpty()) {
                ps.setString(index++, date); // ? cho ngày/tháng/năm
                ps.setString(index++, date); // ? cho tháng/năm
                ps.setString(index++, date); // ? cho năm
            }

            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Supplier supplier = new Supplier(
                            rs.getString("supplierId"),
                            rs.getString("supplierName"),
                            rs.getString("address"),
                            rs.getString("phone"),
                            rs.getString("email"),
                            rs.getString("addedDate"),
                            rs.getString("taxCode"),
                            rs.getString("description")
                    );
                    listSupplier.add(supplier);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            System.err.println("Lỗi khi lấy danh sách Supplier: " + e.getMessage());
        }
        return listSupplier;
    }

    // Thêm nhà cung cấp
    public boolean addSupplier(Supplier supplier) {
        String sql = "INSERT INTO tblSupplier VALUES(?, ?, ?, ?, ?, ?, ?, ?)";
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)){
            ps.setString(1, supplier.getSupplierId());
            ps.setString(2, supplier.getSupplierName());
            ps.setString(3, supplier.getAddress());
            ps.setString(4, supplier.getEmail());
            ps.setString(5, supplier.getPhone());
            ps.setString(6, supplier.getAddedDate());
            ps.setString(7, supplier.getTaxCode());
            ps.setString(8, supplier.getDescription());

            int rowAffected = ps.executeUpdate();
            return  rowAffected > 0; // nếu số hàng ảnh hưởng > 0 thì đã thêm thành công

        } catch (Exception e) {
            e.printStackTrace();
            System.err.println("Lỗi khi thêm Supplier " + e.getMessage() );
            return false;
        }
    }
}
