package board.servlet;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.repository.BoardDAO;

public class DeleteServlet extends HttpServlet{
	BoardDAO boardDAO = new BoardDAO();
	ServletContext context;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		
		//선택한 idx값에 대한 제목, 작성자, 내용을 지우고, 파일도 지워야 함.
		//필요한 건 idx값과 filename
		String board_idx = request.getParameter("board_idx");
		String filename = request.getParameter("filename");
		
		System.out.println("board_idx 는"+ board_idx);
		
		//이미지 삭제를 위해서는 경로와 이름을 알아야하는데 우리는 지금 파라미터로 가져오고 있음
		//이제 경로만 얻어오면 된다. ->문맥 파악! context
		
		// 로컬 하드의 파일을 제어하기 위해서는 자바의 File 클래스를 이용해야 함
		// 좋지 않은 방법 : 경로를 직접 가져오는 건 하드코딩임
		// File file = new File("E:/jsp_workspace/GalleryProject/src/main/webapp/data");
		
		context = request.getServletContext();
		String savePath=context.getRealPath("/data");
		
		File file = new File(savePath+"/"+filename);
		System.out.println(savePath+"/"+filename);
		
		PrintWriter out=response.getWriter();//출력스트림 객체얻기
		
		if(file.delete()) {
			int result = boardDAO.delete(Integer.parseInt(board_idx));
			
			out.print("<script>");
			if(result>0) {
				out.print("alert('삭제완료');");
				out.print("location.href='/gallery/list.jsp';");
			}else {
				out.print("alert('삭제실패');");
				out.print("history.back();");
			}
			out.print("</script>");
		out.print("<script>");
			if(result>0) {
				out.print("alert('삭제완료');");
				out.print("location.href='/gallery/list.jsp';");
			}else {
				out.print("alert('삭제실패');");
				out.print("history.back();");
			}
			out.print("</script>");	
		}
	}
}
