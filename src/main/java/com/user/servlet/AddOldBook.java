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

import com.DAO.BookDAOImpl;
import com.DB.DBConnect;
import com.entity.BookDtls;

@WebServlet("/add_old_book")
@MultipartConfig
public class AddOldBook extends HttpServlet {
	private static final long serialVersionUID = 2710047967249675180L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String book_Name=req.getParameter("bname");
			String author=req.getParameter("author");
			String price=  req.getParameter("price");
			String categories= "old";
			String status= "Active";
			Part part = req.getPart("bimg");
			String filename= part.getSubmittedFileName();
			String useremail = req.getParameter("user");
			
			BookDtls b=new BookDtls(book_Name, author, price, categories, status, filename, useremail);
			
			BookDAOImpl dao=new BookDAOImpl(DBConnect.getConn());

			HttpSession session= req.getSession();
			//session.setAttribute("user", "userobj");
			
			boolean f=dao.addBooks(b);
			if(f) {
				
				String path=getServletContext().getRealPath("")+"book";
				//System.out.println(path);
				File file=new File(path);
				part.write(path+File.separator +filename);
				session.setAttribute("succMsg", "Books Added Successfully");
				resp.sendRedirect("sell_book.jsp");
				
			}else {
				session.setAttribute("failedMsg", "Books Not Added");
				resp.sendRedirect("sell_book.jsp");
				
			} 
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}

	}

}
