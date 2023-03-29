package com.smhrd.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.mybatis.SqlSessionManager;

public class QualityDAO {
	
	SqlSessionFactory sqlSessionfactory = SqlSessionManager.getSqlSession();

	public Filteration_qualityDTO filtQualityContext(String filt_no) {
		SqlSession sqlsession = sqlSessionfactory.openSession(true);
		Filteration_qualityDTO filtQualityContext = sqlsession.selectOne("filtQualityContext", filt_no);
		sqlsession.close();
		
		return filtQualityContext;
	}

	public List<Intake_quality> intakeQualityContext(String intake_no) {
		SqlSession sqlsession = sqlSessionfactory.openSession(true);
		List<Intake_quality> intakeQualityContext = sqlsession.selectList("intakeQualityContext", intake_no);
		sqlsession.close();
		
		return intakeQualityContext;
	}

	
	
}
