package com.du.shopping.persistence;

import java.util.List;

import com.du.shopping.domain.GoodsViewVO;
import com.du.shopping.domain.ReplyListVO;
import com.du.shopping.domain.ReplyVO;

public interface ShopDAO {
	
	//1차분류
	public List<GoodsViewVO> list(int cateCode, int cateCodeRef) throws Exception;
	
	//2차분류
	public List<GoodsViewVO> list(int cateCode) throws Exception;
	
	//상품 조회
	public GoodsViewVO goodsView(int gdsNum) throws Exception;
	
	//댓글
	public void registReply(ReplyVO reply) throws Exception;
	
	//댓글 목록
	public List<ReplyListVO> replyList(int gdsNum) throws Exception;
	
	//댓글 삭제
	public void deleteReply(ReplyVO reply) throws Exception;
	
	//아이디 체크
	public String idCheck(int repNum) throws Exception;
}
