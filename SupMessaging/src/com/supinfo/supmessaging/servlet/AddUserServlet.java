package com.supinfo.supmessaging.servlet;

import java.io.IOException;
import java.math.BigInteger;
import java.security.MessageDigest;
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
import com.supinfo.supmessaging.entity.user;

@WebServlet(urlPatterns="/adduser")
public class AddUserServlet  extends HttpServlet{
	
   	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		if( req.getParameter("password").equals(req.getParameter("apassword")))
		{
		user u = new user();
		u.setUsername(req.getParameter("username"));	
		u.setFirstname(req.getParameter("firstname"));
		u.setLastname(req.getParameter("lastname"));
		u.setEmail(req.getParameter("email"));
		u.setPassword(req.getParameter("password"));
		DAOfactory.userDao().adduser(u);
		
		HttpSession session = req.getSession();
		session.setAttribute("username", req.getParameter("username"));
		session.setAttribute("loginmessage", "success login!");
		List<contact> user =DAOfactory.contactDao().getAllcontact((String)session.getAttribute("username"));
		session.setAttribute("contact", user);
		List<message> m = DAOfactory.messageDao().getAllmessage((String)session.getAttribute("username"));
		session.setAttribute("message", m);
		resp.sendRedirect(req.getContextPath()+"/auth/index.jsp");
		}
		else {
			String a="two times of password is not the same!!!";
			req.setAttribute("registermessage", a);
			req.getRequestDispatcher("/jsp/adduser.jsp").forward(req, resp);
		}
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		req.getRequestDispatcher("/jsp/adduser.jsp").forward(req, resp);
	}
	
	public String makeMD5(String password) {   
		MessageDigest md;   
		   try {   
		    // ����һ��MD5���ܼ���ժҪ   
		    md = MessageDigest.getInstance("MD5");   
		    // ����md5����   
		    md.update(password.getBytes());   
		    // digest()���ȷ������md5 hashֵ������ֵΪ8Ϊ�ַ�������Ϊmd5 hashֵ��16λ��hexֵ��ʵ���Ͼ���8λ���ַ�   
		    // BigInteger������8λ���ַ���ת����16λhexֵ�����ַ�������ʾ���õ��ַ�����ʽ��hashֵ   
		    String pwd = new BigInteger(1, md.digest()).toString(16);   
		    System.err.println(pwd);   
		    return pwd;   
		   } catch (Exception e) {   
		    e.printStackTrace();   
		   }   
		   return password;   
		}

}

