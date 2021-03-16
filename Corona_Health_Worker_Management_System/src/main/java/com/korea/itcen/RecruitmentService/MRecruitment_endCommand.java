package com.korea.itcen.RecruitmentService;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.ui.Model;

import com.korea.itcen.DAO.RecruitmentDAO;
import com.korea.itcen.DAO.RequestDAO;

public class MRecruitment_endCommand implements HService {

	
	@Override
	public void execute(Model model) throws IOException {
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		HttpServletResponse response = (HttpServletResponse) map.get("response");

		int success_recru = 0;
		int success_reque = 0;
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=utf-8");
		int rId = Integer.parseInt(request.getParameter("rId"));
		RecruitmentDAO recruitmentDao = new RecruitmentDAO();
		RequestDAO requestDao = new RequestDAO();
		
		success_recru = recruitmentDao.end(rId);
		success_reque = requestDao.Request_recruitment_end(rId);
		PrintWriter writer = response.getWriter();
		if (success_recru == 1) {
			writer.println("<script>");
			writer.println("alert('마감되었습니다.');");
			writer.println("document.location.href='manager_recruitment.do'");
			writer.println("</script>");
			writer.close();
		} else {
			writer.println("<script>");
			writer.println("alert('수정에 실패했습니다.');");
			writer.println("document.location.href='manager_recruitment.do'");
			writer.println("</script>");
			writer.close();
			
		}
	}

}
