package com.du.shopping.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.du.shopping.domain.CategoryVO;
import com.du.shopping.domain.GoodsVO;
import com.du.shopping.domain.GoodsViewVO;
import com.du.shopping.domain.MemberVO;
import com.du.shopping.domain.OrderListVO;
import com.du.shopping.domain.OrderVO;
import com.du.shopping.domain.ReplyListVO;

@Repository
public class AdminDAOImpl implements AdminDAO{
	
	@Inject
	private SqlSession sql;
	
	private static String namespace = "com.du.shopping.mappers.adminMapper";
	
	@Override
	public List<CategoryVO> category() throws Exception{
		return sql.selectList(namespace + ".category");
	}
	
	@Override
	public void register(GoodsVO vo) throws Exception{
		sql.insert(namespace + ".register", vo);
	}
	
	@Override
	public List<GoodsViewVO> goodslist() throws Exception{
		return sql.selectList(namespace + ".goodslist");
	}
	
	@Override
	public List<GoodsViewVO> populargoodslist() throws Exception{
		return sql.selectList(namespace + ".populargoodslist");	
	}
	
	@Override
	public GoodsViewVO goodsView(int gdsNum) throws Exception{
		return sql.selectOne(namespace + ".goodsView", gdsNum);
	}
	
	@Override
	public void goodsModify(GoodsVO vo) throws Exception{
		sql.update(namespace + ".goodsModify", vo);
	}
	
	@Override
	public void goodsDelete(int gdsNum) throws Exception{
		sql.delete(namespace + ".goodsDelete", gdsNum);
	}
	
	@Override
	public List<OrderVO> orderList() throws Exception{
		return sql.selectList(namespace + ".orderList");
	}
	
	@Override
	public List<OrderListVO> orderView(OrderVO order) throws Exception{
		return sql.selectList(namespace + ".orderView", order);
	}
	
	@Override
	public void delivery(OrderVO order) throws Exception{
		sql.update(namespace + ".delivery", order);
	}
	
	@Override
	public void changeStock(GoodsVO goods) throws Exception{
		sql.update(namespace + ".changeStock", goods);
	}
	
	@Override
	public List<ReplyListVO> allReply() throws Exception{
		return sql.selectList(namespace + ".allReply");
	}
	
	@Override
	public void deleteReply(int repNum) throws Exception{
		sql.update(namespace + ".deleteReply", repNum);
	}
	
	@Override
	public List<MemberVO> memberList() throws Exception{
		return sql.selectList(namespace + ".memberList");
	}
}
