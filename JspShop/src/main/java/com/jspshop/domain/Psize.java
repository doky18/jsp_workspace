package com.jspshop.domain;

public class Psize {
	
	public int getPsize_idx() {
		return psize_idx;
	}
	public void setPsize_idx(int psize_idx) {
		this.psize_idx = psize_idx;
	}
	public Product getProduct() {
		return product;
	}
	public void setProduct(Product product) {
		this.product = product;
	}
	public String getPsize_name() {
		return psize_name;
	}
	public void setPsize_name(String psize_name) {
		this.psize_name = psize_name;
	}
	private int psize_idx;
	private Product product;
	private String psize_name;

}
