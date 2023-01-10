<%@page contentType="text/html;charset=UTF-8"%>

<%@page import="gallery.repository.GalleryDAO"%>
<%@page import="gallery.util.FileManager"%>
<%@page import="java.io.IOException"%>
<%@page import="gallery.domain.Gallery"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.File"%>

<%!
GalleryDAO galleryDAO = new GalleryDAO();
%>
<%
//파라미터를 받아 오라클에 넣기
request.setCharacterEncoding("utf-8"); //파라미터에 대한 인코딩 처리

//클라이언트가 파일을 포함하여 인코딩 된 형식으로 요청을 시도할 때 
// 기존에 텍스트 파라미터를 받을 때 사용한 getParameter() 메서드로는 
//바이너리 파일을 포함한 기타 파라미터도 받을 수 없다
//해결방법 : 업로드 라이브러리를 이용해야 함

//C:\jsp_workspace\GalleryProject\data
//C:/jsp_workspace/GalleryProject/srcmain/webapp/data/

//우리가 서블릿에서 사용했던 ServletContext 인터페이스는 jsp에서 내장객체로 지원을 하고 있다
//따라서 서블릿을 할 줄 모르는 개발자는 내장객체를 이용할 수 있다.
String savePath = application.getRealPath("/data/");

//String savePath = "C:/jsp_workspace/GalleryProject/src/main/webapp/data/";  //그림 data를 webapp에 넣어줘야지 얘가 접근 할 수 있음
int maxSize = 1024 * 1024 * 5; //5MB제한
MultipartRequest multi = null;

try {
	multi = new MultipartRequest(request, savePath, maxSize,"utf-8");
	//이미 생성자에서 업로드가 완료되었기 때문에, 생성된 파일을 대상으로 파일명을 바꾸자 
	
	//업로드된 파일의 레퍼런스 얻기! 
	File file=multi.getFile("file");//html에서의 컴포넌트 이름 
	long time = System.currentTimeMillis();		//파일명에 사용할 숫자
	String ext = FileManager.getExt(file.getName());		//파일명
	
	file.renameTo(new File(savePath+time+"."+ext));  //기존의 파일을 새로운 이름으로 바꾸자
	
	
	String title = multi.getParameter("title");
	String writer = multi.getParameter("writer");
	String content = multi.getParameter("content");
	
	//DTO에 담기
	Gallery gallery = new Gallery();
	
	gallery.setTitle(title);
	gallery.setWriter(writer);
	gallery.setContent(content);
	gallery.setFilename(time+"."+ext);		//파일명 채우기
	
	//DAO insert 호출
    int result = galleryDAO.insert(gallery);
    out.print(result);
    
	out.print("<script>");
	if(result>0){
		out.print("alert('업로드 성공');");
		out.print("location.href='/gallery/list.jsp';");
	}
	out.print("</script>");
		
	out.print(title + "<br>");
	out.print(writer + "<br>");
	out.print(content + "<br>");
	//String file = request.getParameter("file");
} catch (IOException e) {
	
	out.print("<script>");
	out.print("파일의 크기는 5MB 이하로 제한되어 있습니다");
	out.print("history.back();");
	out.print("</script>");
	
}
%>