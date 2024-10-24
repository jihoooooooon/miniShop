package com.the.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.the.dto.CartDto;
import com.the.service.ICartService;


@Controller
public class CartController {
	@Autowired
	private ICartService service;
	
	
	
	@RequestMapping(value = "/cart/selectAll", method = RequestMethod.GET)
	public String selectAll(Model model, HttpSession session) throws Exception {
		String userId = (String) session.getAttribute("userId"); // 세션에서 사용자 ID 가져오기
		
		
		ArrayList<CartDto> dtos = service.selectAll(userId);
		model.addAttribute("list", dtos);
		//model.addAttribute("msg","success"); //있으면 성공메시지 없으면 성공메시지가 안뜸

		return "/cart/selectAll";

	}
	
	@RequestMapping(value = "/cart/insert", method = RequestMethod.GET)
	public void insert() throws Exception {

	}

	@RequestMapping(value = "/cart/insert", method = RequestMethod.POST)
	public String insertDB(CartDto cartDto, HttpSession session,RedirectAttributes rttr) throws Exception {
		String userId = (String) session.getAttribute("userId"); 
		
	    cartDto.setU_id(userId); // 세션에서 가져온 사용자 ID를 DTO에 설정
		
	    service.insert(cartDto);
		rttr.addFlashAttribute("msg", "success");

		return "redirect:/cart/selectAll";
	}
		
		@RequestMapping(value = "/cart/delete", method = RequestMethod.GET)
		public String delete(int p_id,RedirectAttributes rttr) throws Exception {
			
			service.delete(p_id);
			rttr.addFlashAttribute("msg", "success");
	
			return "redirect:/cart/selectAll";
	
		}
		
		@RequestMapping(value = "/cart/buy", method = RequestMethod.GET)
		public String buy(int p_id) throws Exception {
			service.buy(p_id);
			
			return "/cart/complete";
			
		}

//		@RequestMapping(value = "/cart/buy", method = RequestMethod.POST)
//		public String buyDB(int id,RedirectAttributes rttr) throws Exception {
//			service.buy(id);
//			rttr.addFlashAttribute("msg", "success");
//			
//			return "redirect:/cart/selectAll";
//	
//		}

		


	


}
