package com.smhrd.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import com.smhrd.model.Danger_infoDTO;
import com.smhrd.model.Filtration_infoDTO;
import com.smhrd.model.MapDAO;

import oracle.sql.json.OracleJsonObject;


public class MapCon extends HttpServlet {

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("[MapCon]");
		
		request.setCharacterEncoding("UTF-8");
		String addr = request.getParameter("addr");
		System.out.println(addr);
		
		// 정수장 간략보기
		Filtration_infoDTO dto = new Filtration_infoDTO(addr);
		MapDAO dao = new MapDAO();
		
		Filtration_infoDTO simpleContext = dao.simpleContext(dto);
		
		
		if(simpleContext!=null) {
			System.out.println("성공!");
//			PrintWriter out = response.getWriter();
//			out.print(simpleContext);
		} else {
			System.out.println("실패..");
		}
		
		
		// 위험도 순위 가져오기
		System.out.println("여긴가..");
		String name = simpleContext.getFilt_name();
		System.out.println("아니 여긴가...");
		List<Danger_infoDTO> dangerrank = dao.dangerrank();
		System.out.println("설마 여긴가...");
		int i = 0;
		int rank = 0;
		while(true) {
			if(dangerrank.get(i).getFilt_name().equals(name)) {
				rank = i;
				break;
			}
			i++;
		}
		
		
		
		JSONObject json = new JSONObject();
		
//		json.put("Const_year", simpleContext.getConst_year());
//		

		
		HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("filt_name", simpleContext.getFilt_name());
			map.put("addr", simpleContext.getAddr());
			map.put("sup_area", simpleContext.getSup_area());
			map.put("const_year", simpleContext.getConst_year());
			map.put("oper_rate", simpleContext.getOper_rate());
			map.put("sup_popu", simpleContext.getSup_popu());
			map.put("rank", rank+1);
			
			json.put("map", map);
		
		response.setContentType("application/x-json; charset=utf-8");
		response.getWriter().print(json); // 전송이 되는 부분
	}

}
