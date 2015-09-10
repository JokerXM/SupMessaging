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
		    // 生成一个MD5加密计算摘要   
		    md = MessageDigest.getInstance("MD5");   
		    // 计算md5函数   
		    md.update(password.getBytes());   
		    // digest()最后确定返回md5 hash值，返回值为8为字符串。因为md5 hash值是16位的hex值，实际上就是8位的字符   
		    // BigInteger函数则将8位的字符串转换成16位hex值，用字符串来表示；得到字符串形式的hash值   
		    String pwd = new BigInteger(1, md.digest()).toString(16);   
		    System.err.println(pwd);   
		    return pwd;   
		   } catch (Exception e) {   
		    e.printStackTrace();   
		   }   
		   return password;   
		}

}

