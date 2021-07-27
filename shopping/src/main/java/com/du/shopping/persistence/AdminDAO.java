package com.du.shopping.persistence;

import java.util.List;

import com.du.shopping.domain.CategoryVO;
import com.du.shopping.domain.GoodsVO;
import com.du.shopping.domain.GoodsViewVO;
import com.du.shopping.domain.MemberVO;
import com.du.shopping.domain.OrderListVO;
import com.du.shopping.domain.OrderVO;
import com.du.shopping.domain.ReplyListVO;

public interface AdminDAO {
	
	public List<CategoryVO> category() throws Exception;
	
	public void register(GoodsVO vo) throws Exception;
	
	public List<GoodsViewVO> goodslist() throws Exception;
	
	public List<GoodsViewVO> populargoodslist() throws Exception;
	
	public GoodsViewVO goodsView(int gdsNum) throws Exception;
	
	public void goodsModify(GoodsVO vo) throws Exception;
	
	public void goodsDelete(int gdsNum) throws Exception;
	
	public List<OrderVO> orderList() throws Exception;
	
	public List<OrderListVO> orderView(OrderVO order) throws Exception;
	
	public void delivery(OrderVO order) throws Exception;
	
	public void changeStock(GoodsVO goods) throws Exception;
	
	public List<ReplyListVO> allReply() throws Exception;
	
	public void deleteReply(int repNum) throws Exception;
	
	public List<MemberVO> memberList() throws Exception;
	
}
