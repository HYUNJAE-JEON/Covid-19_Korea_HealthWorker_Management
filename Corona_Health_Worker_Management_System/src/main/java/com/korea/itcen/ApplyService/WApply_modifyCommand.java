package com.korea.itcen.ApplyService;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.ui.Model;

import com.korea.itcen.DAO.ApplyDAO;
import com.korea.itcen.RecruitmentService.HService;

public class WApply_modifyCommand implements HService {

	
	@Override
	public void execute(Model model)  throws IOException {
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		HttpServletResponse response = (HttpServletResponse) map.get("response");
		int aId = Integer.parseInt(request.getParameter("aId"));
		ApplyDAO applyDao = new ApplyDAO();
		String aMemberID = request.getParameter("aMemberID");
		try {
			String aHope_institution = request.getParameter("aHope_institution");

			String startDate = request.getParameter("aHope_work_period_start");
			SimpleDateFormat in = new SimpleDateFormat("yyyy-MM-dd");;
			java.util.Date commitUtilDate;
			commitUtilDate = in.parse(startDate);
			long timeLongValue = commitUtilDate.getTime(); 
			java.sql.Date aHope_work_period_start = new Date(timeLongValue);
			
			String endDate = request.getParameter("aHope_work_period_end");
			java.util.Date commitUtilDate2;
			commitUtilDate2 = in.parse(endDate);
			long timeLongValue2 = commitUtilDate2.getTime();
			java.sql.Date aHope_work_period_end = new Date(timeLongValue2);
			
			int aYears_of_exp_in_this_area = Integer.parseInt(request.getParameter("aYears_of_exp_in_this_area"));
			String aInstitution_of_experience = request.getParameter("aInstitution_of_experience");
			
			int ri = applyDao.Apply_modify(aId, aHope_institution, aHope_work_period_start, aHope_work_period_end, aYears_of_exp_in_this_area, aInstitution_of_experience);
			
			response.setContentType("text/html; charset=euc-kr");
			PrintWriter writer = response.getWriter();
			
			if (ri == 1) {
				writer.println("<script>");
				writer.println("alert('수정되었습니다.');");
				writer.println("document.location.href='worker_apply_view'");
				writer.println("</script>");
				writer.close();
			} else {
				writer.println("<script>");
				writer.println("alert('수정에 실패했습니다.');");
				writer.println("history.back();");
				writer.println("</script>");
				writer.close();
				
			}
			
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		
		}
	}

}
