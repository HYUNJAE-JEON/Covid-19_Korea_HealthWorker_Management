package com.korea.itcen.RecruitmentService;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.ui.Model;

import com.korea.itcen.DAO.ApplyDAO;
import com.korea.itcen.DAO.RecruitmentDAO;
import com.korea.itcen.DAO.RequestDAO;
import com.korea.itcen.DTO.RecruitmentDTO;
import com.korea.itcen.DTO.RequestDTO;

public class MRecruitment_contentCommand implements HService {

	
	@Override
	public void execute(Model model) throws IOException {
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		request.setCharacterEncoding("UTF-8");

		String rId = request.getParameter("rId");
		RecruitmentDAO recruitmentDao = new RecruitmentDAO();
		RecruitmentDTO recruitmentDto = null;
		recruitmentDto = recruitmentDao.contentView(rId);
		request.setAttribute("content_view", recruitmentDto);
		
		int applycount = 0;
		ApplyDAO ApplyDao = new ApplyDAO();
		applycount = ApplyDao.rApplyCount(Integer.parseInt(rId));
		request.setAttribute("applycount", applycount);
		
		ArrayList<RequestDTO> requestdto = null;
		RequestDAO requestdao = new RequestDAO();
		int IRecruitment_post_number = recruitmentDto.getrId();
		requestdto = requestdao.getRequest(IRecruitment_post_number);
		request.setAttribute("request_view", requestdto);

	}

}
