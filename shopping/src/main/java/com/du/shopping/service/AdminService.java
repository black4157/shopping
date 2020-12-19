package com.du.shopping.service;

import java.util.List;

import com.du.shopping.domain.CategoryVO;

public interface AdminService {

	public List<CategoryVO> category() throws Exception;
}
