package com.korea.itcen.RecruitmentService;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.ui.Model;

import com.korea.itcen.DAO.RecruitmentDAO;

public class MRecruitment_modifyCommand implements HService {

	
	@Override
	public void execute(Model model) throws IOException {
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		HttpServletResponse response = (HttpServletResponse) map.get("response");
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		int rId = Integer.parseInt(request.getParameter("rId"));
		String rTitle = request.getParameter("rTitle");
		String rContents = request.getParameter("rTitle");
		int rRecruitment_num_of_worker = Integer.parseInt(request.getParameter("rRecruitment_num_of_worker"));

		int result=0;
		RecruitmentDAO recruitmentDao = new RecruitmentDAO();
		result = recruitmentDao.Recruitment_modify(rId, rTitle, rContents, rRecruitment_num_of_worker);
		
		response.setContentType("text/html; charset=euc-kr");
		PrintWriter writer = response.getWriter();
		
		if(result > 0) {
			writer.println("<script>");
			writer.println("alert('모집공고가 정상적으로 수정되었습니다.');");
			writer.println("document.location.href='manager_recruitment'");
			writer.println("</script>");
			writer.close();
		} else {
				writer.println("<script>");
				writer.println("alert('정상적으로 등록되지 않았습니다. 재작성바랍니다.');");
				writer.println("history.back();");
				writer.println("</script>");
				writer.close();
				
		}
			
	}
}
