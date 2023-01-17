package mybatis;

import java.io.IOException;
import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

public class MybatisConfig {
	private static MybatisConfig instance;		//=new MybatisConfig();
	SqlSessionFactory sqlSessionFactory;
	
	private MybatisConfig() {
		String resource ="mybatis/config.xml";
		InputStream inputStream = null;
		
		try {
			inputStream = Resources.getResourceAsStream(resource);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public static MybatisConfig getInstance() {
		if(instance ==null) {
			instance = new MybatisConfig();
		}
		return instance;
	}
	
	//세션 팩토리로부터 쿼리 수행객체 하나 얻기
	public SqlSession  getSqlSession() {
		return sqlSessionFactory.openSession();
	}
	
	//쿼리 수행객체 닫기
	public void release(SqlSession sqlSession) {
		if(sqlSession!=null) {
			sqlSession.close();
		}
	}
}
