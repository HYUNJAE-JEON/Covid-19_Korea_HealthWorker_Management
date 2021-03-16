<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setCharacterEncoding("UTF-8"); %>
<%@ page import ="com.korea.itcen.DAO.*"  %>
<%@ page import ="com.korea.itcen.DTO.*"  %>
<%@ page import = "java.util.ArrayList" %>
 <%@ page errorPage = "viewError.jsp" %>   
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<%
		


	int rId = Integer.parseInt(request.getParameter("rId"));
	
	LocationDAO locationDao = new LocationDAO();
	ArrayList<LocationDTO> city_selected = new ArrayList<LocationDTO>();
	RecruitmentDAO recruitmentDao = new RecruitmentDAO();
	RecruitmentDTO recruitmentDto = null;
	ArrayList<RequestDTO> requestDto = null;
	RequestDAO requestDao = new RequestDAO();
	
	city_selected = locationDao.locationDB_Call_City();
	request.setAttribute("city_list", city_selected);

	recruitmentDto = recruitmentDao.get_Recruitment_for_apply(rId);
	request.setAttribute("content_view", recruitmentDto);

	int IRecruitment_post_number = recruitmentDto.getrId();	
	requestDto = requestDao.getRequest(IRecruitment_post_number);
	request.setAttribute("request_view", requestDto);

	
	
%>    
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script type="text/javascript" charset="UTF-8" src="${pageContext.request.contextPath}/resources/js/jquery-3.5.1.min.js"></script>
<script language = "javascript">

function open_request(arg1, arg2, arg3, arg4){
	var check = document.form;
	var status = "toolbar=no,directories=no,scrollbars=no,resizable=no,status=no,menubar=no,width=1000, height=300, top=0,left=20"; 
	var url = 'manager_recruitment_modify_request_view?rRecruitment_location_city='+arg1+'&rRecruitment_location_district='+arg2+'&rRecruitment_necessary_job='+arg3+'&rId='+arg4;
	window.open(url,'Recruitment_request_modify.jsp',status);
} 

</script>
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
<!--테이블 속성 -->

table.type10 {
  border-collapse: collapse;
  text-align: left;
  line-height: 1.5;
  border-top: 1px solid #ccc;
  border-bottom: 1px solid #ccc;
  margin: 20px 10px;
  border-style: solid;
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
	font-family: 휴먼엑스포;
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

.contents {
	border-style: dotted;
}
.auto-style4 {
	color: #000000;
	font-family: 휴먼엑스포;
	font-weight: normal;
	border-left-style: solid;
	border-left-width: 1px;
	border-right-style: solid;
	border-right-width: medium;
	border-top-style: solid;
	border-top-width: medium;
	border-bottom-style: solid;
	border-bottom-width: 1px;
	text-align: right;
}
.auto-style5 {
	position: relative;
	text-align: center;
}
.auto-style7 {
	border-style: solid;
	border-width: medium;
	color: #000000;
	font-family: 휴먼엑스포;
	font-weight: normal;
}
.type10 {
	border-style: solid;
	border-radius: 1px;
}
.type10 {
	border-style: solid;
}
.auto-style7 {
	border-style: inset;
}
.auto-style8 {
	color: #000000;
	font-family: 함초롬바탕;
	font-weight: normal;
	border-style: inset;
	border-width: medium;
}
.auto-style10 {
	color: #000000;
	font-family: 함초롬바탕;
	font-weight: normal;
	border-style: inset;
	border-width: medium;
	text-align: left;
}
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
<form name=form method="get" accept-charset="utf-8" action="manager_recruitment_modify">
<div>
<table class="type10" style="text-align: center; border-top-width: 0px; width: 1238px; border-bottom-width: 0px; height: 566px;" align="center">
  <thead>
  <tr>
    <th scope="cols" style="width: 53px; height: 27px;" class="auto-style7">번호</th>
    <th scope="cols" style="width: 119px; height: 27px;" class="auto-style8"> <input type="hidden" name="rId" value="${content_view.rId}">${content_view.rId} </th>
    <th scope="cols" style="width: 89px; height: 27px;" class="auto-style7">조회수</th>
    <th scope="cols" style="width: 153px; height: 27px;" class="auto-style8"> ${content_view.rHit}</th>
    <th scope="cols" style="width: 178px; height: 27px;" class="auto-style7">지역<p style="font-size:7px;color:#999;"> *지역 변경은 불가합니다.</p></th>
    <th scope="cols" style="width: 178px; height: 27px;" class="auto-style8"> ${content_view.rRecruitment_location_city}&nbsp; ${content_view.rRecruitment_location_district} </th>
    <th scope="cols" style="width: 178px; height: 27px;" class="auto-style7">모집직무<p style="font-size:7px;color:#999;"> *모집 직무 변경은 불가합니다.</p></th>
    <th scope="cols" style="width: 191px; height: 27px;" class="auto-style8">${content_view.rRecruitment_necessary_job}</th>
  </tr>
  </thead>
  <tbody class="contents">
  <tr>
    <td class="auto-style7" style="width: 53px; height: 15px;">제목</td>
    <td class="auto-style10" style="height: 15px;" colspan="7"><input type="text" name="rTitle" id="rTitle" size="60" value="${content_view.rTitle}" style="width: 100%; height: 100%"></td>
  </tr>
	<tr>
		<td class="auto-style7" style="width: 53px; height: 15px;"> 모집인원 </td>
		<td class="auto-style10" style="height: 15px;" colspan="7"><input type="text"  name="rRecruitment_num_of_worker" id="rRecruitment_num_of_worker" value="${content_view.rRecruitment_num_of_worker}"> </td>
	</tr>
  <tr>
    <td class="auto-style7" style="width: 53px">상세<br />내용</td>
    <td class="auto-style10" colspan="7"> <input type="text" name="rContents" id="rContents" value="${content_view.rContents}" style="width: 100%; height: 100%"></td>
  </tr>
  </tbody>
</table>
</div>
<div>
		<br/>
		<br/>
		<br/>
	<table class="type10" style="text-align: center; border-top-width: 0px; width: 1238px; border-bottom-width: 0px;" align="center">
  <thead>
  <tr>
    <th scope="cols" style="height: 15px;" class="auto-style4" colspan="9">
	<div class="auto-style5" style="left: 515px; top: 1px; width: 201px; background:#f0f1f5;"><span style="background:#f0f1f5; font-size:15px; color:#000000">상세 모집 기관</span></div></th>
  </tr>
  <tr>
    <th scope="cols" style="width: 130px; height: 15px;" class="auto-style1">번호</th>
    <th scope="cols" style="width: 458px; height: 15px;" class="auto-style1">기관	이름</th>
    <th scope="cols" style="width: 232px; height: 15px;" class="auto-style1">기관분류</th>
    <th scope="cols" style="width: 121px; height: 15px;" class="auto-style1">모집<br />인원</th>
    <th scope="cols" style="width: 190px; height: 15px;" class="auto-style1">최소근무<br />기간(월)</th>
    <th scope="cols" style="width: 228px; height: 15px;" class="auto-style1">근무형태</th>
    <th scope="cols" style="width: 223px; height: 15px;" class="auto-style1">중환자실 <br />	근무여부</th>
    <th scope="cols" style="width: 168px; height: 15px;" class="auto-style1">숙소	<br />제공 여부</th>
    <th scope="cols" style="width: 178px; height: 15px;" class="auto-style1">비고</th>
  </tr>
  </thead>
  <tbody class="contents">
		<c:forEach items="${request_view}" var="requestDto">
		<tr>
			<td class="auto-style3" style="width: 130px">${requestDto.iId}</td>
			 <td class="auto-style3" style="width: 458px">${requestDto.iInstitution_name}</td>
			<td class="auto-style3" style="width: 232px">${requestDto.iInstitution_classification}</td>
			<td class="auto-style3" style="width: 121px">${requestDto.iNecessary_numbers_of_worker}</td>
			<td class="auto-style3" style="width: 190px">${requestDto.iWork_period}</td>
			<td class="auto-style3" style="width: 228px">${requestDto.iWork_type}</td>
			<td class="auto-style3" style="width: 223px">${requestDto.iNeed_ICU}</td>
			<td class="auto-style3" style="width: 168px">${requestDto.iAccomodation_Availability}</td>
			<td class="auto-style3" style="width: 178px">${requestDto.iRemarks}</td>
		</tr>
		</c:forEach>
  </tbody>
		<tr>
		<td class="auto-style3" colspan="9">
		<input class="button" type="button" name="modify_request" onclick="open_request('${content_view.rRecruitment_location_city}','${content_view.rRecruitment_location_district}', '${content_view.rRecruitment_necessary_job}', '${content_view.rId}')" value="상세 기관 수정하기 ">
		</td>
		</tr>
		</table>
		</div>
		<br/>
		<div id="button" align="center">
		<input class="button" type="submit" value="수정하기">
		<button class="button" type="button"  onclick="javascript:window.location='manager_recruitment_content_view?rId=${content_view.rId}'">취소</button>
		</div>
		

</form>
<%@ include file="footer.jsp" %>			
</body>
</html>