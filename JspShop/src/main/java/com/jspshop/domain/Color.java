package com.jspshop.domain;


public class Color {
	public Color() {
		System.out.println("Color 생성자 호출");
	}
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
	private int color_idx;
	private Product product;//부모인 Product 을 assocation으로 가져옴
	private String color_name;
}