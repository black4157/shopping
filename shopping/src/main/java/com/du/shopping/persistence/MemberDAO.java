package com.du.shopping.persistence;

import com.du.shopping.domain.MemberVO;

public interface MemberDAO {
	public void signup(MemberVO vo) throws Exception;
}
