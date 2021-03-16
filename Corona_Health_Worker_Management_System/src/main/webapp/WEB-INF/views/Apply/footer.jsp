<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
     <% request.setCharacterEncoding("UTF-8"); %>
<% response.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>

.footer ul{
	border-top:1px solid #ccc;
	border-bottom:1px solid #ccc;
	padding: 5px;
	margin-top: 50px;
	text-align: center;

	}

.footer ul li{
	display:inline-block;
	margin:0 5px;
}

.footer ul li a{
	color:#999;
	font-size: 14px;
	text-decoration: none;
}

.call{
	text-align: center;
	margin: 10px 0;
}

.call a{
	font-size:20px;
	color: #d8724e;
}

address{
	text-align:center;
	font-size:12px;
	color: #999;
	font-style:normal;
}

.copy{
	text-align:center;
	font-size: 12px;
	color: #999;
	margin: 10px 0;
	font-style: normal;
}

.footerLogo{
	text-align:center;
	margin-bottom:20px 0;
}

.footerLogo img{
	margin-top:10px;
	width:80px;
	opacity:0.3;
}


</style>
</head>
<body>
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

</body>
</html>