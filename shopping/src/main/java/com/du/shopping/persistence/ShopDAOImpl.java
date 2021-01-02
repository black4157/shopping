package com.du.shopping.persistence;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.du.shopping.domain.GoodsViewVO;
import com.du.shopping.domain.ReplyListVO;
import com.du.shopping.domain.ReplyVO;

@Repository
public class ShopDAOImpl implements ShopDAO {
	private static String namespace = "com.du.shopping.mappers.shopMapper";

	@Inject
	private SqlSession sql;

	@Override
	public List<GoodsViewVO> list(int cateCode, int cateCodeRef) throws Exception{	
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("cateCode", cateCode);
		map.put("cateCodeRef", cateCodeRef);
		
		return sql.selectList(namespace + ".list_1", map);
	}
	
	@Override
	public List<GoodsViewVO> list(int cateCode) throws Exception {
		return sql.selectList(namespace + ".list_2", cateCode);
	}
	
	@Override
	public GoodsViewVO goodsView(int gdsNum) throws Exception{
		return sql.selectOne("com.du.shopping.mappers.adminMapper" + ".goodsView", gdsNum);
	}
	
	@Override
	public void registReply(ReplyVO reply) throws Exception{
		sql.insert(namespace + ".registReply", reply); 
	}
	
	@Override
	public List<ReplyListVO> replyList(int gdsNum) throws Exception{
		return sql.selectList(namespace + ".replyList", gdsNum);
	}
	
	//댓글 삭제
	@Override
	public void deleteReply(ReplyVO reply) throws Exception{
		sql.delete(namespace + ".deleteReply", reply);
	}
		
	//아이디 체크
	@Override
	public String idCheck(int repNum) throws Exception{
		return sql.selectOne(namespace + ".replyUserIdCheck", repNum);
	}
}
