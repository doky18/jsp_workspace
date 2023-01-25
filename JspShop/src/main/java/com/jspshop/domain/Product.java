package com.jspshop.domain;

import java.util.List;

import lombok.Data;

@Data
public class Product {
	public int getProduct_idx() {
		return product_idx;
	}
	public void setProduct_idx(int product_idx) {
		this.product_idx = product_idx;
	}
	public Category getCategory() {
		return category;
	}
	public void setCategory(Category category) {
		this.category = category;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public String getBrand() {
		return brand;
	}
	public void setBrand(String brand) {
		this.brand = brand;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getDiscount() {
		return discount;
	}
	public void setDiscount(int discount) {
		this.discount = discount;
	}
	public String getDetail() {
		return detail;
	}
	public void setDetail(String detail) {
		this.detail = detail;
	}
	public List<Psize> getPsizeList() {
		return psizeList;
	}
	public void setPsizeList(List<Psize> psizeList) {
		this.psizeList = psizeList;
	}
	public List<Color> getColorList() {
		return colorList;
	}
	public void setColorList(List<Color> colorList) {
		this.colorList = colorList;
	}
	public List<Pimg> getPimgList() {
		return pimgList;
	}
	public void setPimgList(List<Pimg> pimgList) {
		this.pimgList = pimgList;
	}
	private int product_idx; //0
	private Category category;//mybatis에서 부모를 association 연결
	private String product_name;
	private String brand;
	private int price;
	private int discount;
	private String detail;
	
	//하나의 상품이 거느리고 있는 자식 테이블을 표현한 DTO들...
	private List<Psize> psizeList; //mybatis 의 collection의 대상임
	private List<Color> colorList;
	private List<Pimg> pimgList;
	
}





