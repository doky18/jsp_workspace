package com.jspshop.domain;


public class Cart{
	private Product product;
	//상품에는 존재하는 속성인 개수를 추가하자~!
	private int ea;
	private Member member;
	
	
	public Product getProduct() {
		return product;
	}
	public void setProduct(Product product) {
		this.product = product;
	}
	public int getEa() {
		return ea;
	}
	public void setEa(int ea) {
		this.ea = ea;
	}
	public Member getMember() {
		return member;
	}
	public void setMember(Member member) {
		this.member = member;
	}
}



