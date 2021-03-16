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
<title>�̰ܳ���_�ڷγ�</title>
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
	font-family: �޸տ�����;
}
</style>
</head>
<script type="text/javascript" src="resources/js/jquery-3.4.1.min.js"></script>
<body>
<%@ include file="gnb_v3.jsp" %>
<div class="middle_title">
	<h2 class="auto-style7">�α���</h2>
</div>
<div class="conatiner">
<!-- center -->
<form action="login" method="post">
	
	<fieldset>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="memberlogin" checked id="healthworker" class=chkhealthwork value="worker">�Ƿ��� �α��� &nbsp;&nbsp; <input type="radio" name="memberlogin" id="medical_institution" class=chkmediinsti value="institution">�Ƿ��� �α���&nbsp;&nbsp; <input type="radio" name="memberlogin" id="manager" class="chkmanager" value="manager">������ �α���
	<h3>ȸ���α���</h3>
	<legend>ȸ���α���</legend>
	<div>
		���̵�: <input type="text" placeholder="���̵�" name="wId" value="<% if(session.getAttribute("wId") != null) out.println(session.getAttribute("wId")); %>"> <br/>
		��й�ȣ: <input type="password" placeholder="��й�ȣ" name="wPw"> <br/>
		<input type="checkbox" checked id="chkID">
		<label for="chkID">���̵�����</label><br><br>
		<button type="submit" class="btnLogin">�α���</button> 
		<button type="button" class="btnJoin" onclick="javascript:window.location='join_view'">ȸ������</button>
	</div>
	<!-- /center -->
	</fieldset>
	
		<div class="footer">
		<ul>
		<li><a href="#">�̿�ȳ�</a></li>
		<li><a href="#">����������޹�ħ</a></li>
		<li><a href="#">���Ǻ�����</a></li>
		</ul>
		
		<p class="call"><a href="tel:129">���Ǻ����� ��㼾��: 129</a></p>
		<address>����Ư����ġ�� ����4�� 13 ���Ǻ����� (���μ���û�� 10��)</address>
		<p class="copy">COPYRIGHT(c) 2021 itcen all rights reserved.</p>
		</div>
		<div class="footerLogo">
			<img src="${pageContext.request.contextPath}/resources/img/Ministry_of_heal_and_wel.jpg" alt="���Ǻ�����">
		</div>
		</div>
	
</form>

</body>
</html>