package com.supinfo.supmessaging.servlet;

import java.io.IOException;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.print.attribute.DateTimeSyntax;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.supinfo.supmessaging.DAO.DAOfactory;
import com.supinfo.supmessaging.entity.message;

@WebServlet(urlPatterns="/auth/addmessage")
public class AddMessageServlet  extends HttpServlet{
	
   	private static String ruser=null;
   	private static String tuser=null;
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
		m.setSender(this.tuser);
		m.setRecipient(this.ruser);
		
		HttpSession session = req.getSession();
		DAOfactory.messageDao().addmessage(m);
		List<message> m2 = DAOfactory.messageDao().getAllmessage((String)session.getAttribute("username"));
		session.setAttribute("message", m2);
		resp.sendRedirect(req.getContextPath()+"/auth/addmessage?rname="+this.ruser);
		}
	

	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		this.tuser = (String) req.getSession().getAttribute("username");
		this.ruser = (String)req.getParameter("rname");	
		List<message> result = DAOfactory.messageDao().findmessage(this.tuser, this.ruser);
		req.setAttribute("content",result);
		
		req.getRequestDispatcher("/auth/sendmessage.jsp").forward(req, resp);
		
	}
	
	
}

