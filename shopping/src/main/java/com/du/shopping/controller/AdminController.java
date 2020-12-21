package com.du.shopping.controller;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.du.shopping.domain.CategoryVO;
import com.du.shopping.domain.GoodsVO;
import com.du.shopping.service.AdminService;

import net.sf.json.JSONArray;

@Controller
@RequestMapping("/admin/*")
public class AdminController {
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	
	@Inject
	private AdminService adminService;
	
	@RequestMapping(value="/index", method=RequestMethod.GET)
	public void getIndex() throws Exception{
		logger.info("get index");
	}
	
	@RequestMapping(value="/goods/register", method=RequestMethod.GET)
	public void getGoodsResiger(Model model) throws Exception{
		logger.info("get goods register");
		
		List<CategoryVO> category = null;
		category = adminService.category();
		model.addAttribute("category", JSONArray.fromObject(category));
		
	}
	
	@RequestMapping(value="goods/register", method=RequestMethod.POST)
	public String postGoodsRegister(GoodsVO vo) throws Exception{
		adminService.register(vo);
		
		return "redirect:/admin/index";
	}
	
	@RequestMapping(value="/goods/list", method=RequestMethod.GET)
	public void getGoodsList(Model model) throws Exception{
		logger.info("get goods list");
		
		List<GoodsVO> list = adminService.goodslist();
		
		model.addAttribute("list", list);
	}
	
	@RequestMapping(value="/goods/view", method=RequestMethod.GET)
	public void getGoodsview(@RequestParam("n") int gdsNum, Model model) throws Exception{
		logger.info("get goods view");
		
		GoodsVO goods = adminService.goodsView(gdsNum);
		
		model.addAttribute("goods", goods);
	}
}
