package com.korea.itcen.RecruitmentService;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.korea.itcen.DAO.RecruitmentDAO;
import com.korea.itcen.DAO.RequestDAO;
import com.korea.itcen.DTO.RecruitmentDTO;
import com.korea.itcen.DTO.RequestDTO;

public class WRecruitment_contentCommand implements HService {

	
	@Override
	public void execute(Model model) throws IOException {

		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");

		
		String rId = request.getParameter("rId");
		RecruitmentDAO recruitmentdao = new RecruitmentDAO();
		RecruitmentDTO recruitmentdto = recruitmentdao.Recruitment_ContentView(rId);
		
		RequestDAO requestdao = new RequestDAO();
		int IRecruitment_post_number = recruitmentdto.getrId();
		ArrayList<RequestDTO> requestdto = null;
		requestdto = requestdao.getRequest(IRecruitment_post_number);
		request.setAttribute("request_view", requestdto);
		request.setAttribute("content_view", recruitmentdto);
	}
}
