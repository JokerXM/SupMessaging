package com.supinfo.supmessaging.servlet;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.supinfo.supmessaging.DAO.DAOfactory;
import com.supinfo.supmessaging.entity.message;

@WebServlet(urlPatterns="/contactadmin")
public class AddNobodyMessageServlet  extends HttpServlet{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;



	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {

		Date now = new Date(); 
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		String sdate = dateFormat.format( now ); 
		message m = new message();
		m.setContent(req.getParameter("message"));
		m.setIfread("no read");
		m.setTime(sdate);
		m.setSender("nobody");
		m.setRecipient("admin");
		
		
		DAOfactory.messageDao().addmessage(m);
		resp.sendRedirect(req.getContextPath()+"/jsp/contactpage.jsp");
		}
	

	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		req.getRequestDispatcher("/jsp/contactpage.jsp").forward(req, resp);
		
	}
	
	
}


