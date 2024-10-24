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

import com.the.dto.ProductDto;
import com.the.service.IProductService;


@Controller
public class ProductController {
	@Autowired
	private IProductService service;
	
	
	

	
	@RequestMapping(value = "/product/selectAll", method = RequestMethod.GET)
	public String selectAll(Model model) throws Exception {
		ArrayList<ProductDto> dtos = service.selectAll();
		model.addAttribute("list", dtos);
		//model.addAttribute("msg","success"); //있으면 성공메시지 없으면 성공메시지가 안뜸

		return "/product/selectAll";

	}
	@RequestMapping(value = "/product/selectId", method = RequestMethod.GET)
	public String selectId(int id , Model model) throws Exception {
		
		ProductDto ProductDto = service.selectId(id);
		model.addAttribute("dto",ProductDto);
		
		return "/product/selectId";

	}
	@RequestMapping(value = "/product/insert", method = RequestMethod.GET)
	public String insert(Model model, HttpSession session) throws Exception {
		
		return "/product/insert";

	}

			
	
		@RequestMapping(value = "/product/update", method = RequestMethod.GET)
		public String update(ProductDto ProductDto) throws Exception {
	
			return "/product/update";
	
		}
		
		@RequestMapping(value = "/product/update", method = RequestMethod.POST)
		public String updateDB(ProductDto ProductDto,RedirectAttributes rttr) throws Exception {
	
			service.update(ProductDto);
			rttr.addFlashAttribute("msg", "success");

			
			return "redirect:/product/selectAll";

		}	
	
		



	


}
