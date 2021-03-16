package com.korea.itcen.RecruitmentService;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.korea.itcen.DAO.LocationDAO;
import com.korea.itcen.DTO.LocationDTO;

public class MRecruitment_write_viewCommand implements HService {

	
	@Override
	public void execute(Model model) throws IOException {
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		request.setCharacterEncoding("UTF-8");
		
		LocationDAO locationDao = new LocationDAO();
		ArrayList<LocationDTO> city_selected = new ArrayList<LocationDTO>();
		city_selected = locationDao.locationDB_Call_City();
		request.setAttribute("city_list", city_selected);
		
	}

	}
	
	
	

