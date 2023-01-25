package com.jspshop.domain;

import lombok.Data;

@Data
public class Pimg {
	public int getPimg_idx() {
		return pimg_idx;
	}
	public void setPimg_idx(int pimg_idx) {
		this.pimg_idx = pimg_idx;
	}
	public Product getProduct() {
		return product;
	}
	public void setProduct(Product product) {
		this.product = product;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	
	private int pimg_idx;
	private Product product;
	private String filename;
}