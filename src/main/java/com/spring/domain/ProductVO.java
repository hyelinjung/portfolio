package com.spring.domain;

import java.sql.Date;
import java.util.List;

import lombok.Data;
@Data
public class ProductVO {
	
	private int product_num;
	private String cateCode;
	private String p_code;
	private String p_name;
	//private String p_img;
	private String cateName;
	private int p_price;
	private double p_Discount;
	private String p_info;
	private String p_content;
	private int p_Stock;
	private Date p_regdate;
	private Date p_update;
	/* 이미지 테이블 리스트 변수 */
	private List<ImageVO> imageList;
	
	
	
	
}
