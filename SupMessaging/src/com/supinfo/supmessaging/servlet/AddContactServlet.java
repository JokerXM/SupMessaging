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


@WebServlet(urlPatterns="/auth/addcontact")

public class AddContactServlet extends HttpServlet{
	
	private String tuser;
	private String ruser;
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		contact c = new contact();	
		contact d = new contact();
		this.tuser = (String)req.getSession().getAttribute("username");
		this.ruser = (String)req.getParameter("rname");	
		String message=null;
		
		if(DAOfactory.contactDao().findifhere(ruser, tuser) ==0)
		{
			c.setMyname(this.tuser);
			c.setFriendname(this.ruser);
			DAOfactory.contactDao().addcontact(c);
			d.setMyname(this.ruser);
			d.setFriendname(this.tuser);
			DAOfactory.contactDao().addcontact(d);
		    message = "ok! your are friend now";
			req.setAttribute("addcontactmessage", message);
			HttpSession session = req.getSession();
			List<contact> user =DAOfactory.contactDao().getAllcontact((String)session.getAttribute("username"));
			session.setAttribute("contact", user);
		}
		else 
		{
		     message = "you are already friend now";
			req.setAttribute("addcontactmessage", message);
		}
		
		resp.sendRedirect(req.getContextPath()+"/auth/listfriend.jsp");

	}
	
}
