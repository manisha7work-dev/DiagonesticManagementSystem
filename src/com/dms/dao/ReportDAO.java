package com.dms.dao;

import com.dms.model.Report;
import java.sql.*;
import java.util.*;

public class ReportDAO {

    // ➕ Add a new report
    public boolean addReport(Report r) {
        boolean success = false;
        try (Connection con = DBConnection.getConnection()) {
            String sql = "INSERT INTO reports (appointment_id, file_path, comments) VALUES (?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, r.getAppointmentId());
            ps.setString(2, r.getFilePath());
            ps.setString(3, r.getComments());
            success = ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return success;
    }

    // 📋 Get all reports
    public List<Report> getAllReports() {
        List<Report> list = new ArrayList<>();
        try (Connection con = DBConnection.getConnection()) {
            String sql = "SELECT * FROM reports";
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Report r = new Report();
                r.setReportId(rs.getInt("report_id"));
                r.setAppointmentId(rs.getInt("appointment_id"));
                r.setFilePath(rs.getString("file_path"));
                r.setUploadedAt(rs.getString("uploaded_at"));
                r.setComments(rs.getString("comments"));
                list.add(r);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    // 🔍 Get report by appointment
    public Report getReportByAppointment(int appointmentId) {
        Report r = null;
        try (Connection con = DBConnection.getConnection()) {
            String sql = "SELECT * FROM reports WHERE appointment_id=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, appointmentId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                r = new Report();
                r.setReportId(rs.getInt("report_id"));
                r.setAppointmentId(rs.getInt("appointment_id"));
                r.setFilePath(rs.getString("file_path"));
                r.setUploadedAt(rs.getString("uploaded_at"));
                r.setComments(rs.getString("comments"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return r;
    }

    // 🗑 Delete report
    public boolean deleteReport(int reportId) {
        boolean success = false;
        try (Connection con = DBConnection.getConnection()) {
            String sql = "DELETE FROM reports WHERE report_id=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, reportId);
            success = ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return success;
    }
}