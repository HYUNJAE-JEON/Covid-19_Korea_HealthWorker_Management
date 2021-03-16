<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ page import="java.util.*"%>
    <% request.setCharacterEncoding("UTF-8"); %>
<% response.setCharacterEncoding("UTF-8"); %>
 <%@ page errorPage = "viewError.jsp" %>   
 
<% if(session.getAttribute("validMem") != null) { %>
	<jsp:forward page="Recruitment.jsp"></jsp:forward>
	<%} %>
	
	
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="EUC-KR">
<title>이겨내자_코로나</title>
<link href="${pageContext.request.contextPath}/resources/login_style.css"rel="stylesheet" type="text/css"> 
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
<script type="text/javascript" src="resources/js/jquery-3.4.1.min.js"></script>
<body>
<%@ include file="gnb_v3.jsp" %>
<div class="middle_title">
	<h2 class="auto-style7">로그인</h2>
</div>
<div class="conatiner">
<!-- center -->
<form action="login" method="post">
	
	<fieldset>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="memberlogin" checked id="healthworker" class=chkhealthwork value="worker">의료인 로그인 &nbsp;&nbsp; <input type="radio" name="memberlogin" id="medical_institution" class=chkmediinsti value="institution">의료기관 로그인&nbsp;&nbsp; <input type="radio" name="memberlogin" id="manager" class="chkmanager" value="manager">관리자 로그인
	<h3>회원로그인</h3>
	<legend>회원로그인</legend>
	<div>
		아이디: <input type="text" placeholder="아이디" name="wId" value="<% if(session.getAttribute("wId") != null) out.println(session.getAttribute("wId")); %>"> <br/>
		비밀번호: <input type="password" placeholder="비밀번호" name="wPw"> <br/>
		<input type="checkbox" checked id="chkID">
		<label for="chkID">아이디저장</label><br><br>
		<button type="submit" class="btnLogin">로그인</button> 
		<button type="button" class="btnJoin" onclick="javascript:window.location='join_view'">회원가입</button>
	</div>
	<!-- /center -->
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