package com.smhrd.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.mybatis.SqlSessionManager;

public class Danger_infoDAO {

	SqlSessionFactory sqlSessionfactory = SqlSessionManager.getSqlSession();
		
	
	public List<Danger_infoDTO> selectDGwangju() {
		SqlSession sqlsession = sqlSessionfactory.openSession(true);
		List<Danger_infoDTO> gwangjuDlist = sqlsession.selectList("com.smhrd.mapper.DangerMapper.selectDGwangju");
		sqlsession.close();
		
		return gwangjuDlist;
	}
	
	public List<Danger_infoDTO> selectDJungook() {
		SqlSession sqlsession = sqlSessionfactory.openSession(true);
		List<Danger_infoDTO> jungookDlist = sqlsession.selectList("com.smhrd.mapper.DangerMapper.selectDJungook");
		sqlsession.close();
		
		return jungookDlist;
	}
	public List<Danger_infoDTO> selectDJunnam() {
		SqlSession sqlsession = sqlSessionfactory.openSession(true);
		List<Danger_infoDTO> junnamDlist = sqlsession.selectList("com.smhrd.mapper.DangerMapper.selectDJunnam");
		sqlsession.close();
		
		return junnamDlist;
	}
	public List<Danger_infoDTO> selectDJunbook() {
		SqlSession sqlsession = sqlSessionfactory.openSession(true);
		List<Danger_infoDTO> junbookDlist = sqlsession.selectList("com.smhrd.mapper.DangerMapper.selectDJunbook");
		sqlsession.close();
		
		return junbookDlist;
	}
	
	
}