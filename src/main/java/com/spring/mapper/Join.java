package com.spring.mapper;

import com.spring.domain.MemberVO;

public interface Join {

	//회원가입
		public void memberJoin(MemberVO member);
		 /* 로그인 */
	    public MemberVO memberLogin(MemberVO member);
	
	
}
