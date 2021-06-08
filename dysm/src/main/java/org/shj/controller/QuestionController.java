package org.shj.controller;

import javax.servlet.http.HttpSession;

import org.shj.domain.Criteria;
import org.shj.domain.PageDTO;
import org.shj.domain.QuestionVO;
import org.shj.service.QuestionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/question/*")
public class QuestionController {
	@Setter(onMethod_= {@Autowired})
	private QuestionService service;
	
	@GetMapping("/list")
	public void list(Model model, Criteria cri) {
		log.info("/question/list>> "+service.getList(cri));
		
		model.addAttribute("list", service.getList(cri));
		int total = service.getTotal(cri);
		model.addAttribute("pageMaker", new PageDTO(cri, total));
	}
	
	@GetMapping("register")
	public void register() {}
	
	@PostMapping("/register")
	public String register(QuestionVO question, RedirectAttributes rttr) {
		log.info("register: "+question);
		
		service.register(question);
		rttr.addFlashAttribute("result", question.getQno());
		
		return "redirect:/question/list";
	}
	
	@GetMapping({"/get", "/modify"})
	public void get(@RequestParam("qno")Long qno,
					@ModelAttribute("cri")Criteria cri, Model model) {
		log.info("/get or modify");
		model.addAttribute("question", service.get(qno));
	}
	
	@PostMapping("/modify")
	public String modify(QuestionVO question, RedirectAttributes rttr,
							@ModelAttribute("cri")Criteria cri){
		log.info("modify:"+question);
		
		if(service.modify(question))
			rttr.addFlashAttribute("result","success");
		
		return "redirect:/question/list" + cri.getListLink();
	}
	
	@PostMapping("/remove")
	public String remove(@RequestParam("qno")Long qno,
							Criteria cri, RedirectAttributes rttr) {
		log.info("remove: "+qno);
		
		if(service.remove(qno)) {
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/question/list";
	}
	
}

