package com.korea.itcen.LocationService;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.springframework.ui.Model;

import com.korea.itcen.DAO.LocationDAO;
import com.korea.itcen.RecruitmentService.HService;

public class Location_district_callCommand implements HService {

	
	@Override
	public void execute(Model model) throws IOException {
		try {
			
			Map<String, Object> map = model.asMap();
			HttpServletRequest request = (HttpServletRequest) map.get("request");
			HttpServletResponse response = (HttpServletResponse) map.get("response");
			
			request.setCharacterEncoding("UTF-8");
			response.setCharacterEncoding("UTF-8");
			String city_selected = request.getParameter("select_city");
			ArrayList<String> district_list = new ArrayList<String>();
			System.out.println(city_selected);
			
			LocationDAO locationDao = new LocationDAO();
			district_list = locationDao.locationDB_call_District(city_selected);
			
			JSONArray jsonArray = new JSONArray();
			for (int i = 0; i <district_list.size(); i++) {
				jsonArray.add(district_list.get(i));
				
			}
			
			PrintWriter pw = response.getWriter();
			pw.print(jsonArray.toString());
			pw.flush();
			pw.close();
			
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}
		

}
