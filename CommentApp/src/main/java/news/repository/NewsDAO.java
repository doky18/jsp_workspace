package news.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import news.domain.News;
import news.mybatis.MybatisConfig;

public class NewsDAO {
	
	//SqlSessionFactory가 이 객체에 존재
	MybatisConfig config = MybatisConfig.getInstance(); 
	
	public int insert(News news) {
		int result=0;
		SqlSession sqlSession=config.getSqlSession();
		result = sqlSession.insert("News.insert", news);
		sqlSession.commit();
		config.release(sqlSession);
		return result;
	}
	
	public List selectAll() {
		List list =null;
		SqlSession sqlSession = config.getSqlSession();
		list =sqlSession.selectList("News.selectAll");
		config.release(sqlSession);
		//얜 커밋이 필요가 없음 왜?
		return list;
	}
	
	public News select(int news_idx) {
		News news= null;
		SqlSession sqlSession=config.getSqlSession();
		news = sqlSession.selectOne("News.select", news_idx);
		config.release(sqlSession);
		return news;
	}
	
	public int update(News news) {
		return 0;
	}
	
	public int delete(int news_idx) {
		return 0;
	}
}
