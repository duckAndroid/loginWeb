package com.pythoncat.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Login2Servet extends HttpServlet {

	private HttpServletRequest req;
	private HttpServletResponse resp;

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.req = request;
		this.resp = response;

		req.setCharacterEncoding("utf-8");
		resp.setContentType("text/html; charset=UTF-8");
		
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		System.out.println("username = " + username + " \t password="
				+ password);

		if (!"duck".equalsIgnoreCase(username)) {
			// 用户名。密码正确
			System.out.println("用户名。密码正确");
			//记住用户名和密码先
			remeberUser(username,password);
			doWhenSuccess(username, password);
		} else {
			// 用户名，密码错误
			System.out.println("用户名，密码错误");
			doWhenError(username, password);
		}
	}

	private void doWhenError(String username, String password)
			throws ServletException, IOException {
		HttpSession session = req.getSession();
		session.setAttribute("error", "用户名或密码错误，请重新登录");
		// 转发到 login.jsp
		String path = this.getServletContext().getContextPath()
				+ "/login/login2.jsp";
		System.out.println("path = " + path);
		resp.sendRedirect(path);
	
	}

	private void doWhenSuccess(String username, String password)
			throws ServletException, IOException {
		HttpSession session = req.getSession();
		session.setAttribute("username", username);
		// 转发到 succe1.jsp
		String path = this.getServletContext().getContextPath()
				+ "/login/succ1.jsp";
		System.out.println("path = " + path);
		resp.sendRedirect(path);
	}

	private void remeberUser(String username, String password) {
		Cookie uCookie = new Cookie("username", username);
		uCookie.setMaxAge(60*60*24*365);
		Cookie pCookie = new Cookie("password", password);
		pCookie.setMaxAge(60*60*24*365);
		resp.addCookie(uCookie);
		resp.addCookie(pCookie);
	}

}
