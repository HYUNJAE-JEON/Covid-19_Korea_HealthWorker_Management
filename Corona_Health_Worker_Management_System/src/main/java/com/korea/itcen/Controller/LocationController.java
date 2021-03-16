package com.korea.itcen.Controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.korea.itcen.LocationService.Location_district_callCommand;
import com.korea.itcen.RecruitmentService.HService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class LocationController {
	
	HService service = null;
	//도, 광역시를 선택한 뒤 구,군이 자동으로 나오는 것
	@RequestMapping("/District_call")
	@ResponseBody
	public void District_call(HttpServletRequest request, HttpServletResponse response, Model model) throws IOException {
		System.out.println("구,군 선택");
		
		model.addAttribute("request", request);
		model.addAttribute("response", response);
		service = new Location_district_callCommand();
		service.execute(model);
		
	}
	@ExceptionHandler
	public String handleException(Exception e) {
		System.out.println("에러발생");
			return "Error/viewError";
	}

}
