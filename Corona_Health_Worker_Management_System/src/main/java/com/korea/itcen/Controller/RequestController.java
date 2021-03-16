package com.korea.itcen.Controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;

import com.korea.itcen.RecruitmentService.HService;
import com.korea.itcen.RequestService.MRequest_status_modifyCommand;

/**
 * Handles requests for the application home page.
 */
@Controller
public class RequestController {
	
	HService service = null;
	
	// 관리자가 파견요청 관리 페이지로 진입 (사용안함)
	@RequestMapping("/manager_requestmanagement")
	public String MRequestmanagement(Model model) {
		System.out.println("관리자 파견요청 관리 화면 진입");
		
		return "Request/Request_for_increase";
	}
	//관리자가 파견요청의 상태 변경(노출상태 아님!)
	@RequestMapping("/manager_modify_status_of_request")
	public String MModify_status_of_request(HttpServletRequest request, Model model) throws IOException {
		System.out.println("파견요청 상태 변경");
		
		model.addAttribute("request",request);
		service = new MRequest_status_modifyCommand();
		service.execute(model);
		
		return "forward:manager_requestmanagement";
	}

	@ExceptionHandler
	public String handleException(Exception e) {
		System.out.println("에러발생");
			return "Error/viewError";
	}
}
