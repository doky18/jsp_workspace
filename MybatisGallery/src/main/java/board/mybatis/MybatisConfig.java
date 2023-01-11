package board.mybatis;

import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

//mybatis의 설정 정보를 읽어와서, 쿼리를 수행하는 객체인 SqlSession 객체를 모아서
//처리해주는 객체인 SqlSessionFacotry를 싱글톤 클래스로 관리해보자
public class MybatisConfig {

	private static MybatisConfig instance;
	private SqlSession sqlSession;
	SqlSessionFactory sqlSessionFactory = null;  //세션들이 모여사는 공장. 얘가 쿼리문 실행...?

	private MybatisConfig() {
        String resource = "board/mybatis/config.xml";
        InputStream inputStream = null;
  
        try{    
            inputStream = Resources.getResourceAsStream(resource);
            sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
        }catch(Exception e) {
            e.printStackTrace();
        }
    }

	// sqlSessionFactory로부터 sqlSession을 반환해줄수있는 메서드
	public SqlSession getSqlSession() {
		// 팩토리로부터 쿼리 수행 객체인 SqlSession 하나 반환해주기
		return sqlSessionFactory.openSession();
	}

	public void release(SqlSession sqlSession) {
		if (sqlSession != null) {
			sqlSession.close();
		}
	}

	public static MybatisConfig getInstance() {
		if (instance == null) {
			instance = new MybatisConfig();
		}
		return instance;
	}

}