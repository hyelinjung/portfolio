package com.spring.domain;

import java.util.List;

public class CartVO {
	private int cartId;

	private String memberId;

	private int product_num;

	private int productCount;

	// product

	public List<ImageVO> getImageList() {
		return imageList;
	}

	public void setImageList(List<ImageVO> imageList) {
		this.imageList = imageList;
	}

	private String p_name;

	private int p_price;

	private double p_Discount;
	/* 상품 이미지 */
	private List<ImageVO> imageList;

	// 추가
	private int salePrice;

	private int totalPrice;

	public int getCartId() {
		return cartId;
	}

	public void setCartId(int cartId) {
		this.cartId = cartId;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public int getProduct_num() {
		return product_num;
	}

	public void setProduct_num(int product_num) {
		this.product_num = product_num;
	}

	public int getProductCount() {
		return productCount;
	}

	public void setProductCount(int productCount) {
		this.productCount = productCount;
	}

	public String getP_name() {
		return p_name;
	}

	public void setP_name(String p_name) {
		this.p_name = p_name;
	}

	public int getP_price() {
		return p_price;
	}

	public void setP_price(int p_price) {
		this.p_price = p_price;
	}

	public double getP_Discount() {
		return p_Discount;
	}

	public void setP_Discount(double p_Discount) {
		this.p_Discount = p_Discount;
	}
	
	public int getSalePrice() {
		return salePrice;
	}

	public int getTotalPrice() {
		return totalPrice;
	}

	public void initSaleTotal() {  //세일과 토탈값을 초기화 시킬수 있는 메소드
		this.salePrice = (int) (this.p_price * (1-this.p_Discount));
		this.totalPrice = this.salePrice*this.productCount;
	}

	@Override
	public String toString() {
		return "CartVO [cartId=" + cartId + ", memberId=" + memberId + ", product_num=" + product_num
				+ ", productCount=" + productCount + ", p_name=" + p_name + ", p_price=" + p_price + ", p_Discount="
				+ p_Discount + ", imageList=" + imageList + ", salePrice=" + salePrice + ", totalPrice=" + totalPrice
				+ "]";
	}
	
	
	
}
