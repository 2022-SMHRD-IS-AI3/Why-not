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


	public Filtration_infoDTO simpleContext(Filtration_infoDTO dto) {
		SqlSession sqlsession = sqlSessionfactory.openSession(true);
		Filtration_infoDTO simpleContext = sqlsession.selectOne("simpleContext", dto);
		sqlsession.close();
		
		return simpleContext;
	}


	


	
	
	
	
	
	
//	public List<Filtration_infoDTO> selectGwangju() {
//		SqlSession sqlsession = sqlSessionfactory.openSession(true);
//		List<Filtration_infoDTO> list = sqlsession.selectList("selectGwangju");
//		sqlsession.close();
//				
//		return list;
//	}
	
	
	
	
}
