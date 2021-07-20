package com.du.shopping.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.du.shopping.domain.MemberVO;

@Repository
public class MemberDAOImpl implements MemberDAO{
	
	@Inject
	private SqlSession sql;
	
	private static String namespace = "com.du.shopping.mappers.memberMapper";
	
	@Override
	public void signup(MemberVO vo) throws Exception{
		sql.insert(namespace + ".signup", vo);
	}
	
	@Override
	public MemberVO signin(MemberVO vo) throws Exception{
		return sql.selectOne(namespace + ".signin", vo);
	}
	
	@Override
	public void signmodify(MemberVO vo) throws Exception{
		sql.update(namespace + ".signmodify", vo);
	}
	
}
