package com.du.shopping.persistence;

import java.util.List;

import com.du.shopping.domain.CategoryVO;

public interface AdminDAO {
	
	public List<CategoryVO> category() throws Exception;
	
}
