package com.demo.dao;

import com.demo.model.SystemUser;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class SystemUserDAO extends DAO{
    public SystemUser checkLogin(String username, String password) throws SQLException {
        String sql = "SELECT * FROM tblSystemUser WHERE username = ? AND password = ?";
        Connection conn = getConnection();
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, username);
        ps.setString(2, password);
        ResultSet rs = ps.executeQuery();
        if(rs.next()){ // Nếu tìm thấy một bản ghi => true
            return new SystemUser( // Tạo đối tượng SystemUser từ dữ liệu
                    rs.getString("userId"),
                    rs.getString("userName"),
                    rs.getString("password"),
                    rs.getString("fullname"),
                    rs.getString("address"),
                    rs.getString("email"),
                    rs.getString("phone")

            );
        }
        return null;
    }
}
