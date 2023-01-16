package emp.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import store.mybatis.MybatisConfig;


public class EmpDAO {
	MybatisConfig config= MybatisConfig.getInstance();
	
	public List selecAll() {
		List list = null;
		SqlSession sqlSession=config.getSqlSession();
		list = sqlSession.selectList("Emp.selectAll");
		config.release(sqlSession);
		return list;
	}
}

