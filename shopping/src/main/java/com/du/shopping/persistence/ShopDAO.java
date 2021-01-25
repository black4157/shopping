package com.du.shopping.persistence;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.du.shopping.domain.CartListVO;
import com.du.shopping.domain.CartVO;
import com.du.shopping.domain.GoodsInfoVO;
import com.du.shopping.domain.GoodsViewVO;
import com.du.shopping.domain.OrderDetailVO;
import com.du.shopping.domain.OrderListVO;
import com.du.shopping.domain.OrderVO;
import com.du.shopping.domain.ReplyListVO;
import com.du.shopping.domain.ReplyVO;

@Repository
public interface ShopDAO {
	
	//1차분류
	public List<GoodsViewVO> list(int cateCode, int cateCodeRef) throws Exception;
	
	//2차분류
	public List<GoodsViewVO> list(int cateCode) throws Exception;
	
	//상품 조회
	public GoodsViewVO goodsView(int gdsNum) throws Exception;
	
	//상품 정보
	public GoodsInfoVO goodsInfo(int gdsNum) throws Exception;
	
	//댓글
	public void registReply(ReplyVO reply) throws Exception;
	
	//댓글 목록
	public List<ReplyListVO> replyList(int gdsNum) throws Exception;
	
	//댓글 삭제
	public void deleteReply(ReplyVO reply) throws Exception;
	
	//댓글 수정
	public void modifyReply(ReplyVO reply) throws Exception;
	
	//아이디 체크
	public String idCheck(int repNum) throws Exception;
	
	//장바구니 추가
	public void addCart(CartVO cart) throws Exception;
	
	//장바구니 리스트
	public List<CartListVO> cartList(String userId) throws Exception;
	
	//장바구니 삭제
	public void deleteCart(CartVO cart) throws Exception;
	
	//주문 정보
	public void orderInfo(OrderVO order) throws Exception;
	
	//주문 상세정보
	public void orderInfo_Details(OrderDetailVO orderDetail) throws Exception;
	
	//장바구니 비우기
	public void cartAllDelete(String userId) throws Exception;
	
	//주문목록
	public List<OrderVO> orderList(OrderVO order) throws Exception;
	
	//특정 주문목록
	public List<OrderListVO> orderView(OrderVO order) throws Exception; 
}
