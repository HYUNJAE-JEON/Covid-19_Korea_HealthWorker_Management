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
<legend style="font-family: �޸տ�����;">�İ߿�û ���º���</legend>
<input type="hidden" name="iId" value=<%=iId %>>
<input type="hidden" name="aRecruitment_number" value=<%=aRecruitment_number %>>
<input type="hidden" name="iInstitution_name" value=<%=iInstitution_name %>>

			<div class = "Recruitment_info" align="center" style="text-align: center;">
			<table width="700" cellpadding="0" cellspacing="0" border="1" style="margin-left: auto; margin-right: auto;">
				<tr>
					<td style="font-weight : bold;"> ����̸� </td>
					<td> ${requestDto.iInstitution_name}</td>
					<td style="font-weight : bold;"> ����з� </td>
					<td> ${requestDto.iInstitution_classification} </td>
					<td style="font-weight : bold;"> �������� </td>
					<td> ${requestDto.iNecessary_Job}
				</tr>
				<tr>
					<td style="font-weight : bold;"> �ٹ����� </td>
					<td> ${requestDto.iWork_type} </td>
					<td style="font-weight : bold;"> ��ȯ�ڽ� �ٹ����� </td>
					<td> ${requestDto.iNeed_ICU} </td>
					<td style="font-weight : bold;"> �������� ���� </td>
					<td> ${requestDto.iAccomodation_Availability} </td>
				</tr>
				<tr>
					<td style="font-weight : bold;"> �ּ��ʿ��� </td>
					<td> ${requestDto.iNecessary_carrer_years} </td>
					<td style="font-weight : bold;"> ����� ��ȣ </td>
					<td> ${requestDto.iRepresentative_number} </td>
					<td style="font-weight : bold;"> ����� �̸��� </td>
					<td> ${requestDto.iRepresentative_email} </td>
				</tr>
			</table>
			</div>
			<p align="center" style="font-family: �޸տ�����;"> �İ߽�û�ο� : <%=count%> / ${requestDto.iNecessary_numbers_of_worker} </p>
			<div class = "Member_info" align="center" style="text-align: center;">
			
			<table width="1450" cellpadding="0" cellspacing="0" border="1" style="margin-left: auto; margin-right: auto;">
				<tr>
					<td> </td>
					<td style="font-weight : bold;"> �̸� </td>
					<td style="font-weight : bold;"> ��������� </td>
					<td style="font-weight : bold;"> ���� </td>
					<td style="font-weight : bold;"> �ڰݹ�ȣ </td>
					<td style="font-weight : bold;"> �������� </td>
					<td style="font-weight : bold;"> �ڷγ�19 �İ��Ƿ� ���� </td>
					<td style="font-weight : bold;"> ����ٹ����۳�¥ </td>
					<td style="font-weight : bold;"> ����ٹ����ᳯ¥ </td>
					<td style="font-weight : bold;"> �ش� ���� ��� ��� </td>
					<td style="font-weight : bold;"> �ش� ���� ��� ��� </td>
					<td style="font-weight : bold;"> ���� </td>
				</tr>
					<%
					
					if (count == 0) {
					
					%>
				<tr>	
					<td colspan="12"> �ش��� ��û�ڰ� �����ϴ�. <td>
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
							<a href="manager_workerlist_of_request_view?iInstitution_name=<%=iInstitution_name%>&iId=<%=iId%>&pageNum=<%=startPage-10%>">[����]</a>
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
							<a href="manager_workerlist_of_request_view?iInstitution_name=<%=iInstitution_name%>&iId=<%=iId%>&pageNum=<%=startPage+10%>">[����]</a>
							<% 
							
						}
					}
				%>
			</table>
			</div>
			
			<div class = "buttons" align = "center" style= "text-align: center; font-family: �޸տ�����;">
			<%
	
				
			if (request.getAttribute("success") == null) {
				
			} else {
				int sum = Integer.parseInt(request.getAttribute("success").toString());
				
			%>		
			<p><%=sum %>�� ����Ϸ�</p>
			<%} %>
			<br/>
			�İ����� ���º���: <select name="aStatus_of_dispatch_apply" id="aStatus_of_dispatch_apply">
			<option value="N"> �����ϼ��� </option>
			<option value="���">���</option>
			<option value="����">����</option>
			<option value="�Ϸ�">�Ϸ�</option>
			<option value="�ݷ�">�ݷ�</option>
			</select>
			<br/>
			<div align="center">
			<input class="button" type= "submit"  value="����">
			<button class="button"  type= "button"  onclick="close_Submit();">�ݱ�</button>
			</div>
			</div>

</fieldset>
</div>
</form>		
</body>
</html>