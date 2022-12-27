package com.spring.service;

import java.util.List;

import com.spring.domain.CartVO;

public interface CartService {
	/* 장바구니 추가 */
	public int addCart(CartVO cart);
	
	/* 장바구니 정보 보이기 */
	public List<CartVO> getCart(String memberId);
	
	/* 카트 수량 수정 */
	public int modifyCount(CartVO cart);
	/* 카트 삭제 */
	public int deleteCart(int cartId);
	
}
