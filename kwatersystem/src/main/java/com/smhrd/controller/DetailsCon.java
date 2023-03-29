package com.smhrd.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.model.Filteration_qualityDTO;
import com.smhrd.model.Filtration_infoDTO;
import com.smhrd.model.Intake_quality;
import com.smhrd.model.MapDAO;
import com.smhrd.model.QualityDAO;



public class DetailsCon extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		System.out.println("[DetailsCon]");
		
		request.setCharacterEncoding("UTF-8");
		String filt_name = request.getParameter("data");
//		HttpSession session = request.getSession();		
//		session.setAttribute("Test", "qweqwe");
//		String name = (String)session.getAttribute("SessionFilterName");
		System.out.println(filt_name); 
		
		
		// 정수장 정보 가져오기
		//Filtration_infoDTO dto = new Filtration_infoDTO(filt_name);
		MapDAO filtdao = new MapDAO();
		Filtration_infoDTO detailsContext = filtdao.detailsContext(filt_name);
		System.out.println("넘어오기 확인!!");
		
		if(detailsContext != null) {
			System.out.println("정수장 정보 가져오기 성공!");
//			PrintWriter out = response.getWriter();
//			out.print(simpleContext);
		} else {
			System.out.println("정수장 정보 가져오기 실패..");
		}
		
		
		// 정수장 수질 가져오기
		String filt_no = detailsContext.getFilt_num();
		System.out.println(filt_no); // --> 확인 완!!
		
		QualityDAO filtQualitydao = new QualityDAO();
		Filteration_qualityDTO filtQualityContext = filtQualitydao.filtQualityContext(filt_no);
		
		if(filtQualityContext != null) {
			System.out.println("정수장 수질 가져오기 성공!");
		} else {
			System.out.println("정수장 수질 가져오기 실패..");
		}
		
		// 취수장 수질 가져오기
		String intake_no = detailsContext.getIntake_no();
		System.out.println(intake_no);
		
		QualityDAO intakeQualitydao = new QualityDAO();
		List<Intake_quality> intakeQualityContext = intakeQualitydao.intakeQualityContext(intake_no);
		
		if(intakeQualityContext != null) {
			System.out.println("취수장 수질 가져오기 성공!");
		} else {
			System.out.println("취수장 수질 가져오기 실패..");
		}
		
		
		// 값 넘기고 페이지 전환
		
		RequestDispatcher rd = request.getRequestDispatcher("Details.jsp");
		request.setAttribute("정수장정보", detailsContext);
		request.setAttribute("정수장수질", filtQualityContext);
		request.setAttribute("취수장수질", intakeQualityContext);
		rd.forward(request, response);

	}

}
