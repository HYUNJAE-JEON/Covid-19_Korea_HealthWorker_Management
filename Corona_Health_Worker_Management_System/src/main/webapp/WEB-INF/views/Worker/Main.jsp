<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <% request.setCharacterEncoding("UTF-8"); %>
<% response.setCharacterEncoding("UTF-8"); %>
 <%@ page errorPage = "viewError.jsp" %>   

    
    <% 


%>
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
</style>
</head>
<body>
<%@ include file="gnb_v4.jsp" %>
	<nav class="lnb">
				<ul>
					<li><a class="menuLink" href="manager_workermanagement.do">ȸ����������</a></li>
					<li><a class="menuLink" href="manager_recruitment.do">�������� ����</a></li>
					<li><a class="menuLink" href="manager_requestmanagement.do">�İ߽�û����</a></li>
				</ul>
	</nav>
<h1 align="center">�����ڴ� �ȳ��ϼ���</h1><br/>

<div align="center">
<img src="${pageContext.request.contextPath}/resources/img/corona_table.JPG" alt="���Ǻ�����">
</div>




<%@ include file="footer.jsp" %>	

</body>
</html>