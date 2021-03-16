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
import com.korea.itcen.DAO.WorkerDAO;
import com.korea.itcen.RecruitmentService.HService;

public class WApply_Command implements HService {

	
	@Override
	public void execute(Model model) throws IOException {
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		HttpServletResponse response = (HttpServletResponse) map.get("response");		
		
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		ApplyDAO applyDao = new ApplyDAO();
	
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
		
		int aRecruitment_number = Integer.parseInt(request.getParameter("aRecruitment_number"));
		String aMemberID = request.getParameter("aMemberID");
		
		String aApply_location_city = request.getParameter("aApply_location_city");
		String aApply_location_district = request.getParameter("aApply_location_district");
		String aApply_job = request.getParameter("aApply_job");

		
		int ri = applyDao.Apply_write(aHope_institution, aHope_work_period_start, aHope_work_period_end, aYears_of_exp_in_this_area, aInstitution_of_experience, aRecruitment_number, aMemberID, aApply_location_city, aApply_location_district, aApply_job);
		
		WorkerDAO workerDao = WorkerDAO.getInstance();
		workerDao.wStatus_of_apply_modify_yes(aMemberID);
		
		response.setContentType("text/html; charset=euc-kr");
		PrintWriter writer = response.getWriter();
		
		if (ri == 1) {
			writer.println("<script>");
			writer.println("alert('신청되었습니다.');");
			writer.println("document.location.href='worker_apply_completion'");
			writer.println("</script>");
			writer.close();
		} else {
			writer.println("<script>");
			writer.println("alert('신청에 실패했습니다.');");
			writer.println("history.back();");
			writer.println("</script>");
			writer.close();
			
		}
		
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	 
		
		
		
		
		
//		String rId = request.getParameter("rId");
//		RecruitmentDAO recruitmentdao = new RecruitmentDAO();
//		RecruitmentDTO recruitmentdto = recruitmentdao.contentView(rId);
//		request.setAttribute("content_view", recruitmentdto);
//		
//		RequestDAO requestdao = new RequestDAO();
//		int IRecruitment_post_number = recruitmentdto.getrId();
//		ArrayList<RequestDTO> requestdto = null;
//		requestdto = requestdao.getRequest(IRecruitment_post_number);
//		request.setAttribute("request_view", requestdto);
		
		
		
		
	}
}
