package com.korea.itcen.Controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.korea.itcen.RecruitmentService.HService;
import com.korea.itcen.RecruitmentService.MApply_status_modifyCommand;
import com.korea.itcen.RecruitmentService.MRecruitment_contentCommand;
import com.korea.itcen.RecruitmentService.MRecruitment_deleteCommand;
import com.korea.itcen.RecruitmentService.MRecruitment_endCommand;
import com.korea.itcen.RecruitmentService.MRecruitment_memberlist_confirmCommand;
import com.korea.itcen.RecruitmentService.MRecruitment_modifyCommand;
import com.korea.itcen.RecruitmentService.MRecruitment_writeCommand;
import com.korea.itcen.RecruitmentService.MRecruitment_write_request_registerCommand;
import com.korea.itcen.RecruitmentService.MRecruitment_write_viewCommand;
import com.korea.itcen.RecruitmentService.MRequest_modify_for_Recruitment_viewCommand;
import com.korea.itcen.RecruitmentService.MRequest_visible_modifyCommand;
import com.korea.itcen.RecruitmentService.WRecruitment_contentCommand;

/**
 * Handles requests for the application home page.
 */
@Controller
public class RecruitmentController {
	
	HService service = null;
	
	@RequestMapping("/worker_recruitment_view")
	public String WRecruitment_view(Model model) {
		System.out.println("사용자 모집공고 화면 진입");
		
		return "Recruitment/Recruitment";
	}
	
	@RequestMapping("/manager_recruitment")
	public String MRecruitment(Model model) {
		System.out.println("관리자 모집공고 화면 진입");
		
		return "Recruitment/Recruitment_management";
	}		

	//사용자 상세모집공고 화면
	@RequestMapping("/worker_recruitment_content_view")
	public String WRecruitment_content_view(HttpServletRequest request, Model model) throws IOException {
		System.out.println("사용자 상세모집공고 화면 진입");
		
		model.addAttribute("request",request);
		service = new WRecruitment_contentCommand();
		service.execute(model);
		
		return "Recruitment/Recruitment_content";
	}
	//관리자 상세모집공고 화면
	@RequestMapping("/manager_recruitment_content_view")
	public String MRecruitment_content_view(HttpServletRequest request, Model model) throws IOException {
		System.out.println("관리자가 상세 모집공고 화면 진입");
		
		model.addAttribute("request",request);
		service = new MRecruitment_contentCommand();
		service.execute(model);
		
		return "Recruitment/Recruitment_content_management";
	}	
	//관리자가 모집공고 작성 화면 진입
	@RequestMapping("/manager_recruitment_write_view")
	public String MRecruitment_write_view(HttpServletRequest request, Model model) throws IOException {
		System.out.println("관리자가 모집공고 작성 화면 진입");
		
		model.addAttribute("request",request);
		service = new MRecruitment_write_viewCommand();
		service.execute(model);
		
		return "Recruitment/Recruitment_write_view";
	}
	//관리자가 모집공고 작성 화면에서 상세기관 선택
	@RequestMapping("/manager_request_register_inrecruit")
	@ResponseBody
	public void MRecruitment_request_register_inrecruit(HttpServletRequest request, HttpServletResponse response, Model model) throws IOException {
		System.out.println("상세 모집 기관 선택");
		
		model.addAttribute("request", request);
		model.addAttribute("response", response);
		service = new MRecruitment_write_request_registerCommand();
		service.execute(model);
		
	}
	//관리자가 모집공고 작성
	@RequestMapping("/manager_recruitment_write")
	public void MRecruitment_write(HttpServletRequest request, HttpServletResponse response, Model model) throws IOException {
		System.out.println("관리자가 모집공고 작성");
		
		model.addAttribute("request",request);
		model.addAttribute("response", response);
		service = new MRecruitment_writeCommand();
		service.execute(model);	
		
	}
	@RequestMapping("/manager_recruitment_modify_view")
	public String WRecruitment_modify_view(Model model) {
		System.out.println("관리자 모집공고 수정화면 진입");
		
		return "Recruitment/Recruitment_content_modify";
	}
	//관리자가 모집공고 수정
	@RequestMapping("/manager_recruitment_modify")
	public void MRecruitment_modify(HttpServletRequest request, HttpServletResponse response, Model model) throws IOException {
		System.out.println("관리자가 모집공고 수정");
		
		model.addAttribute("request",request);
		model.addAttribute("response", response);
		service = new MRecruitment_modifyCommand();
		service.execute(model);	
		
	}
	//관리자가 모집공고 수정화면에서 상세기관 노출 상태를 수정하는 팝업 진입
	@RequestMapping("/manager_recruitment_modify_request_view")
	public String MRecruitment_modify_request_view(HttpServletRequest request, Model model) throws IOException {
		System.out.println("관리자가 상세기관 노출 상태 수정 팝업 진입");
		
		model.addAttribute("request",request);
		service = new MRequest_modify_for_Recruitment_viewCommand();
		service.execute(model);
		return "Recruitment/Recruitment_request_modify";
	}
	//관리자가 상세기관 노출 상태 수정 (노출/비노출)
	@RequestMapping("/manager_recruitment_modify_request_visible")
	public String MRecruitment_modify_request_visibl(HttpServletRequest request, Model model) throws IOException {
		System.out.println("관리자가 상세기관 노출 상태 수정");
		
		model.addAttribute("request",request);
		service = new MRequest_visible_modifyCommand();
		service.execute(model);
		
		return "forward:manager_recruitment_modify_request_view";
	}	
	//관리자가 모집공고 마감
	@RequestMapping("/manager_recruitment_end")
	public void MRecruitment_end(HttpServletRequest request, HttpServletResponse response, Model model) throws IOException {
		System.out.println("관리자가 모집공고 마감");
		
		model.addAttribute("request",request);
		model.addAttribute("response", response);
		service = new MRecruitment_endCommand();
		service.execute(model);
	}
	//관리자가 모집공고 삭제
	@RequestMapping("/manager_recruitment_delete")
	public void MRecruitment_delete(HttpServletRequest request, HttpServletResponse response, Model model) throws IOException {
		System.out.println("관리자가 모집공고 삭제");
		
		model.addAttribute("request",request);
		model.addAttribute("response", response);
		service = new MRecruitment_deleteCommand();
		service.execute(model);	
	}

	//관리자가 상세모집공고 화면에서 신청자 확인 팝업 진입
	@RequestMapping("/manager_workerlist_of_request_view")
	public String MRecruitment_workerlist_of_request_view(HttpServletRequest request, Model model) throws IOException {
		System.out.println("관리자가 신청자 확인 팝업 진입");
		
		model.addAttribute("request",request);
		service = new MRecruitment_memberlist_confirmCommand();
		service.execute(model);
		return "Recruitment/Worker_list_confirm";
	}
	//관리자가 신청자의 파견지원 상태를 변경할 때
	@RequestMapping("/manager_workerlist_modify_status_of_apply")
	public String MRecruitment_workerlist_modify_status_of_apply(HttpServletRequest request, Model model) throws IOException {
		System.out.println("관리자가 신청자 파견지원 상태 변경");
		
		model.addAttribute("request",request);
		service = new MApply_status_modifyCommand();
		service.execute(model);
		return "forward:manager_workerlist_of_request_view";
	}
	
	@ExceptionHandler
	public String handleException(Exception e) {
		System.out.println("에러발생");
			return "Error/viewError";
	}
	
}
