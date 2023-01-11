package board.servlet;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import board.domain.Board;
import board.repository.BoardDAO;
import board.util.FileManager;

public class UpdateServlet extends HttpServlet {
	ServletContext context;
	DiskFileItemFactory factory;
	int maxsize=5*1024*1024;
	String savePath;
	BoardDAO boardDAO = new BoardDAO();  //밑에서 호출만 해주면 됨

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charse=utf-8");
		request.setCharacterEncoding("utf-8");
		
		context = request.getServletContext();
		//설정객체
		factory = new DiskFileItemFactory();
		factory.setSizeThreshold(maxsize);
		savePath = context.getRealPath("/data/");
		
		//임시파일의 위치이자, 실제 파일이 위치할 곳
		factory.setRepository(new File(savePath));	
		
		//업로드 객체
		ServletFileUpload upload = new ServletFileUpload(factory);
		//요청 분석 시작 
		try {
			List <FileItem> itemList =upload.parseRequest(request);
			
			//우리의 경우엔 4번 돌 것
			Board board = new Board();
			
			for(FileItem item : itemList) {
				if(item.isFormField()) {		//텍스트 테이터라면..
					switch(item.getFieldName()) {
					case"board_idx":board.setBoard_idx(Integer.parseInt(item.getString()));break;
					case"filename":board.setFilename(item.getString());break;
					case"title":board.setTitle(item.getString("utf-8"));break;
					case"writer":board.setWriter(item.getString("utf-8"));break;
					case"content":board.setContent(item.getString("utf-8"));break;
					}

				}else {
					//파일 업로드 한 경우만..
					if(item.getSize()>0) {		//이미지 등록을 안했다면 이미지 사이즈 조건에 걸려서 이 아래는 만나지 않음
						long time = System.currentTimeMillis();
						String ext = FileManager.getExt(item.getName());
						File file = new File(savePath+time+"."+ext);		//새롭게 업로드 될 파일
						
						try {
							item.write(file);		//실제 존재하는 파일
							//기존 파일 제거 
							File df = new File(savePath+board.getFilename());		//지워질 파일은 dto가 가지고 있으므로, 기존 파일을 찾아서 제거
							if(df.delete()) {		//그 파일 지우기 얜 논리값으로 반환되는게 아니라서 if문으로 조건 주기 
								//잘 지워졌다면 
								board.setFilename(time+"."+ext);	// 새로운 파일명으로 대체
								//boardDAO.update(board);
								
							}
						} catch (Exception e) {
							e.printStackTrace();
						}  
					}else {
						//파일업로드 없이 update
						//boardDAO.update(board);  //새로 조작된 것 없이 그대로...
					}
				}
			}
			boardDAO.update(board); 
			
		} catch (FileUploadException e) {
			e.printStackTrace();
		}
	}
}
