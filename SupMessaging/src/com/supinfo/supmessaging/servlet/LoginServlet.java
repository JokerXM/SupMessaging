package com.supinfo.supmessaging.servlet;

import java.io.IOException;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.jasper.tagplugins.jstl.core.Out;

import com.supinfo.supmessaging.DAO.DAOfactory;
import com.supinfo.supmessaging.entity.contact;
import com.supinfo.supmessaging.entity.message;

	
	@WebServlet(urlPatterns="/login")
	public class LoginServlet extends HttpServlet {
		
		@Override
		protected void doPost(HttpServletRequest req, HttpServletResponse resp)
				throws ServletException, IOException {
			String username = req.getParameter("username");
			//String password1 = req.getParameter("password");
			String password = req.getParameter("password");
			String loginmessage=null;
			
			String turepassword = DAOfactory.userDao().findpassword(username);
			System.out.println(turepassword);
			
		
			if(turepassword == null)
			{
				
				loginmessage="There is not this user";
				HttpSession session = req.getSession();
				session.setAttribute("loginmessage", loginmessage);
				resp.sendRedirect(req.getContextPath()+"/jsp/login.jsp");
				
			}
			else if(password.equals(turepassword))
			{
				loginmessage="success login";			
				HttpSession session = req.getSession();
				session.setAttribute("username", username);
				session.setAttribute("loginmessage", loginmessage);
				List<contact> user =DAOfactory.contactDao().getAllcontact((String)session.getAttribute("username"));
				session.setAttribute("contact", user);
				List<message> m = DAOfactory.messageDao().getAllmessage((String)session.getAttribute("username"));
				session.setAttribute("message", m);
				
				resp.sendRedirect(req.getContextPath()+"/auth/index.jsp");
			}
			
			else 
			{
				loginmessage="The password is not ture";
				HttpSession session = req.getSession();
				session.setAttribute("loginmessage", loginmessage);
				resp.sendRedirect(req.getContextPath()+"/jsp/login.jsp");
				
			}
		}
		
	/*	public String makeMD5(String password) {   
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
			}*/

	}

