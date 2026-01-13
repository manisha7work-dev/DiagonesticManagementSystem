<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   
    
<%@ page import="java.util.List" %>
<%@ page import="com.dms.model.Patient" %>
<%@ page import="com.dms.dao.PatientDAO" %>

<%
    if (session.getAttribute("admin") == null) {
        response.sendRedirect("login_admin.jsp");
        return;
    }

    PatientDAO dao = new PatientDAO();
    List<Patient> patients = dao.getAllPatients();
%>
    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>👥Manage Patients - DMS</title>

    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@600&family=Inter:wght@300;400;500&display=swap" rel="stylesheet">

    <style>
        body{
            font-family: 'Inter', sans-serif;
            background: linear-gradient(135deg, #e3f2fd, #ffffff);
            min-height: 100vh;
        }

        .navbar{
            background: linear-gradient(90deg, #0052ff, #00c6ff) !important;
            box-shadow: 0 8px 20px rgba(0,0,0,0.1);
        }

        .page-card{
            background: rgba(255,255,255,0.97);
            backdrop-filter: blur(10px);
            border-radius: 22px;
            padding: 30px;
            box-shadow: 0 25px 60px rgba(0,0,0,0.08);
            margin-top: 40px;
            animation: fadeIn 0.7s ease-in-out;
        }

        @keyframes fadeIn{
            from{opacity:0; transform:translateY(20px);}
            to{opacity:1; transform:translateY(0);}
        }

        .page-title{
            font-family: 'Playfair Display', serif;
            color: #004aad;
            text-align: center;
            margin-bottom: 25px;
        }

        table{
            overflow: hidden;
            border-radius: 16px;
        }

        thead{
            background: linear-gradient(90deg, #0052ff, #00c6ff);
            color: white;
        }

        thead th{
            border: none !important;
            text-align: center;
            font-weight: 500;
            padding: 14px 10px;
            font-size: 14px;
            vertical-align: middle;
        }

        tbody td{
            text-align: center;
            vertical-align: middle;
            font-size: 14px;
            padding: 12px;
        }

        tbody tr:hover{
            background-color: #f1f7ff;
            transition: 0.2s ease-in-out;
        }

        .btn-danger{
            border-radius: 50px;
            padding: 6px 16px;
            font-size: 13px;
        }

        .alert{
            border-radius: 14px;
        }
    </style>
</head>

<body>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark">
    <div class="container-fluid">
        <a class="navbar-brand fw-bold" href="dashboard_admin.jsp">🛠️ Admin Dashboard</a>
        <div>
            <a href="LogoutServlet" class="btn btn-light btn-sm rounded-pill px-3">Logout</a>
        </div>
    </div>
</nav>

<!-- Content -->
<div class="container">
    <div class="page-card">

        <h3 class="page-title"> Manage Patients</h3>

        <% String msg = request.getParameter("msg");
           if ("removed".equals(msg)) { %>
            <div class="alert alert-success text-center">
                ✅ Patient removed successfully
            </div>
        <% } %>

        <div class="table-responsive">
            <table class="table table-borderless align-middle">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Email</th>
                        <th>Phone</th>
                        <th>Action</th>
                    </tr>
                </thead>

                <tbody>
                    <% for (Patient p : patients) { %>
                    <tr>
                        <td><%= p.getPatientId() %></td>
                        <td><%= p.getName() %></td>
                        <td><%= p.getEmail() %></td>
                        <td><%= p.getPhone() %></td>
                        <td>
                            <form action="AdminActionsServlet" method="post" style="display:inline;"
                                  onsubmit="return confirm('Remove this patient?');">
                                <input type="hidden" name="action" value="removePatient">
                                <input type="hidden" name="patientId" value="<%= p.getPatientId() %>">
                                <button class="btn btn-danger btn-sm">Remove</button>
                            </form>
                        </td>
                    </tr>
                    <% } %>
                </tbody>
            </table>
        </div>

    </div>
</div>

</body>
</html>