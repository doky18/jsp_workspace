package com.mvc3.controller.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import com.mvc3.controller.Controller;
import com.mvc3.model.board.BoardDAO;
import com.mvc3.mybatis.MybatisConfig;

public class DeleteController implements Controller{
	//1.
	MybatisConfig mybatisConfig = MybatisConfig.getInstance();
	BoardDAO boardDAO = new BoardDAO();

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		SqlSession sqlSession = mybatisConfig.getSqlSession();
		boardDAO.setSqlSession(sqlSession);
		
		String board_idx = request.getParameter("board_idx");
		
		//3단계 : 
		boardDAO.delete(Integer.parseInt(board_idx));
		
		sqlSession.commit();
		mybatisConfig.release(sqlSession);
	}

	@Override
	public String getViewName() {
		// TODO Auto-generated method stub
		return "/board/view/delete";
	}

	@Override
	public boolean isForward() {
		// TODO Auto-generated method stub
		return false;//재접속 
	}

}
