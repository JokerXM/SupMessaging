package com.supinfo.supmessaging.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebFilter(urlPatterns="/auth/*")
public class AuthenticateFilter implements Filter {
	
	private FilterConfig fc;
	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void doFilter(ServletRequest req, ServletResponse resp,
			FilterChain chain) throws IOException, ServletException {
		String username  = (String) ((HttpServletRequest)req).getSession().getAttribute("username");
		
		if(username!=null)
			chain.doFilter(req, resp);
		else
			((HttpServletResponse)resp).sendRedirect(((HttpServletRequest)req).getContextPath()+"/jsp/login.jsp");
	}

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		
		this.fc = filterConfig;
	}

}
