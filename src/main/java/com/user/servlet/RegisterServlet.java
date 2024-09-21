package com.user.servlet;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.DAO.UserDAOImpl;
import com.DB.DBConnect;
import com.entity.User;

@WebServlet("/register")
@MultipartConfig
public class RegisterServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String firstname = req.getParameter("firstName");
			String lastname = req.getParameter("lastName");
			String email = req.getParameter("email");
			String phno = req.getParameter("phno");
			String password = req.getParameter("password");
			String check = req.getParameter("check");
			Part part = req.getPart("bimg");
			String filename = part.getSubmittedFileName();

//			System.out.println(name + " " + email + " " + phno + " " + password + " " + check + filename);

			User us = new User();

			us.setFirstName(firstname);
			us.setEmail(email);
			us.setPhno(phno);
			us.setPassword(password);
			us.setPhoto(filename);
			String path = getServletContext().getRealPath("") + "book";
//			System.out.println(path);
			File file = new File(path);
			part.write(path + File.separator + filename);
			us.setLastName(lastname);

			HttpSession session = req.getSession();

			if (check != null) {
				UserDAOImpl dao = new UserDAOImpl(DBConnect.getConn());
				boolean f2 = dao.checkUser(email);
				if (f2) {
					boolean f = dao.userRegister(us);
					if (f) {
//						System.out.println("User Registration is Successfull");
						session.setAttribute("succMsg", "User Registration is Successfull");
						resp.sendRedirect("register.jsp");
					} else {
//						System.out.println("Something went wrong on server");
						session.setAttribute("failedMsg", "Something went wrong on server");
						resp.sendRedirect("register.jsp");
					}
				} else {
					session.setAttribute("failedMsg", "User already exist Try another Email");
					resp.sendRedirect("register.jsp");
				}
			} else {
//				System.out.println("Please Check Terms & Conditions");
				session.setAttribute("failedMsg", "Please Check Terms & Conditions");
				resp.sendRedirect("register.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
