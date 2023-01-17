package notice.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import notice.domain.Notice;
import notice.mybatis.MybatisConfig;

public class NoticeDAO {
		//sql문을 수행할 세션 객체 올려주기
		MybatisConfig config=MybatisConfig.getInstance();
		
		//insert
		public int insert(Notice notice) {
			int result=0;
			SqlSession sqlSession = config.getSqlSession();
			result= sqlSession.insert("Notice.insert", notice);
			sqlSession.commit();
			config.release(sqlSession);
			return result;
		}
		
		//게시물 전체 가져오기
		public List selectAll() {
			List list = null;
			SqlSession sqlSession = config.getSqlSession();
			list = sqlSession.selectList("Notice.selectAll");
			sqlSession.commit();
			config.release(sqlSession);
			return list;
		}
		
		//게시물 한 건 가져오기 (오른쪽 미리보기로)
}
