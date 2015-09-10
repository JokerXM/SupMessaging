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

	
	
	@WebServlet(urlPatterns="/listalluser")
	public class ListUserServlet extends HttpServlet {
		private static final long serialVersionUID = 1L;
		
		public ListUserServlet() {
	        super(); 
	    }
		/**
		 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
		 */
		protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			List<user> user =DAOfactory.userDao().getAlluser();
			request.setAttribute("user", user);
			request.getRequestDispatcher("/auth/listuser.jsp").forward(request, response);
			
		}
	}

