package emp.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import emp.domain.Dept;
import store.mybatis.MybatisConfig;



public class DeptDAO {	
	
	MybatisConfig config= MybatisConfig.getInstance();
	
	
	//전체 목록 가져오기
	public List selectAll() {
		List list = null;
		SqlSession sqlSession=config.getSqlSession();
		list = sqlSession.selectList("Dept.selectAll");
		config.release(sqlSession);
		return list;
	}

	
	
	//한 건만 가져오기
	public Dept select(int deptno) {
		Dept dept=null;
		SqlSession sqlSession=config.getSqlSession();
		dept=sqlSession.selectOne("Dept.select", deptno);
		config.release(sqlSession);
		return dept;
	}

}
