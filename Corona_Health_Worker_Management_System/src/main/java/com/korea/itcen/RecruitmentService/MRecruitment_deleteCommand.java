package com.korea.itcen.RecruitmentService;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.ui.Model;

import com.korea.itcen.DAO.RecruitmentDAO;
import com.korea.itcen.DAO.RequestDAO;

public class MRecruitment_deleteCommand implements HService {

	
	@Override
	public void execute(Model model) throws IOException {
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		HttpServletResponse response = (HttpServletResponse) map.get("response");
		
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		int result2=0;
		int result = 0;
		int  rId = Integer.parseInt(request.getParameter("rId"));
		RecruitmentDAO recruitmentDao = new RecruitmentDAO();
		RequestDAO requestDao = new RequestDAO();
		result2 = requestDao.Request_recruitment_delete(rId);
		result = recruitmentDao.Recruitment_delete(rId);
		
		response.setContentType("text/html; charset=euc-kr");
		PrintWriter writer = response.getWriter();
		
		if(result == 1) {
			writer.println("<script>");
			writer.println("alert('정상적으로 삭제되었습니다.');");
			writer.println("document.location.href='manager_recruitment'");
			writer.println("</script>");
			writer.close();
		} else {
			writer.println("<script>");
			writer.println("alert('삭제되지 않았습니다. 다시 시도해주십시오.');");
			writer.println("history.back();");
			writer.println("</script>");
			writer.close();
		}
	}
	
}
