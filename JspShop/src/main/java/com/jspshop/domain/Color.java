package com.jspshop.domain;

public class Color {
	private int color_idx;
	public int getColor_idx() {
		return color_idx;
	}
	public void setColor_idx(int color_idx) {
		this.color_idx = color_idx;
	}
	public Product getProduct() {
		return product;
	}
	public void setProduct(Product product) {
		this.product = product;
	}
	public String getColor_name() {
		return color_name;
	}
	public void setColor_name(String color_name) {
		this.color_name = color_name;
	}
	private Product product;		//부모인 Product 를 association 으로 가져옴 1:1관계를 말함
	private String color_name;
}
