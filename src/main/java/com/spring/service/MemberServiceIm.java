package com.spring.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.domain.MemberVO;
import com.spring.mapper.Join;

import lombok.extern.log4j.Log4j;
@Service
@Log4j
public class MemberServiceIm implements MemberService  {

	@Autowired
	private Join join;
	
	@Override
	public void memberJoin(MemberVO member) throws Exception {
		
		join.memberJoin(member);
	}

	@Override
	public MemberVO memberLogin(MemberVO member) throws Exception {
		
		return join.memberLogin(member);
	}

}
