package com.du.shopping.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.du.shopping.domain.CategoryVO;
import com.du.shopping.domain.GoodsVO;
import com.du.shopping.domain.GoodsViewVO;
import com.du.shopping.domain.MemberVO;
import com.du.shopping.domain.OrderListVO;
import com.du.shopping.domain.OrderVO;
import com.du.shopping.domain.ReplyListVO;
import com.du.shopping.persistence.AdminDAO;

@Service
public class AdminServiceImpl implements AdminService{

	@Inject
	private AdminDAO dao;
	
	@Override
	public List<CategoryVO> category() throws Exception{
		return dao.category();
	}
	
	@Override
	public void register(GoodsVO vo) throws Exception{
		dao.register(vo);
	}
	
	@Override
	public List<GoodsViewVO> goodslist() throws Exception{
		return dao.goodslist();
	}
	
	@Override
	public List<GoodsViewVO> populargoodslist() throws Exception{
		return dao.populargoodslist();
	}
	
	@Override
	public GoodsViewVO goodsView(int gdsNum) throws Exception{
		return dao.goodsView(gdsNum);
	}
	
	@Override
	public void goodsModify(GoodsVO vo) throws Exception{
		dao.goodsModify(vo);
	}
	
	@Override
	public void goodsDelete(int gdsNum) throws Exception{
		dao.goodsDelete(gdsNum);
	}
	
	@Override
	public List<OrderVO> orderList() throws Exception{
		return dao.orderList();
	}
	
	@Override
	public List<OrderListVO> orderView(OrderVO order) throws Exception{
		return dao.orderView(order);
	}
	
	@Override
	public void delivery(OrderVO order) throws Exception{
		dao.delivery(order);
	}
	
	@Override
	public void changeStock(GoodsVO goods) throws Exception{
		dao.changeStock(goods);
	}
	
	@Override
	public List<ReplyListVO> allReply() throws Exception{
		return dao.allReply();
	}
	
	@Override
	public void deleteReply(int repNum) throws Exception{
		dao.deleteReply(repNum);
	}
	
	@Override
	public List<MemberVO> memberList() throws Exception{
		return dao.memberList();
	}

}
