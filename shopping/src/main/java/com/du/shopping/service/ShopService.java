package com.du.shopping.service;

import java.util.List;

import com.du.shopping.domain.CartListVO;
import com.du.shopping.domain.CartVO;
import com.du.shopping.domain.GoodsViewVO;
import com.du.shopping.domain.ReplyListVO;
import com.du.shopping.domain.ReplyVO;

public interface ShopService {
	
	//카테고리 상품리스트
	public List<GoodsViewVO> list(int cateCode, int level) throws Exception;
	
	//상품 조회
	public GoodsViewVO goodsView(int gdsNum) throws Exception;
	
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
}
