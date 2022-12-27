package com.spring.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.domain.CartVO;
import com.spring.domain.MemberVO;
import com.spring.service.CartService;

import lombok.extern.log4j.Log4j;


@Controller
@Log4j
@RequestMapping(value = "/cart/*")
public class CartController {

	@Autowired
	private CartService cartService;
	
	
	
	//장바구니에 등록
	@PostMapping(value="add")
	@ResponseBody //ajax로 받은값을 돌려주기 위해서
	public String cartadd(CartVO cartVO, HttpServletRequest request) {
		System.out.println("장바구니 함수 입장");
		HttpSession session = request.getSession(); //로그인한 회원인지 알수 있게 세션 초기화
		MemberVO vo = (MemberVO) session.getAttribute("member"); //세션에서 로그인해서 등록한 member 객체 변수 가져오기
		if(vo == null) { //회원이 아니라면 3리턴
			return "3";
		}
		int a = cartService.addCart(cartVO); //서비스단에서 등록(1) 실패(0) 중복(2) 리턴받은 값을 a에 초기화
		
		return a+""; //문자열타입으로 리턴하기위해서 ""사용
		
	}
	//상품리스트 불러오기
	@GetMapping(value="{memberId}")
	public String cartlist(Model model, @PathVariable("memberId")String memberId) {
		log.info(cartService.getCart(memberId));
		model.addAttribute("cartInfo",cartService.getCart(memberId)); //model변수에 담아서 뷰로 이동,이미지 포함
		return "cart"; //cart 뷰로 이동
		
	}
	//상품수량 변경
	@PostMapping(value="update")
	public String cartupdate(CartVO cartVO) {
		cartService.modifyCount(cartVO); //수량변경
		return "redirect: /cart/" + cartVO.getMemberId(); // 상품리스트 불러오는 함수로 리다이랙트
	}
	/* 장바구니 삭제 */
	@PostMapping("delete")
	public String cartdelet(CartVO cart) {
		log.info("삭제합수 입잔");
		
		cartService.deleteCart(cart.getCartId());
		
		return "redirect:/cart/" + cart.getMemberId();// 상품리스트 불러오는 함수로 리다이랙트
		
	}
}
