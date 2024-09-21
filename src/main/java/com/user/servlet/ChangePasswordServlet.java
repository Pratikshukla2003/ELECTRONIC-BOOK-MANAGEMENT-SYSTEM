package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.UserDAOImpl;
import com.DB.DBConnect;
import com.entity.User;

@WebServlet("/changePassword")
public class ChangePasswordServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {

			UserDAOImpl dao = new UserDAOImpl(DBConnect.getConn());

			HttpSession session = req.getSession();

			int id = Integer.parseInt(req.getParameter("id"));
			String oldPassword = req.getParameter("oldPassword");
			String newPassword = req.getParameter("newPassword");

//			System.out.print(id+" "+oldPassword+" "+newPassword);

			User us = new User();
			us.setId(id);
			us.setPassword(newPassword);

			boolean f = dao.CheckPassword(oldPassword,id);

			if (f) {
				boolean f2=dao.updatePassword(us);
				if(f2)
				{
					session.setAttribute("succMsg", "Updated Successfully!");
					resp.sendRedirect("change_password.jsp");
				}
				else 
				{
					session.setAttribute("failedMsg", "Something Wrong on server!");
					resp.sendRedirect("change_password.jsp");
				}
			} else {
				session.setAttribute("failedMsg", "You have entered wrong password!");
				resp.sendRedirect("change_password.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
