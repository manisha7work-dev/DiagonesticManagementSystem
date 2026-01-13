<%@ page language="java" 
         contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.dms.model.Analyst" %>
<%@ page import="com.dms.dao.AppointmentDAO" %>
<%@ page import="com.dms.model.Appointment" %>
<%
    Analyst analyst = (Analyst) session.getAttribute("analyst");

    if (analyst == null) {
        response.sendRedirect("analyst_login.jsp");
        return;
    }

    int analystId = analyst.getAnalystId();

    AppointmentDAO dao = new AppointmentDAO();
    List<Appointment> list = dao.getAppointmentsForAnalyst(analystId);
%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>My Assigned Tests</title>

  <!-- Bootstrap -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@600&family=Inter:wght@300;400;500&display=swap" rel="stylesheet">

  <style>
    body {
      font-family: 'Inter', sans-serif;
      background: linear-gradient(135deg, #e3f2fd, #ffffff);
      min-height: 100vh;
    }

    .navbar {
      background: linear-gradient(90deg, #0052ff, #00c6ff);
      box-shadow: 0 8px 20px rgba(0,0,0,0.1);
    }

    .glass-card {
      background: rgba(255,255,255,0.95);
      backdrop-filter: blur(15px);
      border-radius: 20px;
      padding: 35px 30px;
      box-shadow: 0 25px 60px rgba(0,0,0,0.08);
      border-top: 6px solid #0052ff;
      margin-top: 50px;
      animation: fadeIn 0.8s ease-in-out;
    }

    @keyframes fadeIn {
      from {opacity:0; transform:translateY(20px);}
      to {opacity:1; transform:translateY(0);}
    }

    .page-title {
      font-family: 'Playfair Display', serif;
      color: #0052ff;
      text-align: center;
      margin-bottom: 5px;
    }

    .page-subtitle {
      text-align: center;
      color: #555;
      font-size: 14px;
      margin-bottom: 25px;
    }

    table {
      border-radius: 18px;
      overflow: hidden;
      background: white;
      box-shadow: 0 5px 15px rgba(0,0,0,0.05);
    }

    thead {
      background-color: #eef5ff;
      color: #0052ff;
      font-weight: 600;
      font-size: 14px;
    }

    tbody tr {
      transition: all 0.2s ease;
      cursor: pointer;
    }

    tbody tr:hover {
      background-color: #f0f8ff;
      transform: scale(1.003);
    }

    .status-badge {
      padding: 5px 12px;
      border-radius: 20px;
      font-size: 12px;
      font-weight: 500;
    }

    .status-pending { background: #fff3cd; color: #856404; }
    .status-completed { background: #d4edda; color: #155724; }
    .status-inprogress { background: #cce5ff; color: #004085; }

    .upload-btn {
      background: linear-gradient(to right, #0052ff, #00c6ff);
      border: none;
      color: white;
      font-size: 13px;
      font-weight: 600;
      border-radius: 25px;
      padding: 7px 16px;
      box-shadow: 0 10px 20px rgba(0,82,255,0.3);
      transition: 0.2s ease;
    }

    .upload-btn:hover {
      transform: translateY(-2px);
      box-shadow: 0 15px 25px rgba(0,82,255,0.45);
    }

    .no-data {
      text-align: center;
      padding: 25px;
      color: #aaa;
      font-size: 14px;
    }

    @media (max-width: 768px) {
      .table-responsive { overflow-x: auto; }
    }
  </style>
</head>

<body>

<nav class="navbar navbar-expand-lg navbar-dark">
  <div class="container-fluid px-4">
    <a class="navbar-brand fw-bold" href="dashboard_analyst.jsp">🧪 Analyst Dashboard</a>
    <a href="LogoutServlet" class="btn btn-light btn-sm rounded-pill px-3">Logout</a>
  </div>
</nav>

<div class="container">
  <div class="row justify-content-center">
    <div class="col-lg-11">
      <div class="glass-card">
        <h3 class="page-title">My Assigned Tests</h3>
        <div class="page-subtitle">Track and upload reports for your assigned patients</div>

        <div class="table-responsive">
        <table class="table table-borderless align-middle">
          <thead>
            <tr>
              <th>ID</th>
              <th>Patient</th>
              <th>Test</th>
              <th>Date</th>
              <th>Time</th>
              <th>Status</th>
              <th class="text-center">Action</th>
            </tr>
          </thead>
          <tbody>

          <% if (list == null || list.isEmpty()) { %>
            <tr>
              <td colspan="7" class="no-data">No assigned tests available.</td>
            </tr>
          <% } else {
               for (Appointment a : list) {
                   String statusClass = "";
                   switch(a.getStatus().toLowerCase()) {
                       case "pending": statusClass="status-pending"; break;
                       case "completed": statusClass="status-completed"; break;
                       case "in progress": statusClass="status-inprogress"; break;
                       default: statusClass="status-pending";
                   }
          %>
            <tr>
              <td>#<%= a.getAppointmentId() %></td>
              <td><%= a.getPatientId() %></td>
              <td><%= a.getTestId() %></td>
              <td><%= a.getAppointmentDate() %></td>
              <td><%= a.getAppointmentTime() %></td>
              <td><span class="status-badge <%= statusClass %>"><%= a.getStatus() %></span></td>
              <td class="text-center">
                <a href="upload_report.jsp?appointmentId=<%= a.getAppointmentId() %>" 
                   class="btn upload-btn btn-sm">
                   📤 Upload
                </a>
              </td>
            </tr>
          <% } } %>

          </tbody>
        </table>
        </div>

      </div>
    </div>
  </div>
</div>
<!-- Footer -->
<footer class="text-center text-muted py-3">
    <small>© 2025 Diagnostic Management System</small>
</footer>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
