package com.user.servlet;

import java.io.IOException;
import java.sql.Connection;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.DAO.UserDAOImpl;
import com.DB.DBConnect;
import com.entity.User;

@WebServlet("/deactivateAccount")
public class DeactivateAccountServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			UserDAOImpl dao = new UserDAOImpl(DBConnect.getConn());
			
			HttpSession session = req.getSession();

			int id = Integer.parseInt(req.getParameter("id"));
			String email = req.getParameter("email");
			String password = req.getParameter("password");
			boolean us = dao.CheckPassword(password,id);
			if (us) {
				boolean f = dao.deactivateAccount(id);
				session.removeAttribute("userobj");
				if (f) {
					session.setAttribute("succMsg", "Your Account is Deactivated");
					resp.sendRedirect("login.jsp");
				} else {
					session.setAttribute("failedMsg", "Something went Wrong on server");
					resp.sendRedirect("DeactivateAccount.jsp");
				}
			} else {
				session.setAttribute("failedMsg", "Invalid Password!");
				resp.sendRedirect("DeactivateAccount.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}