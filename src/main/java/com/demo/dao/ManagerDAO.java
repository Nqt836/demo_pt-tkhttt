package com.demo.dao;

import com.demo.model.Manager;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


public class ManagerDAO extends DAO {
    public Manager getManagerInfor(String userId) throws SQLException {
        String sql = "SELECT * FROM tblSystemUser u " +
                "JOIN tblManager m ON u.userId = m.\"tblSystemUser/userId\" " +
                "WHERE u.userId = ?";
        Connection conn = getConnection();
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, userId);
        ResultSet rs = ps.executeQuery();
        if(rs.next()) {
            return new Manager(
                    rs.getString("userId"),
                    rs.getString("userName"),
                    rs.getString("password"),
                    rs.getString("fullname"),
                    rs.getString("address"),
                    rs.getString("email"),
                    rs.getString("phone"),
                    rs.getString("jobPosition")
            );
        }
        return null;
    }
}
