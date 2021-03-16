package com.korea.itcen.WorkerService;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.sql.Date;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import com.korea.itcen.DAO.WorkerDAO;
import com.korea.itcen.DTO.WorkerDTO;
import com.korea.itcen.RecruitmentService.HService;

public class WModify_Command implements HService {

	
	@Override
	public void execute(Model model) throws IOException {
	try {
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		HttpServletResponse response = (HttpServletResponse) map.get("response");
		
		
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		response.setContentType("text/html; charset=euc-kr");
		PrintWriter writer = response.getWriter();
		HttpSession session = request.getSession();
		WorkerDTO workerDto = new WorkerDTO();
		
		String wId = request.getParameter("wId");
		String wName = request.getParameter("wName");
		String wSex = request.getParameter("wSex");
		String wPw = request.getParameter("wPw");
		
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		String textDate = request.getParameter("wBirthdate");
		java.util.Date commitUtilDate;
		commitUtilDate = format.parse(textDate);
		long timeLongValue = commitUtilDate.getTime();
		java.sql.Date wBirthdate = new Date(timeLongValue);
		
		
		String wPhone_number = request.getParameter("wPhone_number");
		String wCertificate_number = request.getParameter("wCertificate_number");
		String wJob = "";
		wJob = request.getParameter("wJob");
		if(("0").equals(request.getParameter("wJob_s"))) {
			wJob = request.getParameter("original_wJob");
		} else {
			wJob = request.getParameter("wJob");
		}
		
		int wClinical_experience = 0;
		int wMajor_career_years  = 0;
		if(("0").equals(request.getParameter("wClinical_experience"))) {
			wClinical_experience = Integer.parseInt(request.getParameter("original_wClinical_experience"));
		} else {
			wClinical_experience = Integer.parseInt(request.getParameter("wClinical_experience"));
		}
		if(("0").equals(request.getParameter("wMjaor_career_years"))) {
			wMajor_career_years = Integer.parseInt(request.getParameter("original_wMjaor_career_years"));
		} else {
			wMajor_career_years = Integer.parseInt(request.getParameter("wMjaor_career_years"));
		}
		String wMajor_career_institution = request.getParameter("wMajor_career_institution");
		String wStatus_of_employment = request.getParameter("wStatus_of_employment");
		String wCovid_19_clinical_experience = request.getParameter("wCovid_19_clinical_experience");
		String wEmail = request.getParameter("wEmail");
		
		String wAddress = null;
		if(request.getParameter("wAddress1") == null && request.getParameter("wAddress2") == null && request.getParameter("wAddress3") == null) {
			wAddress = request.getParameter("original_wAddress");
		} else {
			wAddress = request.getParameter("wAddress1") + request.getParameter("wAddress2") + "(" + request.getParameter("wAddress3") + ")";
		}
		wAddress = request.getParameter("wAddress1") + request.getParameter("wAddress2") + "(" + request.getParameter("wAddress3") + ")";
		workerDto.setwSex(wSex);
		workerDto.setwId(wId);
		workerDto.setwName(wName);
		workerDto.setwBirthdate(wBirthdate);
		workerDto.setwPw(wPw);
		workerDto.setwPhone_number(wPhone_number);
		workerDto.setwCertificate_number(wCertificate_number);
		workerDto.setwJob(wJob);
		workerDto.setwClinical_experience(wClinical_experience);
		workerDto.setwMajor_career_years(wMajor_career_years);
		workerDto.setwMajor_career_institution(wMajor_career_institution);
		workerDto.setwStatus_of_employment(wStatus_of_employment);
		workerDto.setwStatus_of_apply("대기");
		workerDto.setwCovid_19_clinical_experience(wCovid_19_clinical_experience);
		workerDto.setwEmail(wEmail);
		workerDto.setwAddress(wAddress);
		workerDto.setwDate(new Timestamp(System.currentTimeMillis()));

		System.out.println(wSex);
		System.out.println(wId);
		System.out.println(wName);
		System.out.println(wBirthdate);
		System.out.println(wPw);
		System.out.println(wPhone_number);
		System.out.println(wCertificate_number);
		System.out.println(wJob);
		System.out.println(wClinical_experience);
		System.out.println(wMajor_career_years);
		System.out.println(wMajor_career_institution);
		System.out.println(wStatus_of_employment);
		System.out.println(wCovid_19_clinical_experience);
		System.out.println(wEmail);
		System.out.println(wAddress);

		
		
		
		
		WorkerDAO workerDao = WorkerDAO.getInstance();
		int ri = workerDao.updateMember(workerDto);
		if (ri == 1) {
			writer.println("<script language='javascript'>");
			writer.println("alert('정보수정 되었습니다.');");
			writer.println("document.location.href='worker_recruitment_view'");
			writer.println("</script>");
			writer.close();
			
		} else {
			writer.println("<script language='javascript'>");
			writer.println("alert('정보수정 실패입니다.');");
			writer.println("history.go(-1)");
			writer.println("</script>");
			writer.close();
		}
	
	}catch (ParseException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	
	
	
		}
		
		
}
