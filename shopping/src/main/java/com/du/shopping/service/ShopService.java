package com.du.shopping.service;

import java.util.List;

import com.du.shopping.domain.GoodsViewVO;

public interface ShopService {
	
	//카테고리 상품리스트
	public List<GoodsViewVO> list(int cateCode, int level) throws Exception;
	
	//상품 조회
	public GoodsViewVO goodsView(int gdsNum) throws Exception;
}
