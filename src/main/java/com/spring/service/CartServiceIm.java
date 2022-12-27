package com.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.domain.CartVO;
import com.spring.domain.ImageVO;
import com.spring.mapper.Cart;
import com.spring.mapper.Product;
@Service
public class CartServiceIm implements CartService {

	@Autowired
	private Cart mapper; 
	@Autowired
	private Product product;
	
	
	
	@Override
	public int addCart(CartVO cart)  {
	CartVO a = mapper.checkCart(cart);//장바구니에 등록할수있는지 체크쿼리문 돌림
	if(a!=null) {
		return 2; //중복
	}
	try {
		int b =0;
		b=mapper.addCart(cart);
		return b; //등록(1)
	} catch (Exception e) {
		return 0; //등록실패
	}
	
	}

	
	/* 상품 리스트 보여줌 */
	@Override
	public List<CartVO> getCart(String memberId) { 
		List<CartVO> cart = mapper.getCart(memberId); /* mapper에서 가져옴 정보를 리스트타입 cart객체에 초기화 */
		for(CartVO dto : cart) { //total,sale변수에 초기화 시키기위해 for문으로 돌리면서 함수불러서 사용
			dto.initSaleTotal();
			int a=dto.getProduct_num(); //이미지 정보를 가져오기 위해서 상품번호 가져오기
			List<ImageVO> lisVos = product.getimgList(a); //이미지 리스트 가져오기 쿼리를 통해서 이미지 경로가져오기
			dto.setImageList(lisVos); //cartvo에 삽입
		}
		return cart; //모든 정보를 cart 에 담아 리턴
	}


	@Override
	public int modifyCount(CartVO cart) {
		
		return mapper.modifyCount(cart);
	}


	@Override
	public int deleteCart(int cartId) {
		
		return mapper.deleteCart(cartId);
	}
	
}
