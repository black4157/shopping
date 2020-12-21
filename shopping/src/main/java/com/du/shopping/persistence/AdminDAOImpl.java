package com.du.shopping.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.du.shopping.domain.CategoryVO;
import com.du.shopping.domain.GoodsVO;

@Repository
public class AdminDAOImpl implements AdminDAO{
	
	@Inject
	private SqlSession sql;
	
	private static String namespace = "com.du.shopping.mappers.adminMapper";
	
	@Override
	public List<CategoryVO> category() throws Exception{
		return sql.selectList(namespace + ".category");
	}
	
	@Override
	public void register(GoodsVO vo) throws Exception{
		sql.insert(namespace + ".register", vo);
	}
	
	@Override
	public List<GoodsVO> goodslist() throws Exception{
		return sql.selectList(namespace + ".goodslist");
	}
	
	@Override
	public GoodsVO goodsView(int gdsNum) throws Exception{
		return sql.selectOne(namespace + ".goodsView", gdsNum);
	}
}
