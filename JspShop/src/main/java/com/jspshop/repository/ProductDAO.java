package com.jspshop.repository;

import org.apache.ibatis.session.SqlSession;

import com.jspshop.domain.Product;
import com.jspshop.exception.ProductException;

public class ProductDAO {
	private SqlSession sqlSession;
	
	//생성자 주입 (injection)
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession=sqlSession;
	}
	
	
	public int insert(Product product) throws ProductException{	//내가 만든 예외를 처리하는게 아니라 회피해서 외부에 알린 것 
		int result = 0;
		result = sqlSession.insert("Product.insert", product);
		//여기서 commit 노노 -> 서블릿이 커밋 할 것 (세 DAO가 다 되면)
		if(result<1) {
			//에러를 일부러 일으키자! throws가 아니라 throw임
			//왜 에러를 일으키느냐? 뭔갈 알려주려고
			throw new ProductException("상품이 등록되지 않았어요");
		}
		return result;
	}
}
