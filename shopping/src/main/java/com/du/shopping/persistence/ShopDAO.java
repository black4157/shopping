package com.du.shopping.persistence;

import java.util.List;

import com.du.shopping.domain.GoodsViewVO;

public interface ShopDAO {
	
	//1차분류
	public List<GoodsViewVO> list(int cateCode, int cateCodeRef) throws Exception;
	
	//2차분류
	public List<GoodsViewVO> list(int cateCode) throws Exception;
	
	//상품 조회
	public GoodsViewVO goodsView(int gdsNum) throws Exception;
}
