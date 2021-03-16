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

</body>
</html>