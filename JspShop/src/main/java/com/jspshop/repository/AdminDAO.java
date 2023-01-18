package com.jspshop.repository;

import java.io.ObjectInputFilter.Config;

import org.apache.ibatis.session.SqlSession;

import com.jspshop.domain.Admin;
import com.jspshop.mybatis.MybatisConfig;

public class AdminDAO {
	MybatisConfig config = MybatisConfig.getInstance();
	
	//관리자 1명 조회하기 (id, pass가 일치)
	public Admin select(Admin admin) {
		Admin obj= null;		//db에서 가져온 회원
		SqlSession sqlSession = config.getSqlSession();
		obj=sqlSession.selectOne("Admin.select", admin);
		config.release(sqlSession);
		return obj;
	}
		
}
