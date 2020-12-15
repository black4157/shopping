package com.du.shopping.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.du.shopping.domain.MemberVO;
import com.du.shopping.persistence.MemberDAO;

@Service
public class MemberServiceImpl implements MemberService{
	
	@Inject
	private MemberDAO dao;
	
	@Override
	public void signup(MemberVO vo) throws Exception{
		dao.signup(vo);
	}
}
