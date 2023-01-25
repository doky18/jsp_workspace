package com.jspshop.domain;

import lombok.Data;

@Data
public class Cart extends Product{
	//상품에는 존재하는 속성인 개수를 추가하자~!~~
	private int ea;
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
	private Member member;
}
