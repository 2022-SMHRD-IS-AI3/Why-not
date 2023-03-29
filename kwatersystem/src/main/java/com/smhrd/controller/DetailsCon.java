package com.smhrd.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



public class DetailsCon extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		System.out.println("[DetailsCon]");
		
		String name = request.getParameter("data");
//		HttpSession session = request.getSession();		
//		session.setAttribute("Test", "qweqwe");
//		String name = (String)session.getAttribute("SessionFilterName");
		System.out.println(name); 

	}

}
