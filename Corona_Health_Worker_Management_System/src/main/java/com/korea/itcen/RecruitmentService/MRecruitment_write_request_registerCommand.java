package com.korea.itcen.RecruitmentService;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.ui.Model;

import com.korea.itcen.DAO.RequestDAO;
import com.korea.itcen.DTO.RequestDTO;

public class MRecruitment_write_request_registerCommand implements HService {

	
	@Override
	public void execute(Model model) throws IOException {
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		HttpServletResponse response = (HttpServletResponse) map.get("response");

		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8"); 
		
		String rRecruitment_location_city = request.getParameter("rRecruitment_location_city");
		String rRecruitment_location_district = request.getParameter("rRecruitment_location_district");
		String rRecruitment_necessary_job = request.getParameter("rRecruitment_necessary_job");
		
		System.out.println(rRecruitment_location_city);
		System.out.println(rRecruitment_location_district);
		System.out.println(rRecruitment_necessary_job);
		
		RequestDAO requestDao = new RequestDAO();
		ArrayList<RequestDTO> requestDto_list = new ArrayList<RequestDTO>();
		
		int request_count_total = 0;
		request_count_total = requestDao.RequestCount_total_write(rRecruitment_location_city, rRecruitment_location_district, rRecruitment_necessary_job);
		requestDto_list = requestDao.getRequest_for_modify_invisible(rRecruitment_location_city, rRecruitment_location_district, rRecruitment_necessary_job);
		
//		Gson gson = new Gson();
//		ArrayList<RequestDTO> requestDto_list_convert = new ArrayList<RequestDTO>();
//		requestDto_list_convert = gson.fromJson(, classOfT)
		
		
		JSONObject obj = new JSONObject();
		try {
			JSONArray jsonArray = new JSONArray();
			for(int i = 0; i<requestDto_list.size(); i++) {
				JSONObject sObject = new JSONObject();
				sObject.put("iId", requestDto_list.get(i).getiId());
				sObject.put("iInstitution_name", requestDto_list.get(i).getiInstitution_name());
				sObject.put("iInstitution_classification", requestDto_list.get(i).getiInstitution_classification());
				sObject.put("iNecessary_numbers_of_worker", requestDto_list.get(i).getiNecessary_numbers_of_worker());
				sObject.put("iWork_period", requestDto_list.get(i).getiWork_period());
				sObject.put("iWork_type", requestDto_list.get(i).getiWork_type());
				sObject.put("iNeed_ICU", requestDto_list.get(i).getiNeed_ICU());
				sObject.put("iAccomodation_Availability", requestDto_list.get(i).getiAccomodation_Availability());
				if(requestDto_list.get(i).getiRemarks() == null) {
					sObject.put("iRemarks", "없음");
				} else {
				sObject.put("iRemarks", requestDto_list.get(i).getiRemarks());
				}
				jsonArray.add(sObject);
			}
			PrintWriter pw = response.getWriter();
			pw.print(jsonArray.toString());
			pw.flush();
			pw.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		

		
		
//		request.setAttribute("rRecruitment_location_city", rRecruitment_location_city);
//		request.setAttribute("rRecruitment_location_district", rRecruitment_location_district);
//		request.setAttribute("rRecruitment_necessary_job", rRecruitment_necessary_job);
		request.setAttribute("request_count_total", request_count_total);
//		request.setAttribute("requestDto_list", requestDto_list);
	}
}
