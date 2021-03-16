<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import ="com.korea.itcen.DAO.*"  %>
<%@ page import ="com.korea.itcen.DTO.*"  %>
<%@ page import="java.util.ArrayList" %>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setCharacterEncoding("UTF-8"); %>
 <%@ page errorPage = "viewError.jsp" %>   
<%
String name = (String)session.getAttribute("name");
String id = (String)session.getAttribute("id");
String temp = request.getParameter("aId");
int aId = Integer.parseInt(temp);
int rId = 0;


ApplyDAO applyDao = new ApplyDAO();
ApplyDTO applyDto = null;
RecruitmentDAO recruitmentDao = new RecruitmentDAO();
RecruitmentDTO recruitmentDto = null;
RequestDAO requestDao = new RequestDAO();
ArrayList<RequestDTO> requestDto = null;

applyDto = applyDao.getApply(aId);
rId = applyDto.getaRecruitment_number();
recruitmentDto = recruitmentDao.get_Recruitment_for_apply(rId);
requestDto = requestDao.getRequest(rId);

request.setAttribute("apply", applyDto);
request.setAttribute("recruitment", recruitmentDto);
request.setAttribute("request", requestDto);

%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
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
<!--���̺� ������ -->
table.type10 {
  border-collapse: collapse;
  text-align: left;
  line-height: 1.5;
  border-top: 1px solid #ccc;
  border-bottom: 1px solid #ccc;
  margin: 20px 10px;
  border-style: solid;
}
table.type10 thead th {
  width: 150px;
  padding: 10px;
  font-weight: bold;
  vertical-align: top;
  
  background: #f0f1f5;
  margin: 20px 10px;
}
table.type10 td {
  width: 350px;
  padding: 10px;
  vertical-align: middle;
}

.auto-style1 {
	color: #000000;
	font-family: �޸տ�����;
	font-weight: normal;
	border-left-style: solid;
	border-left-width: 1px;
	border-right-style: solid;
	border-right-width: medium;
	border-top-style: solid;
	border-top-width: medium;
	border-bottom-style: solid;
	border-bottom-width: 1px;
}
.auto-style3 {
	border-style: solid;
	border-width: medium;
	font-weight: normal;
	color: #333333;
	font-family: ���ʷҹ���;
}
.contents {
	border-style: dotted;
}
.auto-style5 {
	position: relative;
	text-align: center;
}
.auto-style7 {
	border-style: solid;
	border-width: medium;
	color: #000000;
	font-family: �޸տ�����;
	font-weight: normal;
}
.type10 {
	border-style: solid;
	border-radius: 1px;
}
.type10 {
	border-style: solid;
}
.auto-style7 {
	border-style: inset;
}
.auto-style8 {
	color: #000000;
	font-family: ���ʷҹ���;
	font-weight: normal;
	border-style: inset;
	border-width: medium;
}
.auto-style9 {
	color: #000000;
	font-family: �޸տ�����;
	font-weight: normal;
	border-style: inset;
	border-width: medium;
}
.auto-style10 {
	color: #000000;
	font-family: ���ʷҹ���;
	font-weight: normal;
	border-style: inset;
	border-width: medium;
	text-align: left;
}
.button {
    width:240px;
    background-color: #f0f1f5;
	border-style: inset;
    color:#000000;
    padding: 15px 0;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 15px;
	font-family: �޸տ�����;    
    margin: 4px;
    cursor: pointer;
}

</style>
</head>
<body>
<%@ include file="gnb_v2.jsp" %>
<div class="middle_title">
	<h2 class="auto-style7">��û�ϱ�</h2>
</div>
<form action="worker_apply_modify.do" method="post">
<input type="hidden" name="aId" id="aId" value="${apply.aId}">
<input type="hidden" name="aMemberID" id="aMemberID" value="${id}">

<div>
<table class="type10" style="text-align: center; border-top-width: 0px; width: 1283px; border-bottom-width: 0px; height: 566px;" align="center">
  <thead>
  <tr>
    <th scope="cols" style="height: 54px;" class="auto-style9" colspan="4">
    <div class="auto-style5" style="left: 20px; top: 10px; width: 1200px; background:#f0f1f5;"><span style="background:#f0f1f5; font-size:30px; color:#000000">${recruitment.rTitle}</span></div>
      </tr>
  </thead>
  <tbody class="contents">
  <tr>
    <td class="auto-style7" style="width: 198px; height: 25px;">����</td>
    <td class="auto-style8" style="height: 25px;">${recruitment.rRecruitment_location_city}&nbsp; ${recruitment.rRecruitment_location_district} </td>
    <td class="auto-style7" style="height: 25px;">��������</td>
    <td class="auto-style8" style="height: 25px;">${recruitment.rRecruitment_necessary_job}</td>
  </tr>
 <tr>
    <td class="auto-style9" style="height: 51px;" colspan="4">
    <div class="auto-style5" style="left: 20px; width: 1200px; background:#fff;"><span style="background:#fff; font-size:30px; color:#000000">�Է� ����</span></div>
  </tr>
  <tr>
    <td class="auto-style7" style="width: 198px">������</td>
    <td class="auto-style10" colspan="3">
  			<select name="aHope_institution" id="aHope_institution"  required>
			<option value=""> �����ϼ��� </option>
			<c:forEach items="${request}" var="requestDto">
			<option value="${requestDto.iInstitution_name}">${requestDto.iInstitution_name}</option>
			</c:forEach>
			</select>
    </td>
  </tr>
  <tr>
    <td class="auto-style7" style="width: 198px">����ٹ�����</td>
    <td class="auto-style10" colspan="3">
		<input type="date" name="aHope_work_period_start" id="aHope_work_period_start" value="${apply.aHope_work_period_start}">
					&nbsp; ~ &nbsp;
		<input type="date" name="aHope_work_period_end" id="aHope_work_period_end" value="${apply.aHope_work_period_end}" >
	</td>
  </tr>
  <tr>
    <td class="auto-style7" style="width: 198px">�ش���������</td>
    <td class="auto-style10" colspan="3"><input type="number" name="aYears_of_exp_in_this_area" id="aYears_of_exp_in_this_area"  value="${apply.aYears_of_exp_in_this_area}">����</td>
  </tr>
    <tr>
    <td class="auto-style7" style="width: 198px">�ش������� <br />������ ���</td>
    <td class="auto-style10" colspan="3"><input type="text" name="aInstitution_of_experience" id="aInstitution_of_experience" value="${apply.aInstitution_of_experience}"></td>
  </tr>
  <tr>
    <td class="auto-style9" colspan="4">
    <div class="auto-style5" style="left: 20px; width: 1200px; background:#fff;"><span style="background:#fff; font-size:30px; color:#000000">�� ���</span></div>
  </tr>
  <tr>
    <td class="auto-style9" colspan="4">
    <table class="type10" style="text-align: center; border-top-width: 0px; width: 1238px; border-bottom-width: 0px;" align="center">
  <thead>
  <tr>
    <th scope="cols" style="width: 130px; height: 15px;" class="auto-style1">��ȣ</th>
    <th scope="cols" style="width: 458px; height: 15px;" class="auto-style1">��� �̸�</th>
    <th scope="cols" style="width: 232px; height: 15px;" class="auto-style1"> ����з�</th>
    <th scope="cols" style="width: 121px; height: 15px;" class="auto-style1">����<br />�ο�</th>
    <th scope="cols" style="width: 190px; height: 15px;" class="auto-style1">�ּұٹ�<br />�Ⱓ(��)</th>
    <th scope="cols" style="width: 228px; height: 15px;" class="auto-style1">�ٹ�����</th>
    <th scope="cols" style="width: 223px; height: 15px;" class="auto-style1">��ȯ�ڽ� <br />	�ٹ�����</th>
    <th scope="cols" style="width: 191px; height: 15px;" class="auto-style1">����<br />���� ����</th>
    <th scope="cols" style="width: 178px; height: 15px;" class="auto-style1">���</th>
   </tr>
  </thead>
  <tbody class="contents">
			<c:forEach items="${request}" var="requestDto">
			<tr>
			<td class="auto-style3">${requestDto.iId}</td>
			<td class="auto-style3">${requestDto.iInstitution_name}</td>
			<td class="auto-style3">${requestDto.iInstitution_classification}</td>
			<td class="auto-style3">${requestDto.iNecessary_numbers_of_worker}</td>
			<td class="auto-style3">${requestDto.iWork_period}</td>
			<td class="auto-style3">${requestDto.iWork_type}</td>
			<td class="auto-style3">${requestDto.iNeed_ICU}</td>
			<td class="auto-style3">${requestDto.iAccomodation_Availability}</td>
			<td class="auto-style3">${requestDto.iRemarks}</td>
			</tr>
			</c:forEach>
  </tbody>
</table>

    
    
    </td>
  </tr>
  </tbody>
</table>

	<div align="center">
	<input class="button" type="submit" value="����">
	<button type="button" class="button" onclick="javascript:window.location='worker_apply_view'">���</button>	
		</div>
	</form>		
	<%@ include file="footer.jsp" %>		
</body>
</html>