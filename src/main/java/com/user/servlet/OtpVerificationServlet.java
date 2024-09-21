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

@WebServlet("/otpVerification")
public class OtpVerificationServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String email = req.getParameter("email");
			String phno = req.getParameter("phno");
			String otp = req.getParameter("otp");
			
//			System.out.print(email+" "+phno+" "+otp);
			
			UserDAOImpl dao=new UserDAOImpl(DBConnect.getConn());
			boolean f=dao.forgotPassword(email, phno);
			
//			System.out.print(f);
		
			if(f) {
				
			}else {
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
