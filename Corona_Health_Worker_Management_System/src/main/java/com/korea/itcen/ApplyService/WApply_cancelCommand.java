package com.korea.itcen.ApplyService;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.ui.Model;

import com.korea.itcen.DAO.ApplyDAO;
import com.korea.itcen.RecruitmentService.HService;

public class WApply_cancelCommand implements HService {

	
	@Override
	public void execute(Model model) throws IOException {
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		HttpServletResponse response = (HttpServletResponse) map.get("response");
		
		
		response.setContentType("text/html; charset=euc-kr");
		PrintWriter writer = response.getWriter();
		int rn = 0;
		int aId = Integer.parseInt(request.getParameter("aId"));
		ApplyDAO applyDao = new ApplyDAO();
		rn = applyDao.Apply_cancel(aId);

		if(rn == 1) {
			writer.println("<script>");
			writer.println("alert('정상적으로 취소되었습니다.');");
			writer.println("document.location.href='worker_apply_view'");
			writer.println("</script>");
			writer.close();
		} else {
			writer.println("<script>");
			writer.println("alert('취소되지 않았습니다. 다시 시도해주십시오.');");
			writer.println("history.back();");
			writer.println("</script>");
			writer.close();
		}
		
	}

}
