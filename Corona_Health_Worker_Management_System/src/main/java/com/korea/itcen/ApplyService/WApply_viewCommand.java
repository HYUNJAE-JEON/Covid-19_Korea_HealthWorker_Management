package com.korea.itcen.ApplyService;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import com.korea.itcen.DAO.ApplyDAO;
import com.korea.itcen.DTO.ApplyDTO;
import com.korea.itcen.RecruitmentService.HService;

public class WApply_viewCommand implements HService {

	
	@Override
	public void execute(Model model) throws IOException {
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		int apply_count = 0;
		HttpSession session = request.getSession();
		String aMemberID = (String)session.getAttribute("id");
		ApplyDAO applyDao = new ApplyDAO();
		ArrayList<ApplyDTO> applyDto_list = new ArrayList<ApplyDTO>();
		applyDto_list = applyDao.getApply_list(aMemberID);
		apply_count = applyDao.ApplyCount(aMemberID);
		request.setAttribute("apply_list", applyDto_list);
		request.setAttribute("apply_count", apply_count);
	}

}
