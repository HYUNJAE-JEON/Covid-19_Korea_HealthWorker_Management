<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
     <%@ page errorPage = "viewError.jsp" %>   
     <% request.setCharacterEncoding("UTF-8"); %>
<% response.setCharacterEncoding("UTF-8"); %>
<% 

	String name = (String)session.getAttribute("name");
	String id = (String)session.getAttribute("id");

%>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath}/resources/Apply_completion_style.css" rel="stylesheet" type="text/css">
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
</style>
</head>
<body>
<%@ include file="gnb_v2.jsp" %>
<div class="middle_title">
	<h2 class="auto-style7">신청완료</h2>
</div>
<form action="worker_apply_view" method="post">

<div class ="container">
<input type="hidden" value="${id}" name="aMemberID">
	<fieldset>
	
	<legend>감사합니다.</legend>
	<div>
	<h3 align = "center"><%=name %>님 파견 지원 감사합니다.<br/> 보건당국과 의료기관은 <%=name %>님의 도움에 더해  코로나를 이겨낼 수 있도록 더욱 노력하겠습니다.</h3>
	<br/><h6 align = "center">1~2일 이내로 안내메일과 문자가 나갈 예정입니다. 파견 지원이 반려될 경우도 안내됩니다.</h6>
	<br/> <p align = "center" style="font-size:7px;color:#999;"> *문의 사항은 보건복지부 상담센터 129로 전화주시면 됩니다.</p>
	<button type="button" class="btnRecruitment" onclick="javascript:window.location='worker_recruitment_view'">모집공고 목록으로 돌아가기</button>
	<button type="submit" class="btnApplyview" >내 파견신청 확인하기</button>
	</div>
	</fieldset>
</div>	
<%@ include file="footer.jsp" %>	







</form>
</body>
</html>