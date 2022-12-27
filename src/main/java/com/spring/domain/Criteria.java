package com.spring.domain;

import lombok.Data;

@Data
public class Criteria {
	private int pageNum;
	private int amount;
	
	public Criteria() {
		this(1,10);
	}
	public Criteria(int pageNum, int amount) {
		this.pageNum =pageNum;
		this.amount =amount;
	}
    
    /* 검색 타입 */
    private String type;
    
    /* 검색 키워드 */
    private String keyword;
    
    /* 검색 타입 데이터 배열 변환 */
	
	  public String[] getTypeArr() { return type == null? new String[]
	  {}:type.split(""); }
	 
}
