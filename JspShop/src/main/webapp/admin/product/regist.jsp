<%@page import="com.jspshop.util.FileManager"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="java.io.File"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="com.jspshop.exception.PsizeException"%>
<%@page import="com.jspshop.exception.ColorException"%>
<%@page import="com.jspshop.exception.ProductException"%>
<%@page import="com.jspshop.repository.PsizeDAO"%>
<%@page import="com.jspshop.repository.ColorDAO"%>
<%@page import="com.jspshop.repository.ProductDAO"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="com.jspshop.mybatis.MybatisConfig"%>
<%@ page contentType="text/html;charset=UTF-8"%>

<%!
MybatisConfig mybatisConfig = MybatisConfig.getInstance();
    ProductDAO productDAO = new ProductDAO();
    ColorDAO colorDAO = new ColorDAO();
    PsizeDAO psizeDAO = new PsizeDAO();
    
    //업로드 관련 설정 정보를 보유할 객체 
    DiskFileItemFactory factory = new DiskFileItemFactory();
    %>
    
<%
	int maxSize = 5*(1024*1024);
	String path = application.getRealPath("/data/");		//절대 경로
	factory.setSizeThreshold(maxSize);		//업로드 최대 사이즈 지정
	factory.setRepository(new File(path));		//임시 디렉토리 및 저장경로 
	
	ServletFileUpload upload=new ServletFileUpload(factory);
	
	//업로드 된 파라미터 분석
	List<FileItem> itemList = upload.parseRequest(request);		//요청객체를 매개변수로 넣어햐 
	
	//넘어온 파라미터 수만큼 반복문 돌면서, 파라미터 분석하자 
	for(FileItem item : itemList){
		if(item.isFormField()){//텍스트 필드라면...
			
		}else{//파일 컴포넌트라면...
			long time = System.currentTimeMillis();
			String ext = FileManager.getExt(item.getName());
			System.out.println(path);
			item.write(new File(path+time+"."+ext));		//서버에 파일저장 
			Thread.sleep(500);		//너무 빠른 처리 방지 
		}
	}

// 상품 등록이란 여러 테이블을 대상으로 DML이 수행되어야 하므로 대표적인 트랜잭션 상황의 업무임
// 트랜잭션이란 :
//    따라서 DML을 수행하는 DAO들이 각자가 아닌 커넥션을 공유하여 DML을 수행하도록 해보겠음
// => 여기서 SqlSession을 대표로 취득하겠음!
%>
<%
/*
SqlSession sqlSession = mybatisConfig.getSqlSession();

//setter를 이용한 SqlSession 객체 주입
productDAO.setSqlSession(sqlSession);
colorDAO.setSqlSession(sqlSession);
psizeDAO.setSqlSession(sqlSession);

//업무가 끝나면 여기서 닫기
mybatisConfig.release(sqlSession);

//DAO에게 일시키기
try {
    productDAO.insert(null);
    colorDAO.insert(null);
    psizeDAO.insert(null);
    //여기까지 내려왔다면 에러를 모두 통과한 상황
    sqlSession.commit();

} catch (ProductException e) { //productDAO에서 에러가 난 상황
    sqlSession.rollback();
} catch (ColorException e) {
    sqlSession.rollback();
} catch (PsizeException e) {
    sqlSession.rollback();
} finally {
    mybatisConfig.release(sqlSession);
}
*/
%>