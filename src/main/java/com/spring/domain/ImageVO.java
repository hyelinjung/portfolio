package com.spring.domain;

import lombok.Data;

@Data
public class ImageVO {
	/* 경로 */
	private String uploadPath;
	
	/* uuid */
	private String uuid;
	
	/* 파일 이름 */
	private String uploadFileName;
	
	/* 상품 id */
	private int product_num;
}
