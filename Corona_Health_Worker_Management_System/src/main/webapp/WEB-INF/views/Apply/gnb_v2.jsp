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
	<input class="auto-style5" name="button1" style="width: 127px" type="button" value="회원정보수정" onclick="javascript:window.location='modify_view'">
	&nbsp;<input name="Button2" type="button" value="파견신청내역 변경" class="auto-style5" style="width: 143px" onclick="javascript:window.location='worker_apply_view'">
	&nbsp;<input name="Button3" type="button" value="로그아웃" class="auto-style5" style="width: 66px" onclick="javascript:window.location='logout'"></div>

<div class="main_banner">
	<img alt="request" height="267" src="${pageContext.request.contextPath}/resources/img/BEATCORONA.JPG" width="500">
</div>

</body>
</html>