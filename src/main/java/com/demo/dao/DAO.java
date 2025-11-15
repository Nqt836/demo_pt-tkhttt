package com.demo.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DAO {
    private static final String JDBC_URL = "jdbc:sqlite:C:/Users/5550/Documents/demo/database.db";

    public static Connection getConnection(){
        Connection conn = null;
        try {
            Class.forName("org.sqlite.JDBC");
            conn = DriverManager.getConnection(JDBC_URL);
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            System.err.println("Lỗi kết nối: " +  e.getMessage());
        }
        return conn;
    }
}
