package comments.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import news.domain.Comments;
import news.domain.News;
import news.repository.CommentsDAO;
import news.util.ResponseMessage;

public class RegistServlet extends HttpServlet{
	CommentsDAO commentsDAO = new CommentsDAO();
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			//insert into (comments_idx, msg, author, news_idx)
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");
		
		PrintWriter out = response.getWriter();
		
		String news_idx=request.getParameter("news_idx");
		String msg=request.getParameter("msg");
		String writer=request.getParameter("writer");
		
		//코멘츠DTO에 담기
		Comments comments = new Comments();
		News news = new News();
		news.setNews_idx(Integer.parseInt(news_idx));
		comments.setNews(news);		//news에 넣기 
		comments.setMsg(msg);
		comments.setWriter(writer);
		
		
		
		//comment 한 건 넣기
		int result = commentsDAO.insert(comments);
		if(result>0) {
			out.print(ResponseMessage.getMsgURL("등록 성공", "/news/content.jsp?news_idx="+news_idx));
		}else {
			out.print(ResponseMessage.getMsgBackL("등록 실패"));
		}
	}
}
