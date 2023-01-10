package gallery.servlet;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import gallery.repository.GalleryDAO;

public class DeleteServlet extends HttpServlet{
	GalleryDAO galleryDAO = new GalleryDAO();
	ServletContext context;		//어플리케이션의 전반적인 컨텍스트 (행위 달성을 위한 부가정보를 위한 )
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//요청 파라미터 받기
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=UTF-8");
		
		String gallery_idx = request.getParameter("gallery_idx"); 	//delete gallery where gallery_idx=5;
		String filename = request.getParameter("filename");
		System.out.println("gallery_idx is " +gallery_idx);
		
		//로컬 하드의 파일을 제어하기 위해서는 자바의 File 클래스..
		context = request.getServletContext();
		String app_path = context.getRealPath("/data/");
		System.out.println("어플리케이션의 위치는 "+ app_path+filename);
		
		File file = new File(app_path+filename);  //파일이름 복원
		
		PrintWriter out=response.getWriter();//출력스트림 객체 얻기
		
		boolean flag = file.delete();
		System.out.println(flag);
		
		if(file.delete()) {  //파일이 삭제되었다면..
			int result = galleryDAO.delete(Integer.parseInt(gallery_idx));		//DB 삭제 + 파일
			System.out.println(result);
			
			out.print("<script>");
			if(result>0) {
				out.print("alert('삭제완료');");
				out.print("location.href='/gallery/list.jsp';");
			}else {
				out.print("alert('삭제실패');");
				out.print("history.back()");
			}
			out.print("</script>");
			
		galleryDAO.delete(Integer.parseInt(gallery_idx));
		}
	}
}
