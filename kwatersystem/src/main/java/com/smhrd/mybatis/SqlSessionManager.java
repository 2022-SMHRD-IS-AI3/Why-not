package com.smhrd.mybatis;

import java.io.IOException;
import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class SqlSessionManager {
	// SqlSessionFactory(sqlSession) : // DB연동, 해제, sql실행, 트랜잭션을 관리
		public static SqlSessionFactory sqlSessionFactory;

		static {
			// mybatis 설정파일 경로 -> DB에 연결
			String resource = "com/smhrd/mybatis/mybatis-config.xml";
			Reader reader;

			try {
				reader = Resources.getResourceAsReader(resource);
				// SqlSessionFactory = connection : SqlSession(DB연결, sql실행, 트랜젝션 관리) 생성
				sqlSessionFactory = new SqlSessionFactoryBuilder().build(reader);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

		// DAO(Class)에서 사용할 메소드
		public static SqlSessionFactory getSqlSession() {
			return sqlSessionFactory;
		}

}
