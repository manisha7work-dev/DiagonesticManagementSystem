<%@ page language="java" 
         contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.dms.dao.AppointmentDAO" %>
<%@ page import="com.dms.dao.TestDAO" %>
<%@ page import="com.dms.model.Appointment" %>
<%@ page import="com.dms.model.Test" %>
<%@ page import="com.dms.model.Patient" %>

<%
    Patient patient = (Patient) session.getAttribute("patient");
    if (patient == null) {
        response.sendRedirect("patient_login.jsp");
        return;
    }

    String apptIdParam = request.getParameter("appointmentId");
    int apptId = 0;
    try { apptId = Integer.parseInt(apptIdParam); } catch (Exception e) {}

    AppointmentDAO apDao = new AppointmentDAO();
    Appointment appt = apDao.getAppointmentById(apptId);

    if (appt == null || appt.getPatientId() != patient.getPatientId()) {
        out.println("Invalid appointment.");
        return;
    }

    TestDAO testDao = new TestDAO();
    Test t = testDao.getTestById(appt.getTestId());
    double amount = (t != null) ? t.getPrice() : 0.0;
%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Secure Payment - DMS</title>

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

    .payment-card {
      background: rgba(255,255,255,0.97);
      backdrop-filter: blur(10px);
      border-radius: 20px;
      padding: 35px 30px;
      box-shadow: 0 30px 70px rgba(0,0,0,0.08);
      border-top: 6px solid #0052ff;
      margin-top: 50px;
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

    .info-box {
      background: #f5f9ff;
      padding: 18px 20px;
      border-radius: 15px;
      margin-bottom: 25px;
      box-shadow: inset 0 0 0 1px rgba(0,0,0,0.04);
    }

    .amount-box {
      background: linear-gradient(135deg, #0052ff, #00c6ff);
      color: #fff;
      border-radius: 15px;
      padding: 15px;
      text-align: center;
      margin-bottom: 25px;
      font-size: 22px;
      font-weight: 600;
      letter-spacing: 1px;
    }

    .secure-text {
      text-align: center;
      font-size: 13px;
      color: #777;
      margin-top: 10px;
    }

    .pay-btn {
      background: linear-gradient(90deg, #28a745, #5fd37a);
      border: none;
      font-weight: 600;
      padding: 14px;
      border-radius: 30px;
      letter-spacing: 0.5px;
      box-shadow: 0 10px 25px rgba(40,167,69,0.25);
      transition: 0.2s ease;
    }

    .pay-btn:hover {
      transform: translateY(-1px);
      box-shadow: 0 15px 30px rgba(40,167,69,0.35);
    }
  </style>
</head>

<body>

<div class="container">
  <div class="row justify-content-center">
    <div class="col-md-7 col-lg-6">

      <div class="payment-card">

        <h3 class="page-title">Secure Payment</h3>

        <!-- Appointment Details -->
        <div class="info-box">
          <p><strong>Appointment ID:</strong> #<%= apptId %></p>
          <p><strong>Test:</strong> 
            <% if (t != null) { %><%= t.getTestName() %><% } else { %>N/A<% } %>
          </p>
          <p><strong>Date:</strong> <%= appt.getAppointmentDate() %></p>
          <p><strong>Time:</strong> <%= appt.getAppointmentTime() %></p>
        </div>

        <!-- Amount Display -->
        <div class="amount-box">
          Total Payable: ₹<%= amount %>
        </div>

        <!-- Payment Form -->
        <form action="PaymentServlet" method="post">
          <input type="hidden" name="action" value="pay">
          <input type="hidden" name="appointmentId" value="<%= apptId %>">
          <input type="hidden" name="status" value="Paid">
          <input type="hidden" name="amount" value="<%= amount %>">

          <!-- Fake Payment Method UI (optional) -->
          <div class="mb-3">
            <label class="form-label fw-semibold">Select Payment Method</label>
            <select class="form-select rounded-pill" disabled>
              <option selected>UPI</option>
              <option>Debit Card</option>
              <option>Credit Card</option>
              <option>Net Banking</option>
            </select>
          </div>

          <button type="submit" class="btn pay-btn w-100">Confirm & Pay</button>

          <div class="secure-text">
            🔒 100% Secure Payment
          </div>
        </form>

      </div>

    </div>
  </div>
</div>
<!--footer -->
<footer class="text-center text-muted py-3">
    <small>© 2025 Diagnostic Management System</small>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
