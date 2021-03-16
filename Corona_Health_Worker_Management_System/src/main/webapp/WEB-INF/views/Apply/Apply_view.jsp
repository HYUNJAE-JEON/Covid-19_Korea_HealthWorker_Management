<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
 <%@ page errorPage = "viewError.jsp" %>   
 <% request.setCharacterEncoding("UTF-8"); %>
<% response.setCharacterEncoding("UTF-8"); %>
<% 

	String name = (String)session.getAttribute("name");
	String id = (String)session.getAttribute("id");
	int x = 0;
	int apply_count = 0;
	if(request.getAttribute("apply_count") == null){
		apply_count = 0;	
	} else{
	x = Integer.parseInt(request.getAttribute("apply_count").toString());
	
	apply_count = x;
	}
	
	
%>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
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
	font-family: 휴먼엑스포;
}
<!--테이블 디자인 -->
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
.button {
    width:240px;
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
<script type="text/javascript" charset="UTF-8">
</script>
<body>
<%@ include file="gnb_v2.jsp" %>
<div class="middle_title">
	<h2 class="auto-style7">신청내역 확인</h2>
</div>
<br/><br/>
<div>
    <table class="type10" style="text-align: center; border-top-width: 0px; width: 1238px; border-bottom-width: 0px;" align="center">
  <thead>
  <tr>
    <th scope="cols" style="width: 195px; height: 15px;" class="auto-style1">신청번호</th>
    <th scope="cols" style="width: 405px; height: 15px;" class="auto-style1">지역 구분</th>
    <th scope="cols" style="width: 199px; height: 15px;" class="auto-style1">	직무 구분</th>
    <th scope="cols" style="width: 439px; height: 15px;" class="auto-style1">신청기관</th>
    <th scope="cols" style="width: 388px; height: 15px;" class="auto-style1">신청결과</th>
    <th scope="cols" style="width: 228px; height: 15px;" class="auto-style1">수정하기</th>
    <th scope="cols" style="width: 223px; height: 15px;" class="auto-style1">삭제하기</th>
  </tr>
  </thead>
  <tbody class="contents">
		<%if(apply_count > 0) { %>
		<c:forEach items="${apply_list}" var="applyDto">
		<tr>
			<td class="auto-style3">${applyDto.aId}</td>
			<td class="auto-style3">${applyDto.aApply_location_city} &nbsp; ${applyDto.aApply_location_district} </td>
			<td class="auto-style3">${applyDto.aApply_job} </td>
			<td class="auto-style3">${applyDto.aHope_institution}</td>
			<td class="auto-style3">${applyDto.aStatus_of_dispatch_apply}</td>
			<td class="auto-style3"><button type="button" onclick="location.href='worker_apply_modify_view?aId=${applyDto.aId}'">수정</button></td>
			<td class="auto-style3"><button type="button" onclick="location.href='worker_apply_cancel?aId=${applyDto.aId}'">신청취소</button></td>
		</tr>
		</c:forEach>
		<%
		} else {
		%>
		<tr>
			<td class="auto-style3" colspan="7" align="center"> 신청내역이 없습니다. </td>
		</tr>
		<%
		}
		%>
  </tbody>
</table>
</div>
		<div align="center" >
		<p align = "center" style="font-size:15px;color:#999;">
		<span style="font-style: bold;">*안내 사항</span>
		<br/>대기: 신청한 기관에 신청내역 전달 중입니다.
		<br/>검토: 해당 기관에서 회원님의 인적사항을 확인 중입니다.
		<br/>완료: 파견신청이 완료된 상태입니다. 개인 연락처로 안내가 갈 예정입니다.
		<br/>반려: 경력이 불일치 (EX: 간호학과 학부생이 중환자실 신청할 경우)하거나 신청한 기관이 증원 요청을 철회한 경우 해당됩니다. 개인 연락처로 상세안내가 나갈 예정입니다.</p>
		</div>
		<div align="center">
		<button type="button" class="button" onclick="javascript:window.location='worker_recruitment_view'">모집공고 목록으로 돌아가기</button>
		</div>

<%@ include file="footer.jsp" %>	
</body>
</html>