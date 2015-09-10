package com.supinfo.supmessaging.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.supinfo.supmessaging.DAO.DAOfactory;
import com.supinfo.supmessaging.entity.user;

@WebServlet("/auth/SearchUser")
public class SearchUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		

		user u = new user();
		List<user> user;
		String searchname = request.getParameter("searchname");	
		if(searchname=="all"){
			user = DAOfactory.userDao().getAlluser();	
		}
		else{
		user = DAOfactory.userDao().finduser(searchname);
		}
		request.setAttribute("user", user);
		request.getRequestDispatcher("/auth/listuser.jsp").forward(request, response);
		
	}

}
