package mvc.controller.board;

//글쓰기를 담당하는 컨트롤러 
//3 단계 : 알맞는 로직 객체에 일을 시키기
//4 단계 : 결과가 있다면 결과 저장.. (DML인 결우엔 결과 없다...)
//위 두 단계를 수행하는 컨트롤러
public class RegistController {		
	//extends HttpServlet 할 필요 없음. 요청은 이미 앞에서 받았으니까
	//따라서 매서드 명도 우리 마음대로 지을 수 있음 (doPost 같은거 말고)
	public void regist() {
		System.out.println("글쓰기 수행할 예정");
	}
	
}



