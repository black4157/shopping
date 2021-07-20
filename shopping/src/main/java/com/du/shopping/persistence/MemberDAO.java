package com.du.shopping.persistence;

import com.du.shopping.domain.MemberVO;

public interface MemberDAO {
	public void signup(MemberVO vo) throws Exception;
	
	public MemberVO signin(MemberVO vo) throws Exception;

	public void signmodify(MemberVO vo) throws Exception;
	
}
