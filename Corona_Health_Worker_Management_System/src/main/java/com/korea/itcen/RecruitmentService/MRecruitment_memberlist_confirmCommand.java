package com.korea.itcen.RecruitmentService;

import java.io.IOException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.korea.itcen.DAO.RequestDAO;
import com.korea.itcen.DTO.RequestDTO;

public class MRecruitment_memberlist_confirmCommand implements HService {

	
	@Override
	public void execute(Model model) throws IOException {
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request"); 
		
		request.setCharacterEncoding("UTF-8");
		int iId = 0;
		if (request.getParameter("iId") == null) {
			iId = Integer.parseInt(request.getAttribute("iId").toString());
		} else {
			iId = Integer.parseInt(request.getParameter("iId"));
		}
		RequestDAO requestDao = new RequestDAO();
		RequestDTO requestDto = null;
		requestDto = requestDao.getRequest_for_Memberlist(iId);
		int aRecruitment_number = requestDto.getiRecruitment_post_number();
		request.setAttribute("requestDto", requestDto);
		request.setAttribute("aRecruitment_number", aRecruitment_number);
		
		
	}

}
