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
.gnb {
	text-align: center;
	border-left-style: none;
	border-right-style: none;
	border-top-style: none;
	border-bottom-style: double;
	border-radius: 1px;
}

.gnb {
	border-style: solid;
	border-radius: 1px;
}
.gnb {
	border-style: none none double none;
}
.main_banner {
	margin: 5px;
	text-align: center;
}
.auto-style6 {
	font-family: 휴먼엑스포;
	color: #053863;
}

.auto-style5 {
	color: #999999;
	font-size: small;
	font-family: 휴먼둥근헤드라인;
	background-color: #FFFFFF;
	border-style: none;

}


</style>
</head>
<body>
<div class="gnb">
	<img alt="healthworker" height="40px" src="${pageContext.request.contextPath}/resources/img/gnb_logo.jpg" width="160"  style="margin-bottom: -15px; display: inline-block; ">
	<div style=	"display: inline-block; margin-bottom: 15px; margin-top: 0px; margin-left: -15px;">
	<span style="padding: 10px;" class="auto-style6">코로나 파견의료인력 신청</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	</div>
</div>

<div class="main_banner">
	<img alt="request" height="267" src="${pageContext.request.contextPath}/resources/img/main_banner.png" width="758">
</div>

</body>
</html>