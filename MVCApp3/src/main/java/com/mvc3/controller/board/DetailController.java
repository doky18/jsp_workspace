package com.mvc3.controller.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import com.mvc3.controller.Controller;
import com.mvc3.domain.Board;
import com.mvc3.model.board.BoardDAO;
import com.mvc3.mybatis.MybatisConfig;

//상세보기 요청을 처리하는 하위 컨트롤러
public class DetailController implements Controller{
	//1)
	MybatisConfig mybatisConfig = MybatisConfig.getInstance();
	BoardDAO boardDAO = new BoardDAO();

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		//2)
		SqlSession sqlSession = mybatisConfig.getSqlSession();
		boardDAO.setSqlSession(sqlSession);
		
		String board_idx = request.getParameter("board_idx");
		
		//3 단계)한 건 가져오기
		Board board = boardDAO.select(Integer.parseInt(board_idx));
		
		
		//4 단계) 저장할 것이 있다
		request.setAttribute("board", board);
		
		//5)
		mybatisConfig.release(sqlSession);
	}

	@Override
	public String getViewName() {
		//6)
		return"/board/view/detail";
		
		//7)list.jsp로 가서 상세보기로 가는 링크 걸기 
	}

	@Override
	public boolean isForward() {
		return true;
	}
}
