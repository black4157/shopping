package com.du.shopping.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.du.shopping.domain.CartListVO;
import com.du.shopping.domain.CartVO;
import com.du.shopping.domain.GoodsViewVO;
import com.du.shopping.domain.OrderDetailVO;
import com.du.shopping.domain.OrderListVO;
import com.du.shopping.domain.OrderVO;
import com.du.shopping.domain.ReplyListVO;
import com.du.shopping.domain.ReplyVO;
import com.du.shopping.persistence.ShopDAO;

@Service
public class ShopServiceImpl implements ShopService{
	
	@Inject
	private ShopDAO dao;
	
	@Override
	public List<GoodsViewVO> list(int cateCode, int level) throws Exception{
		
		int cateCodeRef = 0;
		
		if(level == 1) {
			cateCodeRef = cateCode;
			return dao.list(cateCode, cateCodeRef);
		}else {
			return dao.list(cateCode);
		}
	}
	
	@Override
	public GoodsViewVO goodsView(int gdsNum) throws Exception{
		return dao.goodsView(gdsNum);
	}
	
	@Override
	public void registReply(ReplyVO reply) throws Exception{
		dao.registReply(reply);
	}
	
	@Override
	public List<ReplyListVO> replyList(int gdsNum) throws Exception{
		return dao.replyList(gdsNum);
	}
	
	//댓글 삭제
	@Override
	public void deleteReply(ReplyVO reply) throws Exception{
		dao.deleteReply(reply);
	}
	
	//댓글 수정
	public void modifyReply(ReplyVO reply) throws Exception{
		dao.modifyReply(reply);
	}
	
	//아이디 체크
	@Override
	public String idCheck(int repNum) throws Exception{
		return dao.idCheck(repNum);
	}
	
	//장바구니 추가
	@Override
	public void addCart(CartVO cart) throws Exception{
		dao.addCart(cart);
	}
		
	//장바구니 리스트
	@Override
	public List<CartListVO> cartList(String userId) throws Exception{
		return dao.cartList(userId);
	}
	
	//장바구니 삭제
	@Override
	public void deleteCart(CartVO cart) throws Exception{
		dao.deleteCart(cart);
	}
	
	//주문 정보
	public void orderInfo(OrderVO order) throws Exception{
		dao.orderInfo(order);
	}
	
	//주문 상세정보
	public void orderInfo_Details(OrderDetailVO orderDetail) throws Exception{
		dao.orderInfo_Details(orderDetail);
	}
	
	//장바구니 비우기
	public void cartAllDelete(String userId) throws Exception{
		dao.cartAllDelete(userId);
	}
	
	//주문목록
	public List<OrderVO> orderList(OrderVO order) throws Exception{
		return dao.orderList(order);
	}
	
	//특정 주문목록
	public List<OrderListVO> orderView(OrderVO order) throws Exception{
		return dao.orderView(order);
	}
}
