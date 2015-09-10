package com.supinfo.supmessaging.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.supinfo.supmessaging.DAO.DAOfactory;
import com.supinfo.supmessaging.entity.contact;
import com.supinfo.supmessaging.entity.message;

@WebServlet(urlPatterns="/anonymous")
public class AnonymousServlet extends HttpServlet{
	
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		int usernumber = DAOfactory.userDao().countuser();
		int messagenumber = DAOfactory.messageDao().countmessage();
		req.setAttribute("usernumber", usernumber );
		req.setAttribute("messagenumber", messagenumber );		
		req.getRequestDispatcher("/jsp/anonymous.jsp").forward(req, resp);
		
	}

}
