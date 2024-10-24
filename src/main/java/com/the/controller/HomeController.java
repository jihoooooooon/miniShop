package com.the.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.the.dto.UserDto;
import com.the.service.UserService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@Autowired
	private UserService userService;
	

	
	/**
	 * Simply selects the home view to render by returning its name.
	 * @throws Exception 
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model, HttpServletRequest request, HttpSession session) throws Exception {
	    	        
	    
	    // 쿠키에서 저장된 아이디를 가져옴
	    String auto_login = null;
	    Cookie[] cookies = request.getCookies(); // 클라이언트의 쿠키를 가져옴

	    if (cookies != null) {
	        for (Cookie cookie : cookies) {
	            if (cookie.getName().equals("auto_login")) {
	            	auto_login = cookie.getValue(); // 저장된 오토 로그인의 아이디를 가져옴        
	            	
	            }
	        }
	    }
	    // 쿠키에 저장된 오토 아이디가 있을 경우 세션에 저장
	    if (auto_login != null) {
	    	session.setAttribute("dto", userService.selectUser(auto_login));
			UserDto dto = (UserDto)session.getAttribute("dto");	    	
	    }
	    

	    return "/main/home";
	}
	
	/*
	 * @RequestMapping(value = "/", method = RequestMethod.GET) public String
	 * firstHome() throws Exception {
	 * 
	 * return "redirect:/product/home"; }
	 * 
	 * @RequestMapping(value = "/product/home", method = RequestMethod.GET) public
	 * String home() throws Exception {
	 * 
	 * return "/product/home"; }
	 */
}
