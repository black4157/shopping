package com.du.shopping.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.du.shopping.domain.GoodsViewVO;
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
	
	//아이디 체크
	@Override
	public String idCheck(int repNum) throws Exception{
		return dao.idCheck(repNum);
	}
}
