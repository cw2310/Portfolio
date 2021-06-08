package org.shj.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/*")
public class FrontController {
	
	@GetMapping("/main")
	public void main() {
		log.info("/main");
	}
	
	@GetMapping("/intro")
	public void intro() {
		log.info("/intro");
	}
	
	@GetMapping("/product1")
	public void product1() {
		log.info("/product1");
	}
	
	@GetMapping("/product2")
	public void product2() {
		log.info("/product2");
	}
	
	@GetMapping("/order")
	public void order() {
		log.info("/order");
	}
	
	@GetMapping("/question")
	public void question() {
		log.info("/question");
	}
	
	@GetMapping("/login")
	public void login() {
		log.info("/login");
	}
	
	@GetMapping("/signup")
	public void signup() {
		log.info("/signup");
	}
}
