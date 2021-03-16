package com.korea.itcen.WorkerService;

import java.io.IOException;
import java.io.PrintWriter;
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

public class WJoin_Command implements HService {

	
	@Override
	public void execute(Model model) throws IOException {

		WorkerDTO workerDto = new WorkerDTO();		

		try {
			Map<String, Object> map = model.asMap();
			HttpServletRequest request = (HttpServletRequest) map.get("request");
			HttpServletResponse response = (HttpServletResponse) map.get("response");
			
			request.setCharacterEncoding("utf-8");
			response.setCharacterEncoding("utf-8");

			String wId = request.getParameter("wId");
			String wPw = request.getParameter("wPw");
			String wName = request.getParameter("wName");
			
			SimpleDateFormat format = new SimpleDateFormat("yyyyMMdd");
			String textDate = request.getParameter("year")+request.getParameter("month")+request.getParameter("day");
			java.util.Date commitUtilDate;
			commitUtilDate = format.parse(textDate);
			long timeLongValue = commitUtilDate.getTime();
			java.sql.Date wBirthdate = new Date(timeLongValue);
			
			
			String wPhone_number = request.getParameter("wPhone_number");
			String wSex = request.getParameter("wSex");
			String wCertificate_number = request.getParameter("wCertificate_number");
			String wJob = request.getParameter("wJob");
			int wClinical_experience = Integer.parseInt(request.getParameter("wClinical_experience"));
			int wMajor_career_years = Integer.parseInt(request.getParameter("wMjaor_career_years"));
			String wMajor_career_institution = request.getParameter("wMajor_career_institution");
			String wStatus_of_employment = request.getParameter("wStatus_of_employment");
			String wCovid_19_clinical_experience = request.getParameter("wCovid_19_clinical_experience");
			String wEmail = request.getParameter("wEmail");
			String wAddress = request.getParameter("wAddress1") + request.getParameter("wAddress2") + "(" + request.getParameter("wAddress3") + ")";
			
			workerDto.setwId(wId);
			workerDto.setwPw(wPw);
			workerDto.setwName(wName);
			workerDto.setwBirthdate(wBirthdate);
			workerDto.setwAddress(wAddress);
			workerDto.setwPhone_number(wPhone_number);
			workerDto.setwEmail(wEmail);
			workerDto.setwSex(wSex);
			workerDto.setwCertificate_number(wCertificate_number);
			workerDto.setwJob(wJob);
			workerDto.setwClinical_experience(wClinical_experience);
			workerDto.setwMajor_career_years(wMajor_career_years);
			workerDto.setwMajor_career_institution(wMajor_career_institution);
			workerDto.setwStatus_of_employment(wStatus_of_employment);
			workerDto.setwCovid_19_clinical_experience(wCovid_19_clinical_experience);
			workerDto.setwDate(new Timestamp(System.currentTimeMillis()));
			
		
		
			WorkerDAO workerDao = WorkerDAO.getInstance();
			response.setContentType("text/html; charset=euc-kr");
			PrintWriter writer = response.getWriter();
			
			HttpSession session = request.getSession();
			
			if(workerDao.confirmId(workerDto.getwId()) == WorkerDAO.MEMBER_EXISTENT) {
				writer.println("<script>");
				writer.println("alert('데이터가 이미 존재합니다.');");
				writer.println("history.back();");
				writer.println("</script>");
				writer.close();
			} else {
				int ri = workerDao.insertWorker(workerDto); 
				if(ri == WorkerDAO.MEMBER_JOIN_SUCCESS) {
					session.setAttribute("id", workerDto.getwId());
					writer.println("<script>");
					writer.println("alert('회원가입을 축하 합니다.');");
					writer.println("document.location.href='login_view'");
					writer.println("</script>");
					writer.close();
					
				} else {
					writer.println("<script>");
					writer.println("alert('회원가입에 실패했습니다.');");
					writer.println("document.location.href='login_view'");
					writer.println("</script>");
					writer.close();
				}
			}
		
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		

		

		
		
	
	}
}
