<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import ="com.korea.itcen.DAO.*"  %>
<%@ page import ="com.korea.itcen.DTO.*"  %>
<%@ page import = "java.util.ArrayList" %>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setCharacterEncoding("UTF-8"); %>
 <%@ page errorPage = "viewError.jsp" %>   
<% if(session.getAttribute("ValidMem") == null) {%>
 <%@ page errorPage = "viewError.jsp" %>   



	<jsp:forward page="login_view"></jsp:forward>

<% }



	RecruitmentDAO recruitmentDao = new RecruitmentDAO();
	LocationDAO locationDao = new LocationDAO();
	ArrayList<LocationDTO> city_selected = new ArrayList<LocationDTO>();

	ArrayList<RecruitmentDTO> recruitmentDto = null;
	ArrayList<RecruitmentDTO> frecruitmentDto = null;

 	
 	int pageSize = 10;
 	String pageNum = request.getParameter("pageNum");
	String rRecruitment_location_city_opt= "";
	String rRecruitment_location_district_opt= "";
	String rRecruitment_necessary_job_opt= "";
	
	if(request.getParameter("rRecruitment_location_city_opt") == null) {
		rRecruitment_location_city_opt = "N";
	} else {
		rRecruitment_location_city_opt = request.getParameter("rRecruitment_location_city_opt");
	}
	
	if(request.getParameter("rRecruitment_location_district_opt") == null){
		rRecruitment_location_district_opt = "N";
	} else {
		rRecruitment_location_district_opt = request.getParameter("rRecruitment_location_district_opt");
	}

	if(request.getParameter("rRecruitment_necessary_job_opt") == null) {
		rRecruitment_necessary_job_opt = "N";
	} else {
		rRecruitment_necessary_job_opt = request.getParameter("rRecruitment_necessary_job_opt");
	}

	
	
	if(pageNum == null){
 		pageNum = "1";
 	}
 	int currentPage = Integer.parseInt(pageNum);
 	int startRow = (currentPage - 1) * pageSize + 1;
 	int endRow = currentPage * pageSize;
 	int count = 0;
 	int fCount = 0;
 	fCount = recruitmentDao.getfCount(rRecruitment_location_city_opt, rRecruitment_location_district_opt, rRecruitment_necessary_job_opt);
 	count = recruitmentDao.getCount();
 	if(count > 0 && (("N").equals(rRecruitment_location_city_opt)) && (("N").equals(rRecruitment_location_district_opt)) && (("N").equals(rRecruitment_necessary_job_opt))) {
 		recruitmentDto = recruitmentDao.totallist(startRow, endRow);
 	}
 	if(fCount > 0) {
 		frecruitmentDto = recruitmentDao.list(startRow, endRow, rRecruitment_location_city_opt, rRecruitment_location_district_opt, rRecruitment_necessary_job_opt);
 	}
 	request.setAttribute("list", recruitmentDto);
 	request.setAttribute("flist", frecruitmentDto);
	city_selected = locationDao.locationDB_Call_City();
	request.setAttribute("city_list", city_selected);
 	
	String name = (String)session.getAttribute("name");
	String id = (String)session.getAttribute("id");

	System.out.println(rRecruitment_location_city_opt);
	System.out.println(rRecruitment_location_district_opt);
	System.out.println(rRecruitment_necessary_job_opt);

%>
<!-- ???????? list ???????? -->
<!-- ?????? ?????????? ?? ???????? -->
 

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>????????</title>
<script type="text/javascript" charset="UTF-8" src="${pageContext.request.contextPath}/resources/js/jquery-3.5.1.min.js"></script>
<script type="text/javascript" charset="UTF-8" src="${pageContext.request.contextPath}/resources/js/selectdistrict_worker.js"></script>
<script>


	

	var openWin;
	
	function chk(){
		return true;	
	}
	
	// ???? ?????? ???????? ??. ajax ???????? ??????
<!--	function city_check(){
		var check = document.form1;
		var status = "toolbar=no,directories=no,scrollbars=no,resizable=no,status=no,menubar=no,width=330, height=20, top=0,left=20"; 
		window.open('','POP',status);
		check.action="District.jsp";
		check.target='POP';
		check.submit();
	} -->
	
	

</script>
<style>
.middle_title{
	text-align:center;
}

.middle_title h2{
	background:#053863;
	color:#fff;
	font-size:15px;
	font-weight:normal;
	padding:10px 0;
	letter-spacing:10px;
	font-family: ??????????;
}
table.type10 {
  border-collapse: collapse;
  text-align: left;
  line-height: 1.5;
  border-top: 1px solid #ccc;
  border-bottom: 1px solid #ccc;
  margin: 20px 10px;
  border-style: none none double none;
}
table.type10 thead th {
  width: 150px;
  padding: 10px;
  font-weight: bold;
  vertical-align: top;
  
  background: #f0f1f5;
  margin: 20px 10px;
}
table.type10 td {
  width: 350px;
  padding: 10px;
  vertical-align: top;
}
.auto-style1 {
	color: #000000;
	font-family: ??????????;
	font-weight: normal;
	border-left-style: solid;
	border-left-width: 1px;
	border-right-style: none;
	border-right-width: medium;
	border-top-style: none;
	border-top-width: medium;
	border-bottom-style: solid;
	border-bottom-width: 1px;
}
.auto-style3 {
	border-style: none;
	border-width: medium;
	font-weight: normal;
	color: #333333;
	font-family: ????????T;
}

.select {
	font-family: ??????????;
}

.button {
    width:60px;
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
<%@ include file="gnb.jsp" %>
<div class="middle_title">
	<h2 class="auto-style7">???????? ??????</h2>
</div>
	<form name=form1  id= form1 method=get action="worker_recruitment_view" accept-charset="utf-8">
<div class = "main_table" align="center">	

	<div class="select"  align="right" style="display: inline-block;" >
			????????: <select name="rRecruitment_necessary_job_opt" id="rRecruitment_necessary_job_opt">
				<option value="N">??????????</option>
				<option value="??????????">??????????</option>
				<option value="??????????????">??????????????</option>
				<option value="??????????">??????????</option>
				<option value="??????????(???????? ????)">??????????(???????? ????)</option>
				<option value="????????">????????</option>
				<option value="??????(??????)">??????(??????)</option>
				<option value="??????(??????)">??????(??????)</option>
				<option value="??????(???? ??????)">??????(???? ??????)</option>
				<option value="????????">????????</option>
				<option value="??????????">??????????</option>
				<option value="??????????">??????????</option>
				<option value="?????? ????">?????? ????</option>
			</select>
			????????: <select name="rRecruitment_location_city_opt" id="rRecruitment_location_city_opt" onchange="citySelect(this.value);">
			<option value="N"> ?????????? </option>
			<c:forEach items="${city_list}" var="city">
				<option value="${city.location_city}">${city.location_city}</option>
			</c:forEach>
			</select>
			<select name="rRecruitment_location_district_opt" id="rRecruitment_location_district_opt">
			<option value="N"> ???? </option>
			</select> &nbsp;<input class="button" type="submit" value="????"><br/><br/>

	</div>


<table class="type10" style="text-align: center; border-top-width: 0px; width: 1238px; border-bottom-width: 0px;">		<tr>
<thead>
  <tr>
    <th  style="width: 81px; height: 15px;" class="auto-style1">????</th>
    <th  style="width: 615px; height: 15px;" class="auto-style1">????????</th>
    <th  style="width: 89px; height: 15px;" class="auto-style1">??????</th>
    <th  style="width: 133px; height: 15px;" class="auto-style1">????</th>
    <th  style="width: 178px; height: 15px;" class="auto-style1">??????</th>
  </tr>
  </thead>
  <tbody class="contents">

		
		<% 
			if(count > 0 && fCount == 0 && (("N").equals(rRecruitment_location_city_opt)) && (("N").equals(rRecruitment_location_district_opt)) && (("N").equals(rRecruitment_necessary_job_opt))) {
				for(int i = 0; i < recruitmentDto.size(); i++) {
					RecruitmentDTO recruitment = recruitmentDto.get(i);
					if (recruitment.getrId() == 0) continue;
					
		%>
		
		<tr>
			<td class="auto-style3" style="width: 81px"><%= recruitment.getrId() %></td>
			<td class="auto-style3" style="width: 615px"><a href="worker_recruitment_content_view?rId=<%= recruitment.getrId() %>&pageNum=<%=currentPage%>"><%=recruitment.getrTitle() %></a></td>
			<td class="auto-style3" style="width: 89px"><%= recruitment.getrHit() %></td>
			<td class="auto-style3" style="width: 133px"><%= recruitment.getrStatus_of_recruitment() %> </td>
			<td class="auto-style3" style="width: 178px"><%= recruitment.getrUpload_date() %></td>

		</tr>	
		</tbody>
		
		<%
				}
			} else if(count == 0) {
		%>
		
		<tr>
			<td class="auto-style3" colspan="5" align="center"> ???????? ????????. </td>
		</tr>
		</tbody>
		<%
			} else if (count > 0 && fCount != 0){
				for(int i = 0; i < frecruitmentDto.size(); i++) {
					RecruitmentDTO recruitment = frecruitmentDto.get(i); 
					if (recruitment.getrId() == 0) continue;

		%>
		<tr>
			<td class="auto-style3" style="width: 81px"><%= recruitment.getrId() %></td>
			<td class="auto-style3" style="width: 615px"><a href="worker_recruitment_content_view?rId=<%= recruitment.getrId() %>&pageNum=<%=currentPage%>"><%=recruitment.getrTitle() %></a></td>
			<td class="auto-style3" style="width: 89px"><%= recruitment.getrHit() %></td>
			<td class="auto-style3" style="width: 133px"><%= recruitment.getrStatus_of_recruitment() %> </td>
			<td class="auto-style3" style="width: 178px"><%= recruitment.getrUpload_date() %></td>
		</tr>
		</tbody>
		<%
				}
			} else {
		
		%>
		
		<tr>
			<td class="auto-style3" colspan="5" align="center"> ???????? ????????. </td>
		</tr>
		</tbody>
		<%
			}
		%>
		
		<tr>
			<td colspan="5">

			
			<!-- <input type ="button" name="district_select" id="district_select" value="???? ???? ????" onclick="city_check();">	-->
			

			<!-- <select name="rRecruitment_location_district_opt" id="rRecruitment_location_district_opt" disabled onchange="rDistrict_view()">
			<option value="N"> ?????????? </option>
			<c:forEach items="${district_list}" var="district">
			<option value="${district.location_district}">${district.location_district}</option>
			</c:forEach>
			</select>  -->
		
		</td>
		<tr>
			<td colspan="5" align="center">
			<%
			
				if(count >0 && fCount == 0 && (("N").equals(rRecruitment_location_city_opt)) && (("N").equals(rRecruitment_location_district_opt)) && (("N").equals(rRecruitment_necessary_job_opt))) {
					// ?? ?????? ??
					int pageCount = count / pageSize + (count%pageSize == 0 ? 0 : 1);
					// ?? ???????? ?????? ?????? ????(???? ??)
					int pageBlock = 10;
					// ?? ???????? ?????? ???? ?? ?? ????
					int startPage = ((currentPage-1)/pageBlock)*pageBlock+1;
					int endPage = startPage + pageBlock - 1;
					// ?????? ???????? ?? ?????? ?????? ???? endpage?? pagecount?? ????
					if(endPage > pageCount) {
						endPage = pageCount;
					}
					// ?????? ?????????? startPage?? ?? ???? ???? ???? ????
					if(startPage > pageBlock) {
						%>
						<a href="worker_recruitment_view?pageNum=<%=startPage - 10 %>">[????]</a>
					<% 
					}
						
						for(int i=startPage; i <= endPage; i++){
							if(i == currentPage){
						
					%>
							[<%=i %>]
			
					<% } else {
						
					%>
						<a href="worker_recruitment_view?pageNum=<%=i%>">[<%=i %>]</a>	
					<% }
						}
						if(endPage < pageCount){
							%>
							<a href="worker_recruitment_view?pageNum=<%=startPage + 10%>">[????]</a>
						<% 
						
						}
				} else if(fCount >0) {
					int pageCount = fCount / pageSize + (fCount%pageSize == 0 ? 0 : 1);
					int pageBlock = 10;
					
					int startPage = ((currentPage-1)/pageBlock)*pageBlock+1;
					int endPage = startPage + pageBlock - 1;
					
					if(endPage > pageCount){
						endPage = pageCount;
					}
					
					if(startPage > pageBlock){
					%>	
					
					<a href="worker_recruitment_view?pageNum=<%=startPage - 10%>&rRecruitment_necessary_job_opt=<%=rRecruitment_necessary_job_opt%>&rRecruitment_location_city_opt=<%=rRecruitment_location_city_opt%>&rRecruitment_location_district_opt=<%=rRecruitment_location_district_opt%>">[????]</a>
					
					<%
					
					}
					
					for(int i = startPage; i <= endPage; i++){
						if(i == currentPage){
					%>
						[<%=i%>]
					<% 		
						}else{
					%>
						<a href="worker_recruitment_view?pageNum=<%=i%>&rRecruitment_necessary_job_opt=<%=rRecruitment_necessary_job_opt%>&rRecruitment_location_city_opt=<%=rRecruitment_location_city_opt%>&rRecruitment_location_district_opt=<%=rRecruitment_location_district_opt%>">[<%=i%>]</a>
						
					<% 
						}
					
					}
					if(endPage < pageCount){
			%>	
						<a href="worker_recruitment_view?pageNum=<%=startPage + 10%>&rRecruitment_necessary_job_opt=<%=rRecruitment_necessary_job_opt%>&rRecruitment_location_city_opt=<%=rRecruitment_location_city_opt%>&rRecruitment_location_district_opt=<%=rRecruitment_location_district_opt%>">[????]</a>
					
			<% 
			
					}
				}
			
			
			%>
	</td>
	</tr>
	</table>
	</div>
	<div align="center">

</div>
<%@ include file="footer.jsp" %>

</form>
</body>
</html>