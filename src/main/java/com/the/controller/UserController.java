package com.the.controller;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.the.dto.AuthoritiesDto;
import com.the.dto.UserDto;
import com.the.service.AuthoritiesService;
import com.the.service.UserService;

@Controller
public class UserController {

	@Autowired
	private UserService userService;

	@Autowired
	private AuthoritiesService authoritiesService;

	@Autowired
	PasswordEncoder bcryptPasswordEncoder;


	@Autowired
	private ServletContext servletContext;

	// 유저 로그인
	@RequestMapping(value = "/user/login", method = RequestMethod.GET)
	public String login(Model model, HttpServletRequest request) throws Exception {

		// "u_id_result"를 모델에서 받을 수 있음
		String uIdResult = (String) model.asMap().get("u_id_result");
		if (uIdResult != null) {
			model.addAttribute("id_save", uIdResult);
		}

		// 쿠키에서 저장된 아이디를 가져옴
		String savedId = null;
		String idSaveChecked = null;
		Cookie[] cookies = request.getCookies(); // 클라이언트의 쿠키를 가져옴

		if (cookies != null) {
			for (Cookie cookie : cookies) {
				if (cookie.getName().equals("id_save")) {
					savedId = cookie.getValue(); // 저장된 아이디를 가져옴
				}
				if (cookie.getName().equals("id_save_Checked")) {
					idSaveChecked = cookie.getValue(); // 저장된 체크박스 상태를 가져옴
				}
			}
		}

		// 쿠키에 저장된 아이디가 있을 경우 세션에 저장
		if (savedId != null) {
			model.addAttribute("id_save", savedId);
			model.addAttribute("id_save_Checked", idSaveChecked);
		}

		return "/user/login"; // 로그인 페이지로 이동
	}

	// 회원가입 이동
	@RequestMapping(value = "/user/join", method = RequestMethod.GET)
	public void join() throws Exception {

	}

	// 아이디 중복 체크
	@ResponseBody
	@RequestMapping(value = "/user/id_duplicate_check", method = RequestMethod.POST)
	public String id_duplicate_check(@RequestParam("u_id") String u_id) throws Exception {
		System.out.println("u_id" + u_id);
		boolean isDuplicate = userService.selectUser(u_id) != null;
		System.out.println(isDuplicate);
		// boolean 값을 "true" 또는 "false" 문자열로 반환
		return Boolean.toString(isDuplicate);
	}

	// 회원가입 처리
	@RequestMapping(value = "/user/joinDB", method = RequestMethod.POST)
	public String joinDB(UserDto dto, HttpServletRequest request, Model model) throws Exception {
		System.out.println("User insertDB");

		String encPassword = bcryptPasswordEncoder.encode(dto.getU_pw());
		dto.setU_pw(encPassword);

		String u_email = request.getParameter("email") + "@" + request.getParameter("select");
		System.out.println("u_email : " + u_email);
		dto.setU_email(u_email);

		String u_phoneNumber = request.getParameter("phoneNumber1") + "-" + request.getParameter("phoneNumber2") + "-"
				+ request.getParameter("phoneNumber3");
		System.out.println("u_phoneNumber : " + u_phoneNumber);
		dto.setU_phoneNumber(u_phoneNumber);

		userService.insert(dto);
		System.out.println(dto);

		AuthoritiesDto authDto = new AuthoritiesDto();
		String join_id = dto.getU_id();
		authDto.setU_id(join_id);

		// *
		if (join_id.equals("admin1234")) {
			authDto.setAuthority("ROLE_ADMIN");
			authoritiesService.insert(authDto);
		} else {
			authDto.setAuthority("ROLE_MEMBER");
			authoritiesService.insert(authDto);
		}

		return "redirect:/user/login?join";
	}

	// 유저 탈퇴 처리, 비활성화
	@RequestMapping(value = "/user/deactivateDB", method = RequestMethod.GET)
	public String deactivateDB(HttpServletRequest request, HttpSession session) throws Exception {
		System.out.println("유저 계정이 비활성화 되었습니다.");

		String u_id = (String) session.getAttribute("userId");
		userService.deactivate(u_id);

		return "/";
	}

	@RequestMapping(value = "/user/Logincomplete", method = RequestMethod.GET)
	public String Logincomplete(HttpSession session) throws Exception {
		String userid = (String) session.getAttribute("userId");
		UserDto dto = userService.selectUser(userid);
		System.out.println("dto : " + dto);

		session.setAttribute("dto", dto);
		return "redirect:/";

	}

	
	@RequestMapping(value = "/user/myPage", method = RequestMethod.GET)
	public void myInfo(UserDto dto, Model model, HttpSession session) throws Exception {
		String userid = (String) session.getAttribute("userId");
		dto = userService.selectUser(userid);
		session.setAttribute("dto", dto);
		System.out.println("/user/myPage : " + dto);

		String u_email = dto.getU_email();
		String[] u_emailArr = u_email.split("@");
		session.setAttribute("u_emailArr", u_emailArr);

		String u_phoneNumber = dto.getU_phoneNumber();
		String[] u_phoneNumberArr = u_phoneNumber.split("-");
		session.setAttribute("u_phoneNumberArr", u_phoneNumberArr);

	}

	@RequestMapping(value = "/user/myInfo/menber_upDB", method = RequestMethod.POST)
	public String menber_upDB(UserDto dto, String u_pw, Model model, HttpServletRequest request) throws Exception {

		String u_email = request.getParameter("email") + "@" + request.getParameter("select");
		System.out.println("u_email : " + u_email);
		dto.setU_email(u_email);

		String u_phoneNumber = request.getParameter("phoneNumber1") + "-" + request.getParameter("phoneNumber2") + "-"
				+ request.getParameter("phoneNumber3");
		System.out.println("u_phoneNumber : " + u_phoneNumber);
		dto.setU_phoneNumber(u_phoneNumber);

		userService.update(dto);
		System.out.println(dto);

		return "redirect:/user/myPage";
	}

	@RequestMapping(value = "/user/myInfo/pw_upDB", method = RequestMethod.POST)
	public String pw_upDB(UserDto dto, String u_pw, Model model, HttpSession session) throws Exception {
		String u_id = (String) session.getAttribute("userId");

		String encPassword = bcryptPasswordEncoder.encode(u_pw);

		userService.pw_update(u_id, encPassword);

		System.out.println("u_id : " + u_id);
		System.out.println("u_pw : " + encPassword);
		return "/user/myPage";
	}

		
}

