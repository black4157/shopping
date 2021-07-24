package com.du.shopping.controller;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.du.shopping.domain.GoodsViewVO;
import com.du.shopping.service.AdminService;

@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@Inject
	AdminService service;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model, RedirectAttributes rttr) throws Exception {
		logger.info("get home(main)");
		
		List<GoodsViewVO> populargoodslist = service.populargoodslist();
		
		model.addAttribute("populargoodslist", populargoodslist);
		
		return "home";
	}
	
}
