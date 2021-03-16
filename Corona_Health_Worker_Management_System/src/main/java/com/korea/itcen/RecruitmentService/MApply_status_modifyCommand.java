package com.korea.itcen.RecruitmentService;

import java.io.IOException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.korea.itcen.DAO.ApplyDAO;

public class MApply_status_modifyCommand implements HService {

	
	@Override
	public void execute(Model model) throws IOException {
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request"); 
		request.setCharacterEncoding("UTF-8");
		
		int aRecruitment_number = Integer.parseInt(request.getParameter("aRecruitment_number"));
		String iId = request.getParameter("iId");
		
		String iInstitution_name = request.getParameter("iInstitution_name");
		String[] wIds = request.getParameterValues("wIds");
		String aStatus_of_dispatch_apply = request.getParameter("aStatus_of_dispatch_apply");
		
		ApplyDAO applyDao = new ApplyDAO();
		int result = 0;
		int sum = 0;
		
		for(int i = 0; i<wIds.length; i++) {
			result = applyDao.Apply_modify_status(aStatus_of_dispatch_apply, wIds[i], aRecruitment_number);
			sum += result;
		}
		System.out.println(sum);
		request.setAttribute("iId", iId);
		request.setAttribute("iInstitution_name", iInstitution_name);
		request.setAttribute("success", sum);
		
	}
}
