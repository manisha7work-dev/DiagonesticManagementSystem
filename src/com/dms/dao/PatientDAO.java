package com.dms.dao;

import com.dms.model.Patient;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class PatientDAO {

    // Insert a new patient
    public boolean addPatient(Patient p) {
        boolean success = false;
        try (Connection con = DBConnection.getConnection()) {
            String sql = "INSERT INTO patients (name, email, password, phone, gender, age, address) VALUES (?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, p.getName());
            ps.setString(2, p.getEmail());
            ps.setString(3, p.getPassword());  
            ps.setString(4, p.getPhone());
            ps.setString(5, p.getGender());
            ps.setInt(6, p.getAge());
            ps.setString(7, p.getAddress());
            success = ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return success;
    }

    // Retrieve all patients
    public List<Patient> getAllPatients() {
        List<Patient> list = new ArrayList<>();
        try (Connection con = DBConnection.getConnection()) {
            String sql = "SELECT * FROM patients";
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Patient p = new Patient();
                p.setPatientId(rs.getInt("patient_id"));
                p.setName(rs.getString("name"));
                p.setEmail(rs.getString("email"));
                p.setPassword(rs.getString("password"));  
                p.setPhone(rs.getString("phone"));
                p.setGender(rs.getString("gender"));
                p.setAge(rs.getInt("age"));
                p.setAddress(rs.getString("address"));
                p.setCreatedAt(rs.getString("created_at")); 
                list.add(p);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    // Delete patient by ID
    public boolean deletePatient(int id) {
        boolean success = false;
        try (Connection con = DBConnection.getConnection()) {
            String sql = "DELETE FROM patients WHERE patient_id=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            success = ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return success;
    }

    // 🔹 Validate login (for patient login functionality)
    public Patient validatePatient(String email, String password) {
        Patient p = null;
        try (Connection con = DBConnection.getConnection()) {
            String sql = "SELECT * FROM patients WHERE email=? AND password=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, email);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                p = new Patient();
                p.setPatientId(rs.getInt("patient_id"));
                p.setName(rs.getString("name"));
                p.setEmail(rs.getString("email"));
                p.setPhone(rs.getString("phone"));
                p.setGender(rs.getString("gender"));
                p.setAge(rs.getInt("age"));
                p.setAddress(rs.getString("address"));
                p.setCreatedAt(rs.getString("created_at"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return p;
    }
}