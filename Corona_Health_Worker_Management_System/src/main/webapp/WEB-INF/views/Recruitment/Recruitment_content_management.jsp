<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setCharacterEncoding("UTF-8"); %>
<%@ page import ="com.korea.itcen.DAO.*"  %>
<%@ page import ="com.korea.itcen.DTO.*"  %>
 <%@ page errorPage = "viewError.jsp" %>   
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
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
<script type="text/javascript" charset="UTF-8" src="${pageContext.request.contextPath}/resources/js/jquery-3.5.1.min.js"></script>
<script type="text/javascript" charset="UTF-8" src="${pageContext.request.contextPath}/resources/js/selectdistrict.js"></script>
<script language = "javascript">

function open_worker(arg1, arg2){
	var check = document.form;
	var status = "toolbar=no,directories=no,scrollbars=no,resizable=no,status=no,menubar=no,width=1000, height=500, top=0,left=20"; 
	var url = 'manager_workerlist_of_request_view?iInstitution_name='+arg1+'&iId='+arg2;
	window.open(url,'Worker_list_confirm.jsp',status);
} 

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
<form name=form method="get" accept-charset="utf-8">
<div align="center" style="font-family: 휴먼모음T;"><br/>(총 모집인원: ${content_view.rRecruitment_num_of_worker}명 / 현재까지 지원자 수:  ${applycount}명 )</div>
<br/><br/>
					
<div>
<table class="type10" style="text-align: center; border-top-width: 0px; width: 1238px; border-bottom-width: 0px; height: 566px;" align="center">
  <thead>
  <tr>
    <th scope="cols" style="width: 53px; height: 27px;" class="auto-style7">번호</th>
    <th scope="cols" style="width: 119px; height: 27px;" class="auto-style8"> <input type="hidden" name="rId" value="${content_view.rId}">${content_view.rId} </th>
    <th scope="cols" style="width: 89px; height: 27px;" class="auto-style7">조회수</th>
    <th scope="cols" style="width: 153px; height: 27px;" class="auto-style8"> ${content_view.rHit}</th>
    <th scope="cols" style="width: 178px; height: 27px;" class="auto-style7">지역</th>
    <th scope="cols" style="width: 178px; height: 27px;" class="auto-style8"> ${content_view.rRecruitment_location_city}&nbsp; ${content_view.rRecruitment_location_district} </th>
    <th scope="cols" style="width: 178px; height: 27px;" class="auto-style7">모집직무</th>
    <th scope="cols" style="width: 191px; height: 27px;" class="auto-style8">${content_view.rRecruitment_necessary_job}</th>
  </tr>
  </thead>
  <tbody class="contents">
  <tr>
    <td class="auto-style7" style="width: 53px; height: 15px;">제목</td>
    <td class="auto-style8" style="height: 15px;" colspan="7">${content_view.rTitle}</td>
  </tr>
  <tr>
    <td class="auto-style7" style="width: 53px">상세<br />내용</td>
    <td class="auto-style8" colspan="7">${content_view.rContents}</td>
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
    <th scope="cols" style="height: 15px;" class="auto-style4" colspan="10">
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
    <th scope="cols" style="width: 108px; height: 15px;" class="auto-style1">비고</th>
    <th scope="cols" style="width: 178px; height: 15px;" class="auto-style1">	파견<br />	신청자 <br />확인</th>

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
			<td class="auto-style3" style="width: 108px">${requestDto.iRemarks}</td>
   			 <td class="auto-style3" style="width: 178px"><button type="button" onclick="open_worker('${requestDto.iInstitution_name}','${requestDto.iId}');">파견신청자<br/>확인</button></td>
		</tr>
		</c:forEach>
  </tbody>
</table>
		<br/>
		<br/>
		<br/>
</div>
				<div class="buttons" align="center">
		<button class="button" type="button" name="recruitment_modify" onclick="javascript:window.location='manager_recruitment_modify_view?rId=${content_view.rId}'">수정하기</button>
		<button class="button"  type="button" name="recruitment_delete" onclick="javascript:window.location='manager_recruitment_delete?rId=${content_view.rId}'">삭제하기</button>
		<button class="button"  type="button" name="recruitment_end" onclick="javascript:window.location='manager_recruitment_end?rId=${content_view.rId}'">마감하기</button>
		<button class="button"  type="button" name="recruitment_list" onclick="javascript:window.location='manager_recruitment'">목록으로 돌아가기</button>
		</div>
<%@ include file="footer.jsp" %>	
</form>
</body>
</html>