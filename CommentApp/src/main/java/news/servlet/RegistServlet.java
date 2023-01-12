package news.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import news.domain.News;
import news.repository.NewsDAO;
import news.util.ResponseMessage;

public class RegistServlet extends HttpServlet{
	NewsDAO newsDAO;
	
	public RegistServlet() {
		newsDAO = new NewsDAO();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		String title =request.getParameter("title");
		String writer = request.getParameter("writer");
		String content = request.getParameter("content");
		
		News news = new News();
		news.setTitle(title);
		news.setWriter(writer);
		news.setContent(content);		//파라미터가 다 채워진 시점
		
		int result = newsDAO.insert(news);
		
		if(result>0) {
			out.print(ResponseMessage.getMsgURL("성공", "/news/list.jsp"));
		}else {
			out.print(ResponseMessage.getMsgBackL("실패"));
		}
		
		out.print("등록 처리 서블릿 호출 성공");
	}
}
