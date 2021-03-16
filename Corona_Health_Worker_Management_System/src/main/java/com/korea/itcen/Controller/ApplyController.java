package com.korea.itcen.Controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;

import com.korea.itcen.ApplyService.WApply_Command;
import com.korea.itcen.ApplyService.WApply_cancelCommand;
import com.korea.itcen.ApplyService.WApply_checkCommand;
import com.korea.itcen.ApplyService.WApply_modifyCommand;
import com.korea.itcen.ApplyService.WApply_viewCommand;
import com.korea.itcen.RecruitmentService.HService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class ApplyController {
	
	HService service = null;
	
	//사용자 신청하기 눌렀을 때 중복신청 체크
	@RequestMapping("/worker_apply_check")
	public void WApply_check(HttpServletRequest request, HttpServletResponse response, Model model) throws IOException {
		System.out.println("사용자 중복신청 체크");
		
		model.addAttribute("request",request);
		model.addAttribute("response", response);
		service = new WApply_checkCommand();
		service.execute(model);
		
	}

	@RequestMapping("/worker_apply_view_aftercheck")
	public String WApply_view_aftercheck(Model model) {
		System.out.println("중복 체크 끝나고 신청하기 화면으로 진입");
		
		return "Apply/Apply";
	}
	//사용자가 신청을 등록
	@RequestMapping("/worker_apply_register")
	public void WApply_register(HttpServletRequest request, HttpServletResponse response, Model model) throws IOException {
		System.out.println("사용자가 신청서 작성하고 신청하기 버튼 클릭");
		
		model.addAttribute("request",request);
		model.addAttribute("response", response);
		service = new WApply_Command();
		service.execute(model);
	}
	@RequestMapping("/worker_apply_completion")
	public String WApply_completion_view(Model model) {
		System.out.println("신청하기 완료 페이지 진입");
		
		return "Apply/Apply_completion";
	}
	//사용자가 신청 내역 확인 페이지로 진입
	@RequestMapping("/worker_apply_view")
	public String WApply_view(HttpServletRequest request, Model model) throws IOException {
		System.out.println("신청내역 화면 진입");
		
		model.addAttribute("request",request);
		service = new WApply_viewCommand();
		service.execute(model);
		return "Apply/Apply_view";
	}
	//사용자가 신청을 수정하는 페이지로 진입
	@RequestMapping("/worker_apply_modify_view")
	public String WApply_modify_view(Model model) {
		System.out.println("신청하기 수정 페이지 진입");
		
		return "Apply/Apply_modify";
	}
	//사용자가 신청을 수정
	@RequestMapping("/worker_apply_modify")
	public void WApply_modify(HttpServletRequest request, HttpServletResponse response, Model model) throws IOException {
		System.out.println("신청한 내역 수정");
		
		model.addAttribute("request",request);
		model.addAttribute("response", response);
		service = new WApply_modifyCommand();
		service.execute(model);
	}
	//신청한 내역을 취소
	@RequestMapping("/worker_apply_cancel")
	public void WApply_cancel(HttpServletRequest request, HttpServletResponse response, Model model) throws IOException {
		System.out.println("신청한 내역 삭제");
		
		model.addAttribute("request",request);
		model.addAttribute("response", response);
		service = new WApply_cancelCommand();
		service.execute(model);
		
	}
	
	@ExceptionHandler
	public String handleException(Exception e) {
		System.out.println("에러발생");
			return "Error/viewError";
	}

}
