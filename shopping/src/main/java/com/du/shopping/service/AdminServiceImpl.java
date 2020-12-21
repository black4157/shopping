package com.du.shopping.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.du.shopping.domain.CategoryVO;
import com.du.shopping.domain.GoodsVO;
import com.du.shopping.persistence.AdminDAO;

@Service
public class AdminServiceImpl implements AdminService{

	@Inject
	private AdminDAO dao;
	
	@Override
	public List<CategoryVO> category() throws Exception{
		return dao.category();
	}
	
	@Override
	public void register(GoodsVO vo) throws Exception{
		dao.register(vo);
	}
	
	@Override
	public List<GoodsVO> goodslist() throws Exception{
		return dao.goodslist();
	}
	
	@Override
	public GoodsVO goodsView(int gdsNum) throws Exception{
		return dao.goodsView(gdsNum);
	}
}
