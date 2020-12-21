package com.du.shopping.persistence;

import java.util.List;

import com.du.shopping.domain.CategoryVO;
import com.du.shopping.domain.GoodsVO;

public interface AdminDAO {
	
	public List<CategoryVO> category() throws Exception;
	
	public void register(GoodsVO vo) throws Exception;
	
	public List<GoodsVO> goodslist() throws Exception;
	
	public GoodsVO goodsView(int gdsNum) throws Exception;
}
