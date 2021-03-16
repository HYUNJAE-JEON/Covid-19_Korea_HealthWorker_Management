package com.korea.itcen.WorkerService;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import com.korea.itcen.DAO.WorkerDAO;
import com.korea.itcen.DTO.WorkerDTO;
import com.korea.itcen.RecruitmentService.HService;

public class WLogin_Command implements HService {

	
	@Override
	public void execute(Model model) throws IOException {
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		HttpServletResponse response = (HttpServletResponse) map.get("response");
		
		String checklogin = request.getParameter("memberlogin");
		response.setContentType("text/html; charset=euc-kr");
		PrintWriter writer = response.getWriter();
		HttpSession session = request.getSession();

		

		
		if (checklogin.equals("worker")) {
			
			String wId = request.getParameter("wId");
			String wPw = request.getParameter("wPw");
			WorkerDAO workerDao = WorkerDAO.getInstance();
			int checkNum = workerDao.userCheck(wId, wPw);

			if(checkNum == -1) {
			
			writer.println("<script>");
			writer.println("alert('아이디가 존재하지 않습니다.');");
			writer.println("history.go(-1);");
			writer.println("</script>");
			writer.close();
			} else if(checkNum == 0) {
			writer.println("<script>");
			writer.println("alert('비밀번호가 틀립니다.');");
			writer.println("history.go(-1);");
			writer.println("</script>");
			writer.close();
			} else if(checkNum == 1) {
				WorkerDTO workerDto = workerDao.getMember(wId);
				
				if(workerDto == null) {
					writer.println("<script>");
					writer.println("alert('존재하지 않는 회원 입니다.');");
					writer.println("history.go(-1);");
					writer.println("</script>");
					writer.close();	
				} else {
					String wName = workerDto.getwName();

					session.setAttribute("id", wId);
					session.setAttribute("name", wName);
					session.setAttribute("ValidMem", "yes");
					writer.println("<script>");
					writer.println("document.location.href='worker_recruitment_view'");
					writer.println("</script>");
					writer.close();
				}
			}
		} else if(checklogin.equals("institution")) {
			writer.println("<script>");
			writer.println("alert('개발 중인 기능입니다. 문의:ysysyshy@naver.com');");
			writer.println("history.go(-1);");
			writer.println("</script>");
			writer.close();
		} else if(checklogin.equals("manager")) {
			String mId = request.getParameter("wId");
			String mPw = request.getParameter("wPw");
			
			if(mId.equals("itcen1234") && mPw.equals("itcen1234")) {
				writer.println("<script>");
				writer.println("alert('관리자 모드입니다.');");
				writer.println("document.location.href='main_view'");
				writer.println("</script>");
				writer.close();
			} else {
				writer.println("<script>");
				writer.println("alert('권한이 없는 아이디입니다. 권한 문의:ysysyshy@naver.com');");
				writer.println("history.go(-1);");
				writer.println("</script>");
				writer.close();
			}
		}
		

		
			
		}
	}


