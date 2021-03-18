package com.korea.itcen.RecruitmentService;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.Timestamp;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.ui.Model;

import com.korea.itcen.DAO.RecruitmentDAO;
import com.korea.itcen.DAO.RequestDAO;

public class MRecruitment_writeCommand implements HService {

	
	@Override
	public void execute(Model model) throws IOException {
		
			Map<String, Object> map = model.asMap();
			HttpServletRequest request = (HttpServletRequest) map.get("request");
			HttpServletResponse response = (HttpServletResponse) map.get("response");
			
			request.setCharacterEncoding("UTF-8");
			response.setCharacterEncoding("UTF-8");
			response.setContentType("text/html; charset=utf-8");
			PrintWriter writer = response.getWriter();
		
			
			if(request.getParameterValues("iIds") == null) {
				writer.println("<script>");
				writer.println("alert('상세기관을 정하지 않았습니다. 지역과 직무를 확인바라며, 상세기관이 표시되지 않았다면 파견요청관리에서 확인하시기 바랍니다.');");
				writer.println("history.back();");
				writer.println("</script>");
				writer.close();
			} else {
			
			String rTitle = request.getParameter("rTitle");
			String rRecruitment_location_city = request.getParameter("rRecruitment_location_city_opt");
			String rRecruitment_location_district = request.getParameter("rRecruitment_location_district_opt");
			String rRecruitment_necessary_job = request.getParameter("rRecruitment_necessary_job_opt");
			int rRecruitment_num_of_worker = Integer.parseInt(request.getParameter("rRecruitment_num_of_worker"));
			String rContents = request.getParameter("rContents");
			
			Timestamp timestamp = new Timestamp(System.currentTimeMillis());
			Date rUpload_date = new Date(timestamp.getTime());
			
			
			
			int result = 0;
			RecruitmentDAO recruitmentDao = new RecruitmentDAO();
			result = recruitmentDao.Recruitment_write(rTitle, rUpload_date, rRecruitment_location_city, rRecruitment_location_district, rRecruitment_necessary_job, rRecruitment_num_of_worker, rContents);
			
			RequestDAO requestDao = new RequestDAO();
			
			int rId = 0;
			rId = recruitmentDao.Recruitment_select_last_row();
			System.out.println(rId);
			int sum = 0;

					
			String[] iIds = request.getParameterValues("iIds");
			
			for(int i = 0; i<iIds.length; i++) {
				result = requestDao.update_request_visible(rId, iIds[i]);
				sum += result;
			}
			
			if(result != 0) {
				writer.println("<script>");
				writer.println("alert('모집공고가 정상적으로 작성되었습니다.');");
				writer.println("document.location.href='manager_recruitment.do'");
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

}
