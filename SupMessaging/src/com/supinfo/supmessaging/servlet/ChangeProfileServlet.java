package com.supinfo.supmessaging.servlet;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.supinfo.supmessaging.DAO.DAOfactory;
import com.supinfo.supmessaging.entity.message;
import com.supinfo.supmessaging.entity.user;

@WebServlet(urlPatterns="/auth/changeprofile")
public class ChangeProfileServlet  extends HttpServlet{
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {

		
		
		String password = req.getParameter("password");	
		String firstname = req.getParameter("firstname");
		String lastname = req.getParameter("lastname");
		String email = req.getParameter("email");
		HttpSession session = req.getSession();
		String username = (String)session.getAttribute("username");
	
		
		DAOfactory.userDao().updateuser(firstname,lastname,email,password,username);
		resp.sendRedirect(req.getContextPath()+"/auth/index.jsp");
		}
	

	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		HttpSession session = req.getSession();
		session.getAttribute("username");
		List<user> result = DAOfactory.userDao().finduser((String)session.getAttribute("username"));
		req.setAttribute("userinformation",result);
		
		req.getRequestDispatcher("/auth/profile.jsp").forward(req, resp);
		
	}
	
	
}

