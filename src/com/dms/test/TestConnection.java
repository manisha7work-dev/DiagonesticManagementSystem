package com.dms.test;

import java.sql.Connection;

import com.dms.dao.DBConnection;

public class TestConnection {
    public static void main(String[] args) {
        try {
            Connection con = DBConnection.getConnection();        //sending req to create a new obj 
            if (con != null) {
                System.out.println("✅ Database connected successfully!");
                con.close();
            }
        } catch (Exception e) {
            System.out.println("❌ Database connection failed!");
            e.printStackTrace();
        }
    }
}