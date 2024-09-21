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


@WebServlet("/update")
public class UpdateProfileServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			int id = Integer.parseInt(req.getParameter("id"));
			String firstName = req.getParameter("firstName");
			String lastName = req.getParameter("lastName");
			String email = req.getParameter("email");
			String phone = req.getParameter("phone-number");
			String password = req.getParameter("password");
			
			User us = new User();
			us.setId(id);
			us.setFirstName(firstName);
			us.setLastName(lastName);
			us.setEmail(email);
			us.setPhno(phone);
			
			HttpSession session = req.getSession();
			
			UserDAOImpl dao = new UserDAOImpl(DBConnect.getConn());
			boolean f= dao.CheckPassword(password, id);
			if(f)
			{
				boolean f2 = dao.updateProfile(us);
				if(f2)
				{
					session.setAttribute("succMsg", "Updated Successfully!");
					resp.sendRedirect("edit_profile.jsp");
					
				}
				else 
				{
					session.setAttribute("failedMsg", "Something Wrong on server!");
					resp.sendRedirect("edit_profile.jsp");
					
				}
				
			}else
			{
				session.setAttribute("failedMsg", "Password is Incorrect!");
				resp.sendRedirect("edit_profile.jsp");
				
			}
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		
		
	}
	
	

}
