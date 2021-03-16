<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import ="com.korea.itcen.DAO.*"  %>
<%@ page import ="com.korea.itcen.DTO.*"  %>
<%@ page import = "java.util.ArrayList" %>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setCharacterEncoding("UTF-8"); %>
 <%@ page errorPage = "viewError.jsp" %>   

<% 
	ApplyDAO ApplyDao = new ApplyDAO();
	RequestDAO requestDao = new RequestDAO();
	LocationDAO locationDao = new LocationDAO();
	ArrayList<LocationDTO> city_selected = new ArrayList<LocationDTO>();

	ArrayList<RequestDTO> requestDao_list = null;
	ArrayList<RequestDTO> frequestDao_list = null;
	
 	
 	int pageSize = 10;
 	String pageNum = request.getParameter("pageNum");
	String IREQUEST_LOCATION_CITY= "";
	String IREQUEST_LOCATION_DISTRICT= "";
	String INECESSARY_JOB= "";
	
	if(request.getParameter("IREQUEST_LOCATION_CITY") == null) {
		IREQUEST_LOCATION_CITY = "N";
	} else {
		IREQUEST_LOCATION_CITY = request.getParameter("IREQUEST_LOCATION_CITY");
	}
	
	if(request.getParameter("IREQUEST_LOCATION_DISTRICT") == null){
		IREQUEST_LOCATION_DISTRICT = "N";
	} else {
		IREQUEST_LOCATION_DISTRICT = request.getParameter("IREQUEST_LOCATION_DISTRICT");
	}

	if(request.getParameter("INECESSARY_JOB") == null) {
		INECESSARY_JOB = "N";
	} else {
		INECESSARY_JOB = request.getParameter("INECESSARY_JOB");
	}

	
	
	if(pageNum == null){
 		pageNum = "1";
 	}
 	int currentPage = Integer.parseInt(pageNum);
 	int startRow = (currentPage - 1) * pageSize + 1;
 	int endRow = currentPage * pageSize;
 	int count = 0;
 	int fCount = 0;
 	
 	count = requestDao.request_getCount();
 	fCount = requestDao.request_getfCount(IREQUEST_LOCATION_CITY, IREQUEST_LOCATION_DISTRICT, INECESSARY_JOB);
 	
 	if(count > 0 && (("N").equals(IREQUEST_LOCATION_CITY)) && (("N").equals(IREQUEST_LOCATION_DISTRICT)) && (("N").equals(INECESSARY_JOB))) {
 		requestDao_list = requestDao.request_totallist(startRow, endRow);
 	}
 	if(fCount > 0) {
 		frequestDao_list = requestDao.request_list(startRow, endRow, IREQUEST_LOCATION_CITY, IREQUEST_LOCATION_DISTRICT, INECESSARY_JOB);
 	}
 	request.setAttribute("list", requestDao_list);
 	request.setAttribute("flist", frequestDao_list);
	city_selected = locationDao.locationDB_Call_City();
	request.setAttribute("city_list", city_selected);
 	
	String name = (String)session.getAttribute("name");
	String id = (String)session.getAttribute("id");

	System.out.println(IREQUEST_LOCATION_CITY);
	System.out.println(IREQUEST_LOCATION_DISTRICT);
	System.out.println(INECESSARY_JOB);
%>
<!-- 여기까지 list 불러오기 -->
<!-- 아래는 팝업창에서 값 받아오기 -->
 

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>모집공고</title>
<style>
.lnb li {
	list-style: none;
}

.lnb {
	background: #053863;
}

.lnb ul{
	width: 700px;
	margin: 0 auto;
	overflow: hidden;
}

.lnb ul li{
	float: left;
	width: 30%;
	height: 50px;
	line-height: 50px;
	text-align: center;
	color: #fff;
	background: #053863;
	
}

.lnb ul li a{
	display:block;
	text-decoration:none;
	color: #fff;
	
}


.lnb ul li a:hover{
	background: #000000;
	color: #fff;
}

<!-- 테이블 디자인 -->
table.type10 {
  border-collapse: collapse;
  text-align: left;
  line-height: 1.5;
  border-top: 1px solid #ccc;
  border-bottom: 1px solid #ccc;
  margin: 20px 10px;
  border-style: solid;
  border-radius: 1px;
  border-style: solid;
  font-size: small;

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
  vertical-align: middle;
}

.auto-style1 {
	color: #000000;
	font-family: 함초롬돋움;
	font-weight: normal;
	border-left-style: solid;
	border-left-width: 1px;
	border-right-style: solid;
	border-right-width: medium;
	border-top-style: solid;
	border-top-width: medium;
	border-bottom-style: solid;
	border-bottom-width: 1px;
}
.auto-style3 {
	border-style: solid;
	border-width: medium;
	font-weight: normal;
	color: #333333;
	font-family: 함초롬바탕;
}
.auto-style4 {
	font-size: small;
}
.auto-style5 {
	border-style: solid;
	border-width: medium;
	font-weight: bold;
	color: #333333;
	font-family: 함초롬바탕;
}

.button {
    width:120px;
    background-color: #476da2;
	border-style: inset;
    color:#fff;
    padding: 0 0;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 15px;
	font-family: 휴먼엑스포;    
    margin: 4px;
    cursor: pointer;
}

</style>
<script type="text/javascript" charset="UTF-8" src="${pageContext.request.contextPath}/resources/js/jquery-3.5.1.min.js"></script>
<script type="text/javascript" charset="UTF-8" src="${pageContext.request.contextPath}/resources/js/selectdistrict_request.js"></script>
<script>


	$(function(){
		$("form1").submit(function(){
			if($("#rRecruitment_necessary_job_opt").val() === "N" && $("#rRecruitment_location_city_opt").val() === "N" && $("#rRecruitment_location_district_opt").val() === "N"){
				alert("직무 또는 지역을 선택해주세요.");
				$("#rRecruitment_necessary_job_opt").focus();
				return false;
			}
		})
	})

	var openWin;
	
	function chk(){
		return true;	
	}
	
	// 팝업 형태로 사용하던 것. ajax 사용으로 미사용



</script>
</head>
<body>
<%@ include file="gnb_v4.jsp" %>
	<nav class="lnb">
				<ul>
					<li><a class="menuLink" href="manager_workermanagement.do">회원정보관리</a></li>
					<li><a class="menuLink" href="manager_recruitment.do">모집공고 관리</a></li>
					<li><a class="menuLink" href="manager_requestmanagement.do">파견신청관리</a></li>
				</ul>
	</nav>
	<br/>
	<br/>
	
	<form name=form1 method=get accept-charset="utf-8">

	<div class="buttons" align ="center" style="	font-family: 휴먼엑스포; ">
				<select name="INECESSARY_JOB" id="INECESSARY_JOB">
				<option value="N">선택하세요</option>
				<option value="일반간호사">일반간호사</option>
				<option value="임상전문간호사">임상전문간호사</option>
				<option value="간호조무사">간호조무사</option>
				<option value="공공의료인(군의료인 포함)">공공의료인(군의료인 포함)</option>
				<option value="내과의사">내과의사</option>
				<option value="대학생(간호대)">대학생(간호대)</option>
				<option value="대학생(의과대)">대학생(의과대)</option>
				<option value="대학생(기타 보건대)">대학생(기타 보건대)</option>
				<option value="방사선사">방사선사</option>
				<option value="요양보호사">요양보호사</option>
				<option value="임상병리사">임상병리사</option>
				<option value="타과목 의사">타과목 의사</option>
			</select>
			<select name="IREQUEST_LOCATION_CITY" id="IREQUEST_LOCATION_CITY" onchange="citySelect(this.value);">
			<option value="N"> 선택하세요 </option>
			<c:forEach items="${city_list}" var="city">
				<option value="${city.location_city}">${city.location_city}</option>
			</c:forEach>
			</select>
			<select name="IREQUEST_LOCATION_DISTRICT" id="IREQUEST_LOCATION_DISTRICT">
			<option value="N"> 전체 </option>
			</select>
			<input class="button" type= "submit" value="검색" onclick="javascript: form1.action='manager_requestmanagement';"/>
			
			<label id="change">상태변경: </label>&nbsp;
			<select name="iStatus_of_request" id="iStatus_of_request">
			<option value="N"> 선택하세요 </option>
			<option value="검토 중">검토 중</option>
			<option value="모집 가능">모집 가능</option>
			<option value="모집 완료">모집 완료</option>
			<option value="지원인력검토">지원인력검토</option>
			<option value="파견완료">파견완료</option>
			<option value="파견완료">반려</option>
			</select>
			<input class="button" type= "submit" value="변경" onclick="javascript: form1.action='manager_modify_status_of_request';"/>
			<input class="button" type="button" value="홈으로 돌아가기"onclick="javascript:window.location='main_view'">&nbsp;&nbsp;&nbsp;
	<br/>(총 파견요청 수: <%=count%> / 검색 요청 수: <%=fCount%> )<br/><br/>
	</div>
		
	<div>
	    <table class="type10" style="text-align: center; border-top-width: 0px; width: 1400px; border-bottom-width: 0px;" align="center">
  <thead>
  <tr class="auto-style4">
   <th scope="cols" style="width: 10px; height: 15px;" class="auto-style1"></th>
    <th scope="cols" style="width: 129px; height: 15px;" class="auto-style1">번호</th>
    <th scope="cols" style="width: 357px; height: 15px;" class="auto-style1">기관이름</th>
    <th scope="cols" style="width: 254px; height: 15px;" class="auto-style1">분류</th>
    <th scope="cols" style="width: 698px; height: 15px;" class="auto-style1">지역 </th>
    <th scope="cols" style="width: 475px; height: 15px;" class="auto-style1">	직무</th>
    <th scope="cols" style="width: 162px; height: 15px;" class="auto-style1">모집인원</th>
    <th scope="cols" style="width: 127px; height: 15px;" class="auto-style1">	근무<br />형태</th>
    <th scope="cols" style="width: 221px; height: 15px;" class="auto-style1">	근무<br />일수<br/>(개월)</th>
    <th scope="cols" style="width: 356px; height: 15px;" class="auto-style1">중환자실 <br />	근무</th>
    <th scope="cols" style="width: 300px; height: 15px;" class="auto-style1">	필요<br/>경력<br/>(개월)</th>
    <th scope="cols" style="width: 350px; height: 15px;" class="auto-style1">숙소<br/>제공<br/>여부</th>
    <th scope="cols" style="width: 332px; height: 15px;" class="auto-style1">담당자<br />	번호</th>
    <th scope="cols" style="width: 296px; height: 15px;" class="auto-style1">담당자<br />	이메일</th>
    <th scope="cols" style="width: 148px; height: 15px;" class="auto-style1">	비고</th>
    <th scope="cols" style="width: 306px; height: 15px;" class="auto-style1">상태</th>
  </tr>
  </thead>
  <tbody class="contents">
  <% 
			if(count > 0 && fCount == 0 && (("N").equals(IREQUEST_LOCATION_CITY)) && (("N").equals(IREQUEST_LOCATION_DISTRICT)) && (("N").equals(INECESSARY_JOB))) {
			
				for(int i = 0; i < requestDao_list.size(); i++) {
					RequestDTO requestDto = requestDao_list.get(i);
					
		%>
  
  <tr>
  <td class="auto-style3" style="width: 10px"><input type="checkbox" name="iIds" value="<%= requestDto.getiId() %>"></td>
    <td class="auto-style3" style="width: 129px"><%= requestDto.getiId() %></td>
    <td class="auto-style3" style="width: 357px"><%= requestDto.getiInstitution_name() %></td>
    <td class="auto-style3" style="width: 254px"><%= requestDto.getiInstitution_classification() %></td>
    <td class="auto-style3" style="width: 748px"><%= requestDto.getiRequest_location_city() %> <%= requestDto.getiRequest_location_district() %></td>
    <td class="auto-style3" style="width: 475px"><%= requestDto.getiNecessary_Job() %></td>
    <td class="auto-style3" style="width: 162px"><%= requestDto.getiNecessary_numbers_of_worker() %></td>
    <td class="auto-style3" style="width: 305px"><%= requestDto.getiWork_type() %></td>
    <td class="auto-style3" style="width: 271px"><%= requestDto.getiWork_period() %>개월</td>
    <td class="auto-style3" style="width: 356px"><%= requestDto.getiNeed_ICU() %></td>
    <td class="auto-style3" style="width: 311px"><%= requestDto.getiNecessary_carrer_years() %></td>
    <td class="auto-style3" style="width: 350px"><%= requestDto.getiAccomodation_Availability() %>    </td>
    <td class="auto-style3" style="width: 150px"><%= requestDto.getiRepresentative_number() %></td>
    <td class="auto-style3" style="width: 200px"><%= requestDto.getiRepresentative_email() %></td>
     <% if(requestDto.getiRemarks() == null) { %>
    <td class="auto-style3" style="width: 148px">없음</td>
    <% } else{ %>
   <td class="auto-style3" style="width: 148px"> <%= requestDto.getiRemarks() %></td>
   <%} %>
    <td class="auto-style3" style="width: 306px"><%= requestDto.getiStatus_of_request() %></td>
    
  </tr>
  		<%
				}
			} else if(count == 0) {
		%>
		
		<tr>
			<td class="auto-style3" colspan="17" align="center"> 파견요청이 없습니다. </td>
		</tr>
	<%
			} else if (count > 0 && fCount != 0){
				for(int i = 0; i < frequestDao_list.size(); i++) {
					RequestDTO requestDto = frequestDao_list.get(i); 
	
				
		%>	
		  <tr>
  <td class="auto-style3" style="width: 10px"><input type="checkbox" name="iIds" value="<%= requestDto.getiId() %>"></td>
    <td class="auto-style3" style="width: 129px"><%= requestDto.getiId() %></td>
    <td class="auto-style3" style="width: 357px"><%= requestDto.getiInstitution_name() %></td>
    <td class="auto-style3" style="width: 254px"><%= requestDto.getiInstitution_classification() %></td>
    <td class="auto-style3" style="width: 748px"><%= requestDto.getiRequest_location_city() %> <%= requestDto.getiRequest_location_district() %></td>
    <td class="auto-style3" style="width: 475px"><%= requestDto.getiNecessary_Job() %></td>
    <td class="auto-style3" style="width: 162px"><%= requestDto.getiNecessary_numbers_of_worker() %></td>
    <td class="auto-style3" style="width: 305px"><%= requestDto.getiWork_type() %></td>
    <td class="auto-style3" style="width: 271px"><%= requestDto.getiWork_period() %>개월</td>
    <td class="auto-style3" style="width: 356px"><%= requestDto.getiNeed_ICU() %></td>
    <td class="auto-style3" style="width: 311px"><%= requestDto.getiNecessary_carrer_years() %></td>
    <td class="auto-style3" style="width: 350px"><%= requestDto.getiAccomodation_Availability() %>    </td>
    <td class="auto-style3" style="width: 150px"><%= requestDto.getiRepresentative_number() %></td>
    <td class="auto-style3" style="width: 200px"><%= requestDto.getiRepresentative_email() %></td>
     <% if(requestDto.getiRemarks() == null) { %>
    <td class="auto-style3" style="width: 148px">없음</td>
    <% } else{ %>
   <td class="auto-style3" style="width: 148px"> <%= requestDto.getiRemarks() %></td>
   <%} %>
    <td class="auto-style3" style="width: 350px"><%= requestDto.getiStatus_of_request() %></td>
    
  </tr>
  	
		<%
				}	
			} else {
		
		%>
		
		<tr>
   <td class="auto-style3" style="width: 148px">없음</td>
		</tr>
		<%
			}
		%>
		
		<tr>
			<td class="auto-style3" colspan="17" align="center">
			<%
			
				if(count >0 && fCount == 0 && (("N").equals(IREQUEST_LOCATION_CITY)) && (("N").equals(IREQUEST_LOCATION_DISTRICT)) && (("N").equals(INECESSARY_JOB))) {
					// 총 페이지 수
					int pageCount = count / pageSize + (count%pageSize == 0 ? 0 : 1);
					// 한 페이지에 보여줄 페이지 블럭(링크 수)
					int pageBlock = 10;
					// 한 페이지에 보여줄 시작 및 끝 번호
					int startPage = ((currentPage-1)/pageBlock)*pageBlock+1;
					int endPage = startPage + pageBlock - 1;
					// 마지막 페이지가 총 페이지 수보다 크면 endpage를 pagecount로 할당
					if(endPage > pageCount) {
						endPage = pageCount;
					}
					// 페이지 블록수보다 startPage가 클 경우 이전 링크 생성
					if(startPage > pageBlock) {
						%>
						<a href="manager_requestmanagement?pageNum=<%=startPage - 10 %>">[이전]</a>
					<% 
					}
						
						for(int i=startPage; i <= endPage; i++){
							if(i == currentPage){
						
					%>
							[<%=i %>]
			
					<% } else {
						
					%>
						<a href="manager_requestmanagement?pageNum=<%=i%>">[<%=i %>]</a>	
					<% }
						}
						if(endPage < pageCount){
							%>
							<a href="manager_requestmanagement?pageNum=<%=startPage + 10%>">[다음]</a>
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
					
					<a href="manager_requestmanagement?pageNum=<%=startPage - 10%>&IREQUEST_LOCATION_CITY=<%=IREQUEST_LOCATION_CITY%>&IREQUEST_LOCATION_DISTRICT=<%=IREQUEST_LOCATION_DISTRICT%>&INECESSARY_JOB=<%=INECESSARY_JOB%>">[이전]</a>
					
					<%
					
					}
					
					for(int i = startPage; i <= endPage; i++){
						if(i == currentPage){
					%>
						[<%=i%>]
					<% 		
						}else{
					%>
						<a href="manager_requestmanagement?pageNum=<%=i%>&IREQUEST_LOCATION_CITY=<%=IREQUEST_LOCATION_CITY%>&IREQUEST_LOCATION_DISTRICT=<%=IREQUEST_LOCATION_DISTRICT%>&INECESSARY_JOB=<%=INECESSARY_JOB%>">[<%=i%>]</a>
						
					<% 
						}
					
					}
					if(endPage < pageCount){
			%>	
						<a href="manager_requestmanagement?pageNum=<%=startPage + 10%>&&IREQUEST_LOCATION_CITY=<%=IREQUEST_LOCATION_CITY%>&IREQUEST_LOCATION_DISTRICT=<%=IREQUEST_LOCATION_DISTRICT%>&INECESSARY_JOB=<%=INECESSARY_JOB%>">[다음]</a>
					
			<% 
			
					}
				}
			
			
			%>
		
	</td>
	</tr>
   </tbody>
</table>
	</div>
		
<%@ include file="footer.jsp" %>		
</form>
</body>
</html>