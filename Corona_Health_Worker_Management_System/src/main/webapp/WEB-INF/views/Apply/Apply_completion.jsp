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
	font-family: �޸տ�����;
}
</style>
</head>
<body>
<%@ include file="gnb_v2.jsp" %>
<div class="middle_title">
	<h2 class="auto-style7">��û�Ϸ�</h2>
</div>
<form action="worker_apply_view" method="post">

<div class ="container">
<input type="hidden" value="${id}" name="aMemberID">
	<fieldset>
	
	<legend>�����մϴ�.</legend>
	<div>
	<h3 align = "center"><%=name %>�� �İ� ���� �����մϴ�.<br/> ���Ǵ籹�� �Ƿ����� <%=name %>���� ���� ����  �ڷγ��� �̰ܳ� �� �ֵ��� ���� ����ϰڽ��ϴ�.</h3>
	<br/><h6 align = "center">1~2�� �̳��� �ȳ����ϰ� ���ڰ� ���� �����Դϴ�. �İ� ������ �ݷ��� ��쵵 �ȳ��˴ϴ�.</h6>
	<br/> <p align = "center" style="font-size:7px;color:#999;"> *���� ������ ���Ǻ����� ��㼾�� 129�� ��ȭ�ֽø� �˴ϴ�.</p>
	<button type="button" class="btnRecruitment" onclick="javascript:window.location='worker_recruitment_view'">�������� ������� ���ư���</button>
	<button type="submit" class="btnApplyview" >�� �İ߽�û Ȯ���ϱ�</button>
	</div>
	</fieldset>
</div>	
<%@ include file="footer.jsp" %>	







</form>
</body>
</html>