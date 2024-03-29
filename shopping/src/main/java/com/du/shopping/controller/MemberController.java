package com.du.shopping.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.du.shopping.domain.MemberVO;
import com.du.shopping.service.MemberService;

@Controller
@RequestMapping("/member/*")
public class MemberController {
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Inject
	private MemberService service;
	
	@Autowired
	BCryptPasswordEncoder passEncoder;
	
	@RequestMapping(value="/signup", method=RequestMethod.GET)
	public void getSignup() throws Exception{
		logger.info("get signup");
	}
	
	@RequestMapping(value="/signup", method=RequestMethod.POST)
	public String postSignup(MemberVO vo) throws Exception{
		logger.info("post signup");
		
		int result = service.idChk(vo);
		
		if(result == 1) {
			return "/member/signup";
		} else if(result == 0) {
			String inputPass = vo.getUserPass();
			String pass = passEncoder.encode(inputPass);
			vo.setUserPass(pass);
			
			service.signup(vo);
		}

		return "redirect:/";
	}

	@ResponseBody
	@RequestMapping(value="/idChk", method=RequestMethod.POST)
	public int idChk(MemberVO vo) throws Exception{
		int result = service.idChk(vo);
		return result;
	}
	
	@RequestMapping(value="/signin", method=RequestMethod.GET)
	public void getSignin() throws Exception{
		logger.info("get signin");
	}
	
	@RequestMapping(value="/signin", method=RequestMethod.POST)
	public String postSignin(MemberVO vo, HttpServletRequest req, RedirectAttributes rttr) throws Exception{
		logger.info("post signin");
		
		MemberVO login = service.signin(vo);
		HttpSession session = req.getSession();
		
		boolean passMatch = passEncoder.matches(vo.getUserPass(), login.getUserPass());
		
		if(login != null && passMatch) {
			session.setAttribute("member", login);
		} else {
			session.setAttribute("member", null);
			rttr.addFlashAttribute("msg", false);
			return "redirect:/member/signin";
		}
		
		return "redirect:/";
	}
	
	
	@RequestMapping(value="/signout", method=RequestMethod.GET)
	public String signout(HttpSession session) throws Exception{
		logger.info("get logout");
		
		service.signout(session);
		
		return "redirect:/";
	}
	
	@RequestMapping(value="/passwordConfirm", method=RequestMethod.GET)
	public void getPasswordConfirm() {
		logger.info("get passwordConfirm");
	}
		
	@RequestMapping(value="/passwordConfirm", method=RequestMethod.POST)
	public String postPasswordConfirm(MemberVO vo, HttpServletRequest req, RedirectAttributes rttr) throws Exception{
		logger.info("post passwordConfirm");
		
		MemberVO login = service.signin(vo);
		HttpSession session = req.getSession();
		
		boolean passMatch = passEncoder.matches(vo.getUserPass(), login.getUserPass());
		
		if(passMatch) {
			session.setAttribute("member", login);
			return "redirect:/member/signModify";
		} else {
			rttr.addFlashAttribute("msg", false);
			return "redirect:/member/passwordConfirm";
		}
	}
	
	@RequestMapping(value="/signModify", method=RequestMethod.GET)
	public void getSignModify() {
		logger.info("get signModify");
	}
	
	@RequestMapping(value="/signModify", method=RequestMethod.POST)
	public String postSignModify(MemberVO vo, HttpServletRequest req) throws Exception {
		logger.info("post signModify");
		
		MemberVO login = service.signin(vo);
		HttpSession session = req.getSession();
		
		service.signmodify(vo);
		session.setAttribute("member", login);
		return "redirect:/";
	}
	
	@RequestMapping(value="/signDelete", method=RequestMethod.GET)
	public void getSignDelete() {
		logger.info("get signDelete");
	}
	
	@RequestMapping(value="/signDelete", method=RequestMethod.POST)
	public String postSignDelete(MemberVO vo, HttpServletRequest req, RedirectAttributes rttr) throws Exception{

		MemberVO login = service.signin(vo);
		if(login == null) {
			rttr.addFlashAttribute("msg", "id fail");
			return "redirect:/member/signDelete";
		}
		
		HttpSession session = req.getSession();
		
		boolean passMatch = passEncoder.matches(vo.getUserPass(), login.getUserPass());
		
		if(login != null && passMatch) {
			service.signdelete(vo);
			session.invalidate();
			rttr.addFlashAttribute("msg", "success");
			return "redirect:/";
		} else {
			rttr.addFlashAttribute("msg", "password fail");
			return "redirect:/member/signDelete";
		}
		
	}
}