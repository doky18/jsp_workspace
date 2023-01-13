package store.mybatis;

import java.io.IOException;
import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

//하나의 프로그램에서 SqlSessionFactory는 하나만 있으면 충부하므로 싱글턴으로 관리한다 
public class MybatisConfig {
	private static MybatisConfig instance; // = new MybatisConfig(); //new 생성 못하게 막았으니까 접근 할 수 있도록
	SqlSessionFactory sqlSessionFactory;

	private MybatisConfig() {
		String resource = "store/mybatis/config.xml";
		InputStream inputStream = null;
		try {
			inputStream = Resources.getResourceAsStream(resource);
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public static MybatisConfig getInstance() {
		if (instance == null) {
			instance = new MybatisConfig();
		}
		return instance;
	}
	
	
	//세션 팩토리로부터 쿼리 수행객체 하나 얻기
	public SqlSession	 getSqlSession() {
		return sqlSessionFactory.openSession();
	}
	
	//쿼리수행 객체 닫기
	public void release(SqlSession sqlSession) {
		if(sqlSession!=null) {
			sqlSession.close();
		}
	}
}
