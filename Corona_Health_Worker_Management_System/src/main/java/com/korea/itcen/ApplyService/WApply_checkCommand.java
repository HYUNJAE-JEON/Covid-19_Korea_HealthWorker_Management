package com.korea.itcen.ApplyService;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import com.korea.itcen.DAO.ApplyDAO;
import com.korea.itcen.DAO.RecruitmentDAO;
import com.korea.itcen.DAO.RequestDAO;
import com.korea.itcen.DTO.RecruitmentDTO;
import com.korea.itcen.DTO.RequestDTO;
import com.korea.itcen.RecruitmentService.HService;

public class WApply_checkCommand implements HService {

	
	@Override
	public void execute(Model model) throws IOException {

		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		HttpServletResponse response = (HttpServletResponse) map.get("response");
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter writer = response.getWriter();
		
		String rstatus_of_recruitment = request.getParameter("rstatus_of_recruitment");
		System.out.println(rstatus_of_recruitment);
		String rId = request.getParameter("rId");
		String wId = request.getParameter("wId");
		
		int result = 0;
		RecruitmentDAO recruitmentdao = new RecruitmentDAO();
		RecruitmentDTO recruitmentdto = recruitmentdao.Recruitment_ContentView(rId);
		ApplyDAO applyDao = new ApplyDAO();
		
		RequestDAO requestdao = new RequestDAO();
		int IRecruitment_post_number = recruitmentdto.getrId();
		ArrayList<RequestDTO> requestdto = null;
		requestdto = requestdao.getRequest(IRecruitment_post_number);
		request.setAttribute("request_view", requestdto);
		request.setAttribute("content_view", recruitmentdto);
		
		HttpSession session = request.getSession();
		
		result = applyDao.checkApply(wId, rId);
		
		if(rstatus_of_recruitment.equals("마감")) {
			writer.println("<script>");
			writer.println("alert('해당 공고는 마감된 공고입니다. 다른 공고를 선택해주세요');");
			writer.println("history.go(-1);");
			writer.println("</script>");
			writer.close();
		} else {
			if(result == 1) {
				writer.println("<script>");
				writer.println("alert('해당 공고에 이미 신청한 내역이 있습니다. 우측 상단에 신청 내역에서 확인해주세요');");
				writer.println("history.go(-1);");
				writer.println("</script>");
				writer.close();
			} else {
				session.setAttribute("content_view", recruitmentdto);
				writer.println("<script>");
				writer.println("document.location.href='worker_apply_view_aftercheck'");
				writer.println("</script>");
				writer.close();
			}
		}
	}
	

}
