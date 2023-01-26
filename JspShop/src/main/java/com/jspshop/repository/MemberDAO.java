package com.jspshop.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.jspshop.domain.Member;
import com.jspshop.mybatis.MybatisConfig;

public class MemberDAO {
	MybatisConfig config = MybatisConfig.getInstance();
	
	//모두 가져오기
	public List selectAll() {
		List list = null;
		SqlSession sqlSession = config.getSqlSession();
		list = sqlSession.selectList("Member.selectAll");
		config.release(sqlSession);
		return list;
	}
	
	//등록하기
    public int insert(Member member) {
        int result = 0;
        SqlSession sqlSession = config.getSqlSession();
        result = sqlSession.insert("Member.insert", member);
        sqlSession.commit(); //DML은 commit 필요함
        config.release(sqlSession);
        return result;
    }
    
	//수정하기
	public int update(Member member) {
		int result=0;
		SqlSession sqlSession = config.getSqlSession();
		result = sqlSession.update("Member.update", member);
		sqlSession.commit();
		config.release(sqlSession);
		return result;
	}
	
	//삭제하기
	public int delete(int member_idx) {
		int result=0;
		SqlSession sqlSession = config.getSqlSession();
		result = sqlSession.delete("Member.delete", member_idx);
		sqlSession.commit();
		config.release(sqlSession);
		return result;
	}
	
}
