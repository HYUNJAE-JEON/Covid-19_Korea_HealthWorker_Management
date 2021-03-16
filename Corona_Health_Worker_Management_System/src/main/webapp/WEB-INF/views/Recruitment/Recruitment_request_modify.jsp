<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import ="com.korea.itcen.DAO.*"  %>
<%@ page import ="com.korea.itcen.DTO.*"  %>
<%@ page import = "java.util.ArrayList" %>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setCharacterEncoding("UTF-8"); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ page errorPage = "viewError.jsp" %>   

<%

	

%>


<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script type="text/javascript">

	opener.parent.location='manager_recruitment_modify_view?rId=${rId}';


</script>
<style>
.button {
    width:150px;
    background-color: #476da2;
    border: none;
    color:#fff;
    padding: 15px 0;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 15px;
    margin: 4px;
    cursor: pointer;
}
</style>
</head>
<body>
<form name=form method=get action="manager_recruitment_modify_request_visible">
<div class="container" align="center">

<fieldset>
<legend style="font-family: �޸տ�����;"> �󼼱�� ���⿩�� ���� </legend>
<input type="hidden" name="rId" value="${rId}">
<input type="hidden" name="rRecruitment_location_city" value="${rRecruitment_location_city}">
<input type="hidden" name="rRecruitment_location_district" value="${rRecruitment_location_district}">
<input type="hidden" name="rRecruitment_necessary_job" value="${rRecruitment_necessary_job}">
<div class = "Recruitment_info" align="center" style="text-align: center;">
		<p style="font-size:15px;color:#999;"> *���� ������ ����� ǥ�õ˴ϴ�. ���� ���� ����� ������û �������� '���� ����'���� ���� �� ���ε����ֽñ� �ٶ��ϴ�.</p>
		<table width="1400" cellpadding="0" cellspacing="0" border="1" style="margin-left: auto; margin-right: auto;">
			<tr>
				<td> </td>
				<td style="font-weight : bold;"> ����̸� </td>
				<td style="font-weight : bold;"> ����з� </td>
				<td style="font-weight : bold;"> �����ο� </td>
				<td style="font-weight : bold;"> �ٹ����� </td>
				<td style="font-weight : bold;"> �ּұٹ��ϼ� </td>
				<td style="font-weight : bold;"> ��ȯ�ڽ� �ٹ����� </td>
				<td style="font-weight : bold;"> �������� ���� </td>
				<td style="font-weight : bold;"> �ּ��ʿ��� </td>
				<td style="font-weight : bold;"> ����� ��ȣ </td>
				<td style="font-weight : bold;"> ����� �̸��� </td>
				<td style="font-weight : bold;"> �İ߽�û��¥</td>
				<td style="font-weight : bold;"> ���</td>
				<td style="font-weight : bold;"> ���⿩��</td>
			</tr>
			<c:forEach items="${requestDto_list}" var="requestDto_visible">
			<tr>
				<td> <input type="checkbox" name="iIds" value="${requestDto_visible.iId}"></td>
				<td> ${requestDto_visible.iInstitution_name} </td>
				<td> ${requestDto_visible.iInstitution_classification} </td>
				<td> ${requestDto_visible.iNecessary_numbers_of_worker} </td>
				<td> ${requestDto_visible.iWork_type} </td>
				<td> ${requestDto_visible.iWork_period} ���� </td>
				<td> ${requestDto_visible.iNeed_ICU} </td>
				<td> ${requestDto_visible.iAccomodation_Availability} </td>
				<td> ${requestDto_visible.iNecessary_carrer_years} </td>
				<td> ${requestDto_visible.iRepresentative_number} </td>
				<td> ${requestDto_visible.iRepresentative_email} </td>
				<td> ${requestDto_visible.iRequest_Date} </td>
				<td> ${requestDto_visible.iRemarks} </td>
				<td> <input type="hidden" name="iRecruitment_post_number" value="${requestDto_visible.iRecruitment_post_number}" style="border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px;"> ���� </td>
			</tr>
			</c:forEach>
			<c:forEach items="${requestDto_list_invisible}" var="requestDto_invisible">
			<tr>
				<td> <input type="checkbox" name="iIds" value="${requestDto_invisible.iId}"></td>
				<td> ${requestDto_invisible.iInstitution_name} </td>
				<td> ${requestDto_invisible.iInstitution_classification} </td>
				<td> ${requestDto_invisible.iNecessary_numbers_of_worker} </td>
				<td> ${requestDto_invisible.iWork_type} </td>
				<td> ${requestDto_invisible.iWork_period} ���� </td>
				<td> ${requestDto_invisible.iNeed_ICU} </td>
				<td> ${requestDto_invisible.iAccomodation_Availability} </td>
				<td> ${requestDto_invisible.iNecessary_carrer_years} </td>
				<td> ${requestDto_invisible.iRepresentative_number} </td>
				<td> ${requestDto_invisible.iRepresentative_email} </td>
				<td> ${requestDto_invisible.iRequest_Date} </td>
				<td> ${requestDto_invisible.iRemarks} </td>
				<td> <input type="hidden" name="iRecruitment_post_number" value="${requestDto_invisible.iRecruitment_post_number}" style="border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px;"> ����� </td>
			</tr>
			</c:forEach>
			<tr>
				<td colspan="14" align="right"> ����� �İ߿�û �� : ${request_count_visible} / ${request_count_total} </td> 
			</tr>
		</table>
		
		<div class = "buttons" align = "right" style= "text-align: center; font-family: �޸տ�����;">
			���⿩�� ����: &nbsp;<select name="IRECRUITMENT_POST_NUMBER" id="IRECRUITMENT_POST_NUMBER">
			<option value="N"> �����ϼ��� </option>
			<option value="${rId}">����</option>
			<option value="0">�����</option>
			</select>

		</div>
		<div align="center"></div>
				<input class="button" type="submit" name="recruitment_modify" value="�����ϱ�">
		<button class="button" type="button" name="exit" onclick="window.close();">�ݱ�</button>
</div>



</fieldset>
</div>
</form>
</body>
</html>	