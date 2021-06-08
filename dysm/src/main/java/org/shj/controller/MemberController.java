package org.shj.controller;

import javax.servlet.http.HttpSession;

import org.shj.domain.MemberVO;
import org.shj.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/member/*")
public class MemberController {
	@Setter(onMethod_= {@Autowired})
	private MemberService service;
	
	@PostMapping("/insert") // 회원가입
	public String insert(MemberVO member) {
		log.info("/member/insert>> " + member);
		
		service.insert(member);
		
		return "redirect:/login";
	}
	
	@PostMapping("/idDuplication") // 아이디 중복 체크
	@ResponseBody
	public boolean idDuplication(@RequestParam("id")String id){
		return service.idDuplication(id);
	}
	
	@PostMapping("/login") // 로그인
	@ResponseBody
	public boolean login(MemberVO member, HttpSession session) {
		log.info("/member/login>> " + member);
		
		if(service.login(member) != null) {
			log.info("로그인 성공>>"+member);
			session.setAttribute("member", member);
			return true;
		}
		else {
			log.info("로그인 실패");
			return false;
		}
	}
	
	@GetMapping("/logout") // 로그아웃
	public String logout(HttpSession session) {
		log.info("/member/logout>> ");
		
		session.invalidate();
		
		return "redirect:/login";
	}
	
	@GetMapping("/personal") // 개인정보
	public String personal(HttpSession session, Model model) {
		MemberVO member = (MemberVO)session.getAttribute("member");
		String id = member.getId();
		
		log.info("personal>> "+id);
		
		model.addAttribute("members", service.getPersonal(id));
		return "/personal";
	}
	
	@PostMapping("/modify") // 개인정보 수정
	public String modify(MemberVO member) {
		log.info("modify>> "+member);
		
		if(service.modify(member))
			log.info("수정 성공>> "+member);
		else
			log.info("수정 실패");
		
		return "redirect:/main";
	}
	
	@PostMapping("/remove") // 회원탈퇴
	@ResponseBody
	public boolean remove(MemberVO member, HttpSession session) {
		log.info("remove: "+member.getId());
		
		if(service.remove(member)) {
			session.invalidate();
			return true;
		}
		else
			return false;
	}
	
}
