package com.korea.itcen.RequestService;

import java.io.IOException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.ui.Model;

import com.korea.itcen.DAO.RequestDAO;
import com.korea.itcen.RecruitmentService.HService;

public class MRequest_status_modifyCommand  implements HService {

	
	@Override
	public void execute(Model model) throws IOException {
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
			
		request.setCharacterEncoding("UTF-8");
		

		String[] iIds = request.getParameterValues("iIds");
		String iStatus_of_request = request.getParameter("iStatus_of_request");
		
		RequestDAO requestDao = new RequestDAO();
		int result = 0;
		int sum = 0;
		
		for(int i = 0; i<iIds.length; i++) {
			result = requestDao.change_status_of_request(iIds[i], iStatus_of_request);
			sum += result;
			}
	}

}
