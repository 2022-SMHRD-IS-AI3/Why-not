package com.smhrd.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.mybatis.SqlSessionManager;

public class MapDAO {

	SqlSessionFactory sqlSessionfactory = SqlSessionManager.getSqlSession();
	
	
	// 지도 아이콘 표시
	public List<Filtration_infoDTO> selectAll() {
		SqlSession sqlsession = sqlSessionfactory.openSession(true);
		List<Filtration_infoDTO> list = sqlsession.selectList("com.smhrd.mapper.MapMapper.selectAll");
		sqlsession.close();
		
		return list;		
	}


	// 정수장 간략보기
	public Filtration_infoDTO simpleContext(Filtration_infoDTO dto) {

		SqlSession sqlsession = sqlSessionfactory.openSession(true);
		Filtration_infoDTO simpleContext = sqlsession.selectOne("simpleContext", dto);
		sqlsession.close();
		
		return simpleContext;
	}

	public List<Filtration_infoDTO> selectGwangju() {
		SqlSession sqlsession = sqlSessionfactory.openSession(true);
		List<Filtration_infoDTO> gwangjulist = sqlsession.selectList("com.smhrd.mapper.MapMapper.selectGwangju");
		sqlsession.close();
		
		return gwangjulist;
	}
	
	public List<Filtration_infoDTO> selectJungook() {
		SqlSession sqlsession = sqlSessionfactory.openSession(true);
		List<Filtration_infoDTO> jungooklist = sqlsession.selectList("com.smhrd.mapper.MapMapper.selectJungook");
		sqlsession.close();
		
		return jungooklist;
	}
	public List<Filtration_infoDTO> selectJunnam() {
		SqlSession sqlsession = sqlSessionfactory.openSession(true);
		List<Filtration_infoDTO> junnamlist = sqlsession.selectList("com.smhrd.mapper.MapMapper.selectJunnam");
		sqlsession.close();
		
		return junnamlist;
	}
	public List<Filtration_infoDTO> selectJunbook() {
		SqlSession sqlsession = sqlSessionfactory.openSession(true);
		List<Filtration_infoDTO> junbooklist = sqlsession.selectList("selectJunbook");
		sqlsession.close();
		
		return junbooklist;
	}


	// 정수장 상세보기
	public Filtration_infoDTO detailsContext(String filt_name) {
		SqlSession sqlsession = sqlSessionfactory.openSession(true);
		System.out.println("여기까지 오케이?"+filt_name);
		Filtration_infoDTO detailsContext = sqlsession.selectOne("detailsContext", filt_name);
		sqlsession.close();
		
		return detailsContext;
	}
	
	


	
	
	
	
	
	
//	public List<Filtration_infoDTO> selectGwangju() {
//		SqlSession sqlsession = sqlSessionfactory.openSession(true);
//		List<Filtration_infoDTO> list = sqlsession.selectList("selectGwangju");
//		sqlsession.close();
//				
//		return list;
//	}
	
	
	
	
}
