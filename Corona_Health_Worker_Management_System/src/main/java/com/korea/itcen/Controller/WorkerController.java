package com.korea.itcen.Controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;

import com.korea.itcen.RecruitmentService.HService;
import com.korea.itcen.WorkerService.WJoin_Command;
import com.korea.itcen.WorkerService.WLogin_Command;
import com.korea.itcen.WorkerService.WModify_Command;

/**
 * Handles requests for the application home page.
 */
@Controller
public class WorkerController {
	
	HService service = null;
	
	@RequestMapping("/login_view")
	public String Wlogin_view(Model model) {
		System.out.println("로그인 화면 진입");
		
		return "Worker/Login";
	}
	
	@RequestMapping("/login")
	public void Wlogin(HttpServletRequest request, HttpServletResponse response, Model model) throws IOException {
		System.out.println("로그인");
		
		model.addAttribute("request",request);
		model.addAttribute("response", response);
		service = new WLogin_Command();
		service.execute(model);
	}
	
	@RequestMapping("/main_view")
	public String MMain_view(Model model) {
		System.out.println("관리자 메인화면 진입");
		
		return "Worker/Main";
	}
	
	@RequestMapping("/join_view")
	public String Wjoin_view(Model model) {
		System.out.println("회원가입 화면 진입");
		
		return "Worker/Worker_join";
	}
	
	@RequestMapping("/join")
	public void Wjoin(HttpServletRequest request, HttpServletResponse response, Model model) throws IOException {
		System.out.println("회원가입");
		
		model.addAttribute("request",request);
		model.addAttribute("response", response);
		service = new WJoin_Command();
		service.execute(model);
	}

	@RequestMapping("/modify_view")
	public String WModify_view(Model model) {
		System.out.println("회원정보 수정 화면 진입");
		
		return "Worker/Worker_modify";
	}
	
	@RequestMapping("/modify")
	public void WModify(HttpServletRequest request, HttpServletResponse response, Model model) throws IOException {
		System.out.println("회원정보 수정");
		
		model.addAttribute("request",request);
		model.addAttribute("response", response);
		service = new WModify_Command();
		service.execute(model);
		
	}

	@RequestMapping("/manager_workermanagement")
	public String MWorker_management(Model model) {
		System.out.println("관리자가 회원정보 관리 페이지 진입");
		
		return "Worker/Worker_management";
	}
	
	@RequestMapping("/logout")
	public String Logout(Model model) {
		System.out.println("로그아웃");
		
		return "Worker/Logout";
	}
	
	@ExceptionHandler
	public String handleException(Exception e) {
		System.out.println("에러발생");
			return "Error/viewError";
	}
	
}
