package com.korea.itcen.RecruitmentService;

import java.io.IOException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.korea.itcen.DAO.RequestDAO;

public class MRequest_visible_modifyCommand implements HService {

	
	@Override
	public void execute(Model model) throws IOException {
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");

		int IRECRUITMENT_POST_NUMBER = Integer.parseInt(request.getParameter("IRECRUITMENT_POST_NUMBER"));
		String[] iIds = request.getParameterValues("iIds");
		RequestDAO requestDao = new RequestDAO();
		for(int i = 0; i<iIds.length; i++) {
			requestDao.update_request_visible(IRECRUITMENT_POST_NUMBER, iIds[i]);
		}
		
	}

}
