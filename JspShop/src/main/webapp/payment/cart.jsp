<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="com.jspshop.repository.ProductDAO"%>
<%@page import="com.jspshop.mybatis.MybatisConfig"%>
<%@page import="com.jspshop.domain.Member"%>
<%@page import="com.jspshop.domain.Cart"%>
<%@page import="com.jspshop.domain.Product"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%!
	MybatisConfig mybatisConfig = MybatisConfig.getInstance();
	ProductDAO productDAO = new ProductDAO();
%>
<%
	//클라이언트의 장바구니 등록 요청을 처리한다
	
	//지금 요청이, 만일 최초의 요청이라면 고양이는 세션 객체 생성 및 ID 할당 
	//최초 요청 여부 판단은?
	//클라이언트의 브라우저에 흔적을 남긴 쿠키 ID 존재 여부로....
	String sid = session.getId();
	System.out.println("이 요청에 대해 생성된 세션 ID : "+sid);
	
	//장바구니 목록을 표현하기 위한 순서있는 컬렉션인 리스트를 준비하자
	List <Cart>cartList = new ArrayList<Cart>();
	
	//List를 세션에 담지 않으면, service() 메서드의 지역변수이므로, 요청시마다 생성되어 소멸되기를 반복한다..
	//따라서 생명을 유지할 수 있는 보다 전역적인 영역에 List 를 보관해놓자
	//현재로서는 세션이 가장 적합히다 
	//application : 이 객체에 담으면 톰캣이 꺼질때까지 사용가능
	//session : 세션이 끊길때 (브라우저 닫거나 일정시간 요청이 없거나)
	//이미 cartList가 세션이 담겨져 있을 때는 덮어쓰지 말기!
	if(session.getAttribute("cartList")==null){		//전혀 없을때만 담는다...
		session.setAttribute("cartList", cartList);
	}
	
	//원래는 로그인 한 유저를 대상으로 하므로, session.getAttribute()로 얻어와야한다 (추후 진행)
	Member member = new Member();		
	member.setMember_idx(1);		//임시 데이터
	member.setId("doky");
	
	//무엇을?
	String product_idx = request.getParameter("product_idx");

	SqlSession sqlSession  = mybatisConfig.getSqlSession();
	productDAO.setSqlSession(sqlSession); // injection
	
	Product product=productDAO.select(Integer.parseInt(product_idx));
	
	//how many? 1
	Cart cart = new Cart();		//empty
	cart.setMember(member);		//누가
	cart.setProduct(product); //무엇을
	cart.setEa(1);		//목록을 통해 담을때는 1개를 디폴트로 담는다 
	
	//한건의 장바구니 객체를 List에 담자!
	List sessionCartList = (List)session.getAttribute("cartList");
	
	sessionCartList.add(cart);
	System.out.println("현재 장바구니에 "+sessionCartList.size()+"건이 담겼어요");
	out.print("장바구니에 상품을 담았습니다");
	
%>