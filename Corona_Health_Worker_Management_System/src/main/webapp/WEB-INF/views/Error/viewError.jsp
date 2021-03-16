<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page isErrorPage = "true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>오류발생</title>
<link href="${pageContext.request.contextPath}/resources/Apply_completion_style.css" rel="stylesheet" type="text/css">
</head>
<body>
<form action="worker_apply_view" method="post">
<div class="header">
<h2>오류발생</h2>
</div>
<div class ="container">

	

	<fieldset>
	
	<legend>감사합니다.</legend>
	<div>
	<h3 align = "center">요청 처리 과정에서 문제가 발생하였습니다. <br/>빠른 시간 내에 문제를 해결하도록 하겠습니다.</h3>
	<br/><h6 align = "center">오류 타입: <%= exception.getClass().getName() %><br/> 오류 메시지: <b> <%= exception.getMessage() %></b></h6>
	<br/> <p align = "center" style="font-size:7px;color:#999;"> *문의 사항은 보건복지부 상담센터 129로 전화주시면 됩니다.</p>
	<%
	
		if(session.getAttribute("name") == null) {
		
	%>
	<button type="button" class="btnRecruitment" onclick="javascript:window.location='manager_recruitment'">모집공고 목록으로 돌아가기</button>
	<% } else { %>
	<button type="button" class="btnRecruitment" onclick="javascript:window.location='worker_recruitment_view'">모집공고 목록으로 돌아가기</button>
	<%} %>
	</div>
	</fieldset>
	
	<div class="footer">
		<ul>
		<li><a href="#">이용안내</a></li>
		<li><a href="#">개인정보취급방침</a></li>
		<li><a href="#">보건복지부</a></li>
		</ul>
		
		<p class="call"><a href="tel:129">보건복지부 상담센터: 129</a></p>
		<address>세종특별자치시 도움4로 13 보건복지부 (정부세종청사 10동)</address>
		<p class="copy">COPYRIGHT(c) 2021 itcen all rights reserved.</p>
		</div>
		<div class="footerLogo">
			<img src="${pageContext.request.contextPath}/resources/img/Ministry_of_heal_and_wel.jpg" alt="보건복지부">
		</div>
		</div>






</form>
</body>
</html>