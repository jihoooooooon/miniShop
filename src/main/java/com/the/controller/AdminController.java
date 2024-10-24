package com.the.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.the.dto.AuthoritiesDto;
import com.the.dto.ProductDto;
import com.the.dto.UserDto;
import com.the.service.AdminService;
import com.the.service.IProductService;
import com.the.service.UserService;


@Controller
public class AdminController {

	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);

	@Autowired
	private AdminService adminService;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private IProductService service;
	
	
	

	

	
	
    
   
    
    @RequestMapping(value = "/admin/userManagement", method = RequestMethod.GET)
    public String userManagement(HttpSession session, Model model) throws Exception {
    	String userid = (String)session.getAttribute("userId");
		session.setAttribute("dto", userService.selectUser(userid));
		
		ArrayList<UserDto> userList = adminService.selectAll(); // DB에서 데이터 가져오기
		model.addAttribute("userList", userList); // 모델에 추가하여 JSP로 전달

		
        return "/admin/userManagement";
    }
    
    @RequestMapping(value = "/admin/updateUser", method = RequestMethod.POST)
    public String updateUser(@ModelAttribute UserDto userDto, RedirectAttributes redirectAttributes) {
        try {
            adminService.updateUser(userDto);
            redirectAttributes.addFlashAttribute("message", "정보가 수정되었습니다.");
        } catch (Exception e) {
            logger.error("Error updating user", e);
            redirectAttributes.addFlashAttribute("error", "정보 수정에 실패했습니다.");
        }
        return "redirect:/admin/userManagement";
    }
    
 // 계정상태 업데이트를 처리하는 POST 요청
    @RequestMapping(value = "/admin/updateStatus", method = RequestMethod.POST)
    public String updateStatus(@RequestParam String u_id, @RequestParam int enabled, RedirectAttributes redirectAttributes) {
        try {
            adminService.updateStatus(u_id, enabled);
            redirectAttributes.addFlashAttribute("message", "상태가 변경되었습니다.");
        } catch (Exception e) {
            logger.error("Error updating status", e);	
            redirectAttributes.addFlashAttribute("error", "상태변경 실패.");
        }
        return "redirect:/admin/userManagement"; // 상태 업데이트 후 다시 관리자 페이지로 리다이렉트
    }

    @RequestMapping(value = "/admin/authorityManagement", method = RequestMethod.GET)
    public String authorityManagement(HttpSession session, Model model) throws Exception {
    	String userid = (String)session.getAttribute("userId");
		session.setAttribute("dto", userService.selectUser(userid));
		
		ArrayList<AuthoritiesDto> authorityList = adminService.selectAllAuthorities(); // DB에서 권한 데이터 가져오기
	    model.addAttribute("authorityList", authorityList); // 모델에 추가하여 JSP로 전달
		
        return "/admin/authorityManagement";
    }
    
 // 권한 업데이트를 처리하는 POST 요청
    @RequestMapping(value = "/admin/updateAuthority", method = RequestMethod.POST)
    public String updateAuthority(@RequestParam String u_id, @RequestParam String authority, RedirectAttributes redirectAttributes) {
        try {
            AuthoritiesDto authoritiesDto = new AuthoritiesDto(u_id, authority);
            adminService.updateAuthority(authoritiesDto);
            redirectAttributes.addFlashAttribute("message", "권한이 변경되었습니다.");
        } catch (Exception e) {
            logger.error("Error updating authority", e);
            redirectAttributes.addFlashAttribute("error", "권한변경 실패.");
        }
        return "redirect:/admin/authorityManagement"; // 권한 업데이트 후 다시 관리자 페이지로 리다이렉트
    }
    
    @RequestMapping(value = "/admin/productManagement", method = RequestMethod.GET)
    public String productManagement(Model model) throws Exception {
		ArrayList<ProductDto> dtos = service.selectAll();
		model.addAttribute("list", dtos);
		//model.addAttribute("msg","success"); //있으면 성공메시지 없으면 성공메시지가 안뜸

        return "/admin/productManagement";
    }
    @RequestMapping(value = "/admin/updateProduct", method = RequestMethod.POST)
    @ResponseBody
	public String updateProduct(@RequestBody List<ProductDto> products) throws Exception {

    	try {
            // 서비스 계층에서 리스트 전체를 업데이트
            service.updateProduct(products);

            // 성공 시 반환할 응답
            return "success";
        } catch (Exception e) {
            // 오류 발생 시 응답 처리
            return "fail";
        }
    }
    
    // 제품 수정 처리
    @RequestMapping(value = "/admin/productAdd", method = RequestMethod.GET)
    public void productAdd() {
 
    }

    
 // 제품 수정 처리
    @RequestMapping(value = "/admin/productAdd", method = RequestMethod.POST)
    public String productAddDB(@ModelAttribute ProductDto productDto, RedirectAttributes redirectAttributes) {
  
        try {
            service.productAdd(productDto);
            redirectAttributes.addFlashAttribute("message", "상품이 추가되었습니다.");
        } catch (Exception e) {
            logger.error("Error updating status", e);	
            redirectAttributes.addFlashAttribute("error", "상품추가 실패.");
        }
        return "redirect:/admin/productManagement"; // 수정 후 관리 페이지로 리다이렉트
    }
    
    @RequestMapping(value = "/admin/productDelete", method = RequestMethod.POST)
	public String delete(int p_id,RedirectAttributes rttr) throws Exception {
		
		service.delete(p_id);
		rttr.addFlashAttribute("msg", "success");

		return "redirect:/admin/productManagement";

	}
   
}
    

    
   


