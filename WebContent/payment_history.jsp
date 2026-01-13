

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.dms.dao.PaymentDAO" %>
<%@ page import="com.dms.model.Payment" %>
<%@ page import="com.dms.model.Patient" %>

<%
    Patient patient = (Patient) session.getAttribute("patient");
    if (patient == null) {
        response.sendRedirect("patient_login.jsp");
        return;
    }
    int patientId = patient.getPatientId();

    PaymentDAO dao = new PaymentDAO();
    List<Payment> payments = dao.getPaymentsByPatient(patientId);
%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Payment History - DMS</title>

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

    .navbar-brand {
      font-family: 'Playfair Display', serif;
    }

    .glass-card {
      background: rgba(255,255,255,0.97);
      backdrop-filter: blur(10px);
      border-radius: 20px;
      padding: 35px 30px;
      box-shadow: 0 25px 60px rgba(0,0,0,0.08);
      border-top: 6px solid #0052ff;
      margin-top: 40px;
      animation: fadeIn 0.8s ease;
    }

    @keyframes fadeIn {
      from {opacity:0; transform:translateY(20px);}
      to {opacity:1; transform:translateY(0);}
    }

    .page-title {
      font-family: 'Playfair Display', serif;
      color: #004aad;
      text-align: center;
      margin-bottom: 25px;
    }

    .table {
      margin-top: 15px;
      overflow: hidden;
      border-radius: 15px;
    }

    .table thead {
      background: linear-gradient(90deg, #0052ff, #00c6ff);
      color: #fff;
    }

    .table th, .table td {
      vertical-align: middle;
      text-align: center;
    }

    .badge-paid {
      background: #198754;
      color: #fff;
      padding: 6px 12px;
      border-radius: 20px;
      font-size: 12px;
    }

    .badge-pending {
      background: #ffc107;
      color: #000;
      padding: 6px 12px;
      border-radius: 20px;
      font-size: 12px;
    }

    .empty-box {
      background: #f8fbff;
      padding: 20px;
      border-radius: 15px;
      text-align: center;
      color: #777;
      box-shadow: inset 0 0 0 1px rgba(0,0,0,0.05);
    }
  </style>
</head>

<body>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark">
  <div class="container-fluid px-4">
    <a class="navbar-brand fw-bold" href="dashboard_patient.jsp">💳 Payment History</a>
    <a href="LogoutServlet" class="btn btn-light btn-sm rounded-pill px-3">Logout</a>
  </div>
</nav>

<!-- Content -->
<div class="container">
  <div class="glass-card">

    <h3 class="page-title">My Payment History</h3>

    <% if (payments == null || payments.isEmpty()) { %>
      <div class="empty-box">
        No payment records found 💳
      </div>
    <% } else { %>

    <div class="table-responsive">
      <table class="table table-hover align-middle mb-0">
        <thead>
        <tr>
          <th>Payment ID</th>
          <th>Appointment ID</th>
          <th>Amount</th>
          <th>Status</th>
          <th>Date</th>
        </tr>
        </thead>

        <tbody>
          <% for (Payment p : payments) { %>
          <tr>
            <td><%= p.getPaymentId() %></td>
            <td>#<%= p.getAppointmentId() %></td>
            <td class="fw-semibold">₹<%= p.getAmount() %></td>

            <td>
              <% if("Paid".equalsIgnoreCase(p.getStatus())) { %>
                <span class="badge-paid">Paid</span>
              <% } else { %>
                <span class="badge-pending"><%= p.getStatus() %></span>
              <% } %>
            </td>

            <td><%= p.getPaymentDate() %></td>
          </tr>
          <% } %>
        </tbody>
      </table>
    </div>

    <% } %>

  </div>
</div>

<!--footer -->
<footer class="text-center text-muted py-3">
    <small>© 2025 Diagnostic Management System</small>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
