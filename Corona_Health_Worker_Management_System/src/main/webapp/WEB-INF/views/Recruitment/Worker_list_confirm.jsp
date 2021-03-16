<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import ="com.korea.itcen.DAO.*"  %>
<%@ page import ="com.korea.itcen.DTO.*"  %>
<%@ page import = "java.util.ArrayList" %>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setCharacterEncoding("UTF-8"); %>
 <%@ page errorPage = "viewError.jsp" %>   




<%
int iId = Integer.parseInt(request.getParameter("iId"));
String iInstitution_name = "";
if (request.getParameter("iInstitution_name") == null) {
	iInstitution_name = (String)request.getAttribute("iInstitution_name");
} else {
	iInstitution_name = request.getParameter("iInstitution_name");
}



ArrayList<WorkerDTO> workerDto_list = new ArrayList<WorkerDTO>();
WorkerDAO workerDao = WorkerDAO.getInstance();

int pageSize = 10;

String pageNum = request.getParameter("pageNum");
if (pageNum == null){
	pageNum = "1";
}

int currentPage = Integer.parseInt(pageNum);

int startRow = (currentPage - 1) * pageSize + 1;
int endRow = currentPage * pageSize;

int rowcount = 0;
rowcount = workerDao.wgetCount(iInstitution_name);

if (rowcount > 0) {
	workerDto_list = workerDao.getMemberList_for_Manager(iInstitution_name, startRow, endRow);

}

request.setAttribute("worker_list", workerDto_list);

int count = 0;
ApplyDAO applyDao = new ApplyDAO();
count = applyDao.iApplyCount(iInstitution_name);

int aRecruitment_number = Integer.parseInt(request.getAttribute("aRecruitment_number").toString());

%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script type="text/javascript">

	function close_Submit(){
		//var district_opt = document.getElementById("rRecruitment_location_district_opt");
		//opener.document.getElementById("rRecruitment_location_district_opt").value = district_opt.options[city_opt.selectedIndex].value;
		window.close();
	}
	
	function getCity(){
		var city_opt = opener.document.getElementById("rRecruitment_location_city_opt")
		document.getElementById("city").value = city_opt.options[city_opt.selectedIndex].text;
	}
	
	function select_district(){
		document.getElementById("rRecruitment_location_district_opt").disabled = false;
		//var city_opt = opener.document.getElementById("rRecruitment_location_city_opt")
		//var city_selected = city_opt.options[city_opt.selectedIndex].text;
		//var List_location_district = com.itcen.DAO.LocationDAO.locationDB_Call_District(city_selected);
		//return List_location_district
	}
	function reload(){
		window.opener.location.href = window.opener.location.href;
	}


	

</script>
<style>
.button {
    width:150px;
    background-color: #476da2;
    border: none;
    color:#fff;
    padding: 15px 0;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 15px;
    margin: 4px;
    cursor: pointer;
}
</style>
</head>
<body>
<form name=form method=get action="manager_workerlist_modify_status_of_apply">
<div class="container">
<fieldset>
<legend style="font-family: 휴먼엑스포;">파견요청 상태변경</legend>
<input type="hidden" name="iId" value=<%=iId %>>
<input type="hidden" name="aRecruitment_number" value=<%=aRecruitment_number %>>
<input type="hidden" name="iInstitution_name" value=<%=iInstitution_name %>>

			<div class = "Recruitment_info" align="center" style="text-align: center;">
			<table width="700" cellpadding="0" cellspacing="0" border="1" style="margin-left: auto; margin-right: auto;">
				<tr>
					<td style="font-weight : bold;"> 기관이름 </td>
					<td> ${requestDto.iInstitution_name}</td>
					<td style="font-weight : bold;"> 기관분류 </td>
					<td> ${requestDto.iInstitution_classification} </td>
					<td style="font-weight : bold;"> 모집직무 </td>
					<td> ${requestDto.iNecessary_Job}
				</tr>
				<tr>
					<td style="font-weight : bold;"> 근무형태 </td>
					<td> ${requestDto.iWork_type} </td>
					<td style="font-weight : bold;"> 중환자실 근무여부 </td>
					<td> ${requestDto.iNeed_ICU} </td>
					<td style="font-weight : bold;"> 숙소제공 여부 </td>
					<td> ${requestDto.iAccomodation_Availability} </td>
				</tr>
				<tr>
					<td style="font-weight : bold;"> 최소필요경력 </td>
					<td> ${requestDto.iNecessary_carrer_years} </td>
					<td style="font-weight : bold;"> 담당자 번호 </td>
					<td> ${requestDto.iRepresentative_number} </td>
					<td style="font-weight : bold;"> 담당자 이메일 </td>
					<td> ${requestDto.iRepresentative_email} </td>
				</tr>
			</table>
			</div>
			<p align="center" style="font-family: 휴먼엑스포;"> 파견신청인원 : <%=count%> / ${requestDto.iNecessary_numbers_of_worker} </p>
			<div class = "Member_info" align="center" style="text-align: center;">
			
			<table width="1450" cellpadding="0" cellspacing="0" border="1" style="margin-left: auto; margin-right: auto;">
				<tr>
					<td> </td>
					<td style="font-weight : bold;"> 이름 </td>
					<td style="font-weight : bold;"> 현재거주지 </td>
					<td style="font-weight : bold;"> 성별 </td>
					<td style="font-weight : bold;"> 자격번호 </td>
					<td style="font-weight : bold;"> 재직상태 </td>
					<td style="font-weight : bold;"> 코로나19 파견의료 경험 </td>
					<td style="font-weight : bold;"> 희망근무시작날짜 </td>
					<td style="font-weight : bold;"> 희망근무종료날짜 </td>
					<td style="font-weight : bold;"> 해당 직무 경력 년수 </td>
					<td style="font-weight : bold;"> 해당 직무 경력 기관 </td>
					<td style="font-weight : bold;"> 상태 </td>
				</tr>
					<%
					
					if (count == 0) {
					
					%>
				<tr>	
					<td colspan="12"> 해당기관 신청자가 없습니다. <td>
				</tr>	
				
				<% } else {
						for(int i = 0; i < workerDto_list.size(); i++) {
							WorkerDTO workerDto = workerDto_list.get(i);
							ApplyDTO applyDto = null;
							applyDto = applyDao.getApply_for_workerlist(workerDto.getwId(), aRecruitment_number);
							
					%>
					
				<tr>
					<td> <input type="checkbox" name="wIds" value=<%=workerDto.getwId()%>></td>
					<td> <%=workerDto.getwName() %> </td>
					<td> <%=workerDto.getwAddress() %> </td>
					<td> <%=workerDto.getwSex() %> </td>
					<td> <%=workerDto.getwCertificate_number() %> </td>
					<td> <%=workerDto.getwStatus_of_employment() %> </td>
					<td> <%=workerDto.getwCovid_19_clinical_experience() %> </td>
					<td> <%=applyDto.getaHope_work_period_start() %> </td>
					<td> <%=applyDto.getaHope_work_period_end() %> </td>
					<td> <%=applyDto.getaYears_of_exp_in_this_area() %> </td>
					<td> <%=applyDto.getaInstitution_of_experience() %> </td>
					<td style="font-weight : bold;"> <%=applyDto.getaStatus_of_dispatch_apply() %> </td>					
					
				<%
						}
				}
				%>
			<tr>
				<td colspan="12" align="center">
				<%
					if(rowcount > 0) { 
						int pageCount = count / pageSize + (count%pageSize == 0 ? 0 : 1);
						int pageBlock = 10;
						int startPage = ((currentPage-1)/pageBlock)*pageBlock+1;
						int endPage = startPage + pageBlock - 1;
						
						if(endPage > pageCount) {
							endPage = pageCount;
						}
						if(startPage > pageBlock){
							%>
							<a href="manager_workerlist_of_request_view?iInstitution_name=<%=iInstitution_name%>&iId=<%=iId%>&pageNum=<%=startPage-10%>">[이전]</a>
							<% 
						}
						for(int i=startPage; i <= endPage; i++) {
							if(i == currentPage) {
								%>
								[<%=i %>]
								<% 
							} else{
						%>
							<a href="manager_workerlist_of_request_view?iInstitution_name=<%=iInstitution_name%>&iId=<%=iId%>&pageNum=<%=i%>">[<%=i %>]</a>
						<%
						}
					}
						
						if (endPage < pageCount) {
							%>
							<a href="manager_workerlist_of_request_view?iInstitution_name=<%=iInstitution_name%>&iId=<%=iId%>&pageNum=<%=startPage+10%>">[다음]</a>
							<% 
							
						}
					}
				%>
			</table>
			</div>
			
			<div class = "buttons" align = "center" style= "text-align: center; font-family: 휴먼엑스포;">
			<%
	
				
			if (request.getAttribute("success") == null) {
				
			} else {
				int sum = Integer.parseInt(request.getAttribute("success").toString());
				
			%>		
			<p><%=sum %>개 변경완료</p>
			<%} %>
			<br/>
			파견지원 상태변경: <select name="aStatus_of_dispatch_apply" id="aStatus_of_dispatch_apply">
			<option value="N"> 선택하세요 </option>
			<option value="대기">대기</option>
			<option value="검토">검토</option>
			<option value="완료">완료</option>
			<option value="반려">반려</option>
			</select>
			<br/>
			<div align="center">
			<input class="button" type= "submit"  value="변경">
			<button class="button"  type= "button"  onclick="close_Submit();">닫기</button>
			</div>
			</div>

</fieldset>
</div>
</form>		
</body>
</html>