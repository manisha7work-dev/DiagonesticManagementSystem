package com.dms.servlet;

import com.dms.dao.PatientDAO;
import com.dms.dao.AnalystDAO;


import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.io.IOException;



public class AdminActionsServlet extends HttpServlet{
	
	private final PatientDAO patientDAO = new PatientDAO();
    private final AnalystDAO analystDAO = new AnalystDAO();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        HttpSession session = req.getSession(false);

        // simple admin check
        if (session == null || session.getAttribute("admin") == null) {
            resp.sendRedirect(req.getContextPath() + "/admin_login.jsp");
            return;
        }

        if ("removePatient".equalsIgnoreCase(action)) {
            int id = Integer.parseInt(req.getParameter("patientId"));
            patientDAO.deletePatient(id);  // for better design use soft delete
            resp.sendRedirect(req.getContextPath() + "/manage_patients.jsp?msg=removed");
        } else if ("removeAnalyst".equalsIgnoreCase(action)) {
            int id = Integer.parseInt(req.getParameter("analystId"));
            analystDAO.deleteAnalyst(id);
            resp.sendRedirect(req.getContextPath() + "/manage_analysts.jsp?msg=removed");
        } else {
            resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Unknown admin action");
        }
    }

}
