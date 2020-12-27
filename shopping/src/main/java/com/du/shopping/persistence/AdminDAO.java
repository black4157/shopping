package com.du.shopping.persistence;

import java.util.List;

import com.du.shopping.domain.CategoryVO;
import com.du.shopping.domain.GoodsVO;
import com.du.shopping.domain.GoodsViewVO;

public interface AdminDAO {
	
	public List<CategoryVO> category() throws Exception;
	
	public void register(GoodsVO vo) throws Exception;
	
	public List<GoodsVO> goodslist() throws Exception;
	
	public GoodsViewVO goodsView(int gdsNum) throws Exception;
	
	public void goodsModify(GoodsVO vo) throws Exception;
	
	public void goodsDelete(int gdsNum) throws Exception;
}
