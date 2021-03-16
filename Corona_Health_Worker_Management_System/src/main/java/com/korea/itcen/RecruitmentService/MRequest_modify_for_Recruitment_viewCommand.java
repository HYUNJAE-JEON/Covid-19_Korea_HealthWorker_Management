package com.korea.itcen.RecruitmentService;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.korea.itcen.DAO.RequestDAO;
import com.korea.itcen.DTO.RequestDTO;

public class MRequest_modify_for_Recruitment_viewCommand implements HService {

	
	@Override
	public void execute(Model model) throws IOException {
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		String rRecruitment_location_city = request.getParameter("rRecruitment_location_city");
		String rRecruitment_location_district = request.getParameter("rRecruitment_location_district");
		String rRecruitment_necessary_job = request.getParameter("rRecruitment_necessary_job");
		int rId = Integer.parseInt(request.getParameter("rId"));
		
		int request_count_total = 0;
		int request_count_visible = 0;
		RequestDAO requestDao = new RequestDAO();
		ArrayList<RequestDTO> requestDto_list = new ArrayList<RequestDTO>();
		ArrayList<RequestDTO> requestDto_list_invisible = new ArrayList<RequestDTO>();
		requestDto_list = requestDao.getRequest(rId);
		requestDto_list_invisible = requestDao.getRequest_for_modify_invisible(rRecruitment_location_city, rRecruitment_location_district, rRecruitment_necessary_job);
		request_count_total = requestDao.RequestCount_total(rRecruitment_location_city, rRecruitment_location_district, rRecruitment_necessary_job);
		request_count_visible = requestDao.RequestCount(rId);
		
		request.setAttribute("requestDto_list", requestDto_list);
		request.setAttribute("requestDto_list_invisible", requestDto_list_invisible);
		request.setAttribute("request_count_total", request_count_total);
		request.setAttribute("request_count_visible", request_count_visible);
		request.setAttribute("rId", rId);
		request.setAttribute("rRecruitment_location_district", rRecruitment_location_district);
		request.setAttribute("rRecruitment_location_city", rRecruitment_location_city);
		request.setAttribute("rRecruitment_necessary_job", rRecruitment_necessary_job);

		
		

		
		
		
	}


}
