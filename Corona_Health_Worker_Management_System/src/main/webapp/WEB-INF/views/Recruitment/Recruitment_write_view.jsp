<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setCharacterEncoding("UTF-8"); %>
<%@ page import ="com.korea.itcen.DAO.*"  %>
<%@ page import ="com.korea.itcen.DTO.*"  %>
<%@ page import = "java.util.ArrayList" %>
 <%@ page errorPage = "Error/viewError.jsp" %>   
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  

    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script type="text/javascript" charset="UTF-8" src="${pageContext.request.contextPath}/resources/js/jquery-3.5.1.min.js"></script>
<script type="text/javascript" charset="UTF-8" src="${pageContext.request.contextPath}/resources/js/selectdistrict.js"></script>

<script>
function request_register(){
	if (document.recruit_write.rRecruitment_location_city_opt.value == "N" ){ 
		alert("지역과 직무를 정확하게 선택해야 합니다.");
		return;
	}
	
	if(document.recruit_write.rRecruitment_location_district_opt.value == "N" ){
		alert("지역과 직무를 정확하게 선택해야 합니다.");
		return;
		
	} 
	if(document.recruit_write.rRecruitment_necessary_job_opt.value == "N" ){
		alert("지역과 직무를 정확하게 선택해야 합니다.");
		return;
	} 
	

}
//var check = document.form;
//var status = "toolbar=no,directories=no,scrollbars=no,resizable=no,status=no,menubar=no,width=1000, height=1000, top=0,left=20"; 
//var url = 'recruitment_write_request_registerview.do?rRecruitment_location_city='+document.recruit_write.rRecruitment_location_city_opt.value+'&rRecruitment_location_district='+document.recruit_write.rRecruitment_location_district_opt.value+'&rRecruitment_necessary_job='+document.recruit_write.rRecruitment_necessary_job_opt.value;  
//window.open(url,'Recruitment_write_request_register.jsp',status);
function recruit_write(){
	
	if (document.recruit_write.rTitle.value.length == 0 ){ 
		alert("제목을 입력해주세요.");
		return;
	}
	
	
	if (document.recruit_write.rRecruitment_location_city_opt.value == "N" ){ 
		alert("지역과 직무를 정확하게 선택해야 합니다.");
		return;
	}
	
	if(document.recruit_write.rRecruitment_location_district_opt.value == "N" ){
		alert("지역과 직무를 정확하게 선택해야 합니다.");
		return;
		
	} 
	if(document.recruit_write.rRecruitment_necessary_job_opt.value == "N" ){
		alert("지역과 직무를 정확하게 선택해야 합니다.");
		return;
	} 
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
<!-- 테이블 속성 -->
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
	color: #000000;
	font-family: 휴먼엑스포;
	font-weight: normal;
	border: medium inset #F0F1F5;
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
.newStyle1 {
	background-color: #F0F1F5;
}
.auto-style7 {
	background-color: #F0F1F5;
}
.auto-style10 {
	color: #000000;
	font-family: 함초롬바탕;
	font-weight: normal;
	border-style: inset;
	border-width: medium;
	text-align: left;
}
.button2 {
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
.button1 {
    width:150px;
    background-color: #f0f1f5;
	border-style: inset;
    color:#000000;
    padding: 15px 0;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 15px;
	font-family: 휴먼엑스포;    
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
<form name="recruit_write"  method="get" accept-charset="utf-8"  action="manager_recruitment_write">
<div align="center">
<table class="type10" style="text-align: center; border-top-width: 0px; width: 1238px; border-bottom-width: 0px; height: 566px;" align="center">
  <thead>
  </thead>
  <tbody class="contents">
  <tr>
    <td class="auto-style7" style="width: 115px; height: 51px;">제목</td>
    <td class="auto-style8" style="height: 51px;" colspan="3"><input type="text" style="width: 100%; height: 100%" name="rTitle" id="rTitle" size="60"  required placeholder="EX) [공고]코로나-19 치료 대응 등을 위한 서울시 마포구 간호조무사 모집"></td>
  </tr>
  <tr>
    <td class="auto-style7" style="width: 115px; height: 51px;">모집직무</td>
    <td class="auto-style10" style="height: 51px;">
	<select name="rRecruitment_necessary_job_opt" id="rRecruitment_necessary_job_opt">
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
			<p style="font-size:7px;color:#999;"> *모집 직무는 모집공고 등록 후 수정이 불가합니다.</p>
	</td>
    <td class="auto-style7" style="height: 51px;">모집인원</td>
    <td class="auto-style10" style="height: 51px;"><input type="text"  name="rRecruitment_num_of_worker" id="rRecruitment_num_of_worker"  required></td>
  </tr>
  <tr>
    <td class="auto-style7" style="width: 115px; height: 51px;">지역</td>
    <td class="auto-style10" style="height: 51px;" colspan="3">
	<select name="rRecruitment_location_city_opt" id="rRecruitment_location_city_opt" onchange="citySelect(this.value);">
			<option value="N"> 선택하세요 </option>
			<c:forEach items="${city_list}" var="city">
				<option value="${city.location_city}">${city.location_city}</option>
			</c:forEach>
			</select>
			<select name="rRecruitment_location_district_opt" id="rRecruitment_location_district_opt">
			<option value="N"> 전체 </option>
			</select>
			<p style="font-size:7px;color:#999;"> *지역은 모집공고 등록 후 수정이 불가합니다.</p>
	</td>
  </tr>
  <tr>
    <td class="auto-style7" style="width: 115px">상세내용</td>
    <td class="auto-style8" colspan="3"><input type="text" name="rContents" id="rContents" value="${content_view.rContents}" style="width: 100%; height: 100%"></td>
  </tr>
  </tbody>
</table>
</div>
		<br/>
		<br/>
		<br/>
	<table class="type10" style="text-align: center; border-top-width: 0px; width: 1238px; border-bottom-width: 0px;" align="center">
  <thead>
  <tr>
    <th scope="cols" style="height: 15px;" class="auto-style4" colspan="10">
	<div class="auto-style5" style="left: 515px; top: 1px; width: 201px; background:#f0f1f5;"><span style="background:#f0f1f5; font-size:15px; color:#000000">상세 모집 기관</span></div></th>
  </tr>
  <tr>
  <th  scope="cols" style="width: 10px; height: 15px;" class="auto-style1">선택</th>
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
		<tbody id="request_place">
		<tr>
			<td colspan="10" align="center" class="auto-style1">지역과 직무를 선택해주세요</td>
		</tr>

		</tbody>
				<tr>
		<td colspan="10" class='auto-style1'>
		</tr>
		</table>
		<br/>
		
		<div align="center">
		<input class="button1" type="button" value="상세기관 선택하기" onclick="request_register(); requestSelect('rRecruitment_location_city_opt', 'rRecruitment_location_district_opt', 'rRecruitment_location_district_opt');">
		</div>
		<br/>
		<br/>
		<div align="center">
		<input class="button2" type="submit" value="등록하기">
		<button class="button2" type="button" onclick="javascript:window.location='manager_recruitment'">등록 취소</button>
		</div>

</form>
<%@ include file="footer.jsp" %>			
</body>
</html>