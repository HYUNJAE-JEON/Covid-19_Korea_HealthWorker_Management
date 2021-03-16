<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import ="com.korea.itcen.DAO.*"  %>
<%@ page import ="com.korea.itcen.DTO.*"  %>
<%@ page import = "java.util.ArrayList" %>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setCharacterEncoding("UTF-8"); %>
 <%@ page errorPage = "viewError.jsp" %>   

<% 
	ApplyDAO ApplyDao = new ApplyDAO();
	RequestDAO requestDao = new RequestDAO();
	LocationDAO locationDao = new LocationDAO();
	ArrayList<LocationDTO> city_selected = new ArrayList<LocationDTO>();

	ArrayList<RequestDTO> requestDao_list = null;
	ArrayList<RequestDTO> frequestDao_list = null;
	
 	
 	int pageSize = 10;
 	String pageNum = request.getParameter("pageNum");
	String IREQUEST_LOCATION_CITY= "";
	String IREQUEST_LOCATION_DISTRICT= "";
	String INECESSARY_JOB= "";
	
	if(request.getParameter("IREQUEST_LOCATION_CITY") == null) {
		IREQUEST_LOCATION_CITY = "N";
	} else {
		IREQUEST_LOCATION_CITY = request.getParameter("IREQUEST_LOCATION_CITY");
	}
	
	if(request.getParameter("IREQUEST_LOCATION_DISTRICT") == null){
		IREQUEST_LOCATION_DISTRICT = "N";
	} else {
		IREQUEST_LOCATION_DISTRICT = request.getParameter("IREQUEST_LOCATION_DISTRICT");
	}

	if(request.getParameter("INECESSARY_JOB") == null) {
		INECESSARY_JOB = "N";
	} else {
		INECESSARY_JOB = request.getParameter("INECESSARY_JOB");
	}

	
	
	if(pageNum == null){
 		pageNum = "1";
 	}
 	int currentPage = Integer.parseInt(pageNum);
 	int startRow = (currentPage - 1) * pageSize + 1;
 	int endRow = currentPage * pageSize;
 	int count = 0;
 	int fCount = 0;
 	
 	count = requestDao.request_getCount();
 	fCount = requestDao.request_getfCount(IREQUEST_LOCATION_CITY, IREQUEST_LOCATION_DISTRICT, INECESSARY_JOB);
 	
 	if(count > 0 && (("N").equals(IREQUEST_LOCATION_CITY)) && (("N").equals(IREQUEST_LOCATION_DISTRICT)) && (("N").equals(INECESSARY_JOB))) {
 		requestDao_list = requestDao.request_totallist(startRow, endRow);
 	}
 	if(fCount > 0) {
 		frequestDao_list = requestDao.request_list(startRow, endRow, IREQUEST_LOCATION_CITY, IREQUEST_LOCATION_DISTRICT, INECESSARY_JOB);
 	}
 	request.setAttribute("list", requestDao_list);
 	request.setAttribute("flist", frequestDao_list);
	city_selected = locationDao.locationDB_Call_City();
	request.setAttribute("city_list", city_selected);
 	
	String name = (String)session.getAttribute("name");
	String id = (String)session.getAttribute("id");

	System.out.println(IREQUEST_LOCATION_CITY);
	System.out.println(IREQUEST_LOCATION_DISTRICT);
	System.out.println(INECESSARY_JOB);
%>
<!-- ������� list �ҷ����� -->
<!-- �Ʒ��� �˾�â���� �� �޾ƿ��� -->
 

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>��������</title>
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

<!-- ���̺� ������ -->
table.type10 {
  border-collapse: collapse;
  text-align: left;
  line-height: 1.5;
  border-top: 1px solid #ccc;
  border-bottom: 1px solid #ccc;
  margin: 20px 10px;
  border-style: solid;
  border-radius: 1px;
  border-style: solid;
  font-size: small;

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
	font-family: ���ʷҵ���;
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
.auto-style4 {
	font-size: small;
}
.auto-style5 {
	border-style: solid;
	border-width: medium;
	font-weight: bold;
	color: #333333;
	font-family: ���ʷҹ���;
}

.button {
    width:120px;
    background-color: #476da2;
	border-style: inset;
    color:#fff;
    padding: 0 0;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 15px;
	font-family: �޸տ�����;    
    margin: 4px;
    cursor: pointer;
}

</style>
<script type="text/javascript" charset="UTF-8" src="${pageContext.request.contextPath}/resources/js/jquery-3.5.1.min.js"></script>
<script type="text/javascript" charset="UTF-8" src="${pageContext.request.contextPath}/resources/js/selectdistrict_request.js"></script>
<script>


	$(function(){
		$("form1").submit(function(){
			if($("#rRecruitment_necessary_job_opt").val() === "N" && $("#rRecruitment_location_city_opt").val() === "N" && $("#rRecruitment_location_district_opt").val() === "N"){
				alert("���� �Ǵ� ������ �������ּ���.");
				$("#rRecruitment_necessary_job_opt").focus();
				return false;
			}
		})
	})

	var openWin;
	
	function chk(){
		return true;	
	}
	
	// �˾� ���·� ����ϴ� ��. ajax ������� �̻��



</script>
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
	<br/>
	<br/>
	
	<form name=form1 method=get accept-charset="utf-8">

	<div class="buttons" align ="center" style="	font-family: �޸տ�����; ">
				<select name="INECESSARY_JOB" id="INECESSARY_JOB">
				<option value="N">�����ϼ���</option>
				<option value="�Ϲݰ�ȣ��">�Ϲݰ�ȣ��</option>
				<option value="�ӻ�������ȣ��">�ӻ�������ȣ��</option>
				<option value="��ȣ������">��ȣ������</option>
				<option value="�����Ƿ���(���Ƿ��� ����)">�����Ƿ���(���Ƿ��� ����)</option>
				<option value="�����ǻ�">�����ǻ�</option>
				<option value="���л�(��ȣ��)">���л�(��ȣ��)</option>
				<option value="���л�(�ǰ���)">���л�(�ǰ���)</option>
				<option value="���л�(��Ÿ ���Ǵ�)">���л�(��Ÿ ���Ǵ�)</option>
				<option value="��缱��">��缱��</option>
				<option value="��纸ȣ��">��纸ȣ��</option>
				<option value="�ӻ󺴸���">�ӻ󺴸���</option>
				<option value="Ÿ���� �ǻ�">Ÿ���� �ǻ�</option>
			</select>
			<select name="IREQUEST_LOCATION_CITY" id="IREQUEST_LOCATION_CITY" onchange="citySelect(this.value);">
			<option value="N"> �����ϼ��� </option>
			<c:forEach items="${city_list}" var="city">
				<option value="${city.location_city}">${city.location_city}</option>
			</c:forEach>
			</select>
			<select name="IREQUEST_LOCATION_DISTRICT" id="IREQUEST_LOCATION_DISTRICT">
			<option value="N"> ��ü </option>
			</select>
			<input class="button" type= "submit" value="�˻�" onclick="javascript: form1.action='manager_requestmanagement';"/>
			
			<label id="change">���º���: </label>&nbsp;
			<select name="iStatus_of_request" id="iStatus_of_request">
			<option value="N"> �����ϼ��� </option>
			<option value="���� ��">���� ��</option>
			<option value="���� ����">���� ����</option>
			<option value="���� �Ϸ�">���� �Ϸ�</option>
			<option value="�����η°���">�����η°���</option>
			<option value="�İ߿Ϸ�">�İ߿Ϸ�</option>
			<option value="�İ߿Ϸ�">�ݷ�</option>
			</select>
			<input class="button" type= "submit" value="����" onclick="javascript: form1.action='manager_modify_status_of_request';"/>
			<input class="button" type="button" value="Ȩ���� ���ư���"onclick="javascript:window.location='main_view'">&nbsp;&nbsp;&nbsp;
	<br/>(�� �İ߿�û ��: <%=count%> / �˻� ��û ��: <%=fCount%> )<br/><br/>
	</div>
		
	<div>
	    <table class="type10" style="text-align: center; border-top-width: 0px; width: 1400px; border-bottom-width: 0px;" align="center">
  <thead>
  <tr class="auto-style4">
   <th scope="cols" style="width: 10px; height: 15px;" class="auto-style1"></th>
    <th scope="cols" style="width: 129px; height: 15px;" class="auto-style1">��ȣ</th>
    <th scope="cols" style="width: 357px; height: 15px;" class="auto-style1">����̸�</th>
    <th scope="cols" style="width: 254px; height: 15px;" class="auto-style1">�з�</th>
    <th scope="cols" style="width: 698px; height: 15px;" class="auto-style1">���� </th>
    <th scope="cols" style="width: 475px; height: 15px;" class="auto-style1">	����</th>
    <th scope="cols" style="width: 162px; height: 15px;" class="auto-style1">�����ο�</th>
    <th scope="cols" style="width: 127px; height: 15px;" class="auto-style1">	�ٹ�<br />����</th>
    <th scope="cols" style="width: 221px; height: 15px;" class="auto-style1">	�ٹ�<br />�ϼ�<br/>(����)</th>
    <th scope="cols" style="width: 356px; height: 15px;" class="auto-style1">��ȯ�ڽ� <br />	�ٹ�</th>
    <th scope="cols" style="width: 300px; height: 15px;" class="auto-style1">	�ʿ�<br/>���<br/>(����)</th>
    <th scope="cols" style="width: 350px; height: 15px;" class="auto-style1">����<br/>����<br/>����</th>
    <th scope="cols" style="width: 332px; height: 15px;" class="auto-style1">�����<br />	��ȣ</th>
    <th scope="cols" style="width: 296px; height: 15px;" class="auto-style1">�����<br />	�̸���</th>
    <th scope="cols" style="width: 148px; height: 15px;" class="auto-style1">	���</th>
    <th scope="cols" style="width: 306px; height: 15px;" class="auto-style1">����</th>
  </tr>
  </thead>
  <tbody class="contents">
  <% 
			if(count > 0 && fCount == 0 && (("N").equals(IREQUEST_LOCATION_CITY)) && (("N").equals(IREQUEST_LOCATION_DISTRICT)) && (("N").equals(INECESSARY_JOB))) {
			
				for(int i = 0; i < requestDao_list.size(); i++) {
					RequestDTO requestDto = requestDao_list.get(i);
					
		%>
  
  <tr>
  <td class="auto-style3" style="width: 10px"><input type="checkbox" name="iIds" value="<%= requestDto.getiId() %>"></td>
    <td class="auto-style3" style="width: 129px"><%= requestDto.getiId() %></td>
    <td class="auto-style3" style="width: 357px"><%= requestDto.getiInstitution_name() %></td>
    <td class="auto-style3" style="width: 254px"><%= requestDto.getiInstitution_classification() %></td>
    <td class="auto-style3" style="width: 748px"><%= requestDto.getiRequest_location_city() %> <%= requestDto.getiRequest_location_district() %></td>
    <td class="auto-style3" style="width: 475px"><%= requestDto.getiNecessary_Job() %></td>
    <td class="auto-style3" style="width: 162px"><%= requestDto.getiNecessary_numbers_of_worker() %></td>
    <td class="auto-style3" style="width: 305px"><%= requestDto.getiWork_type() %></td>
    <td class="auto-style3" style="width: 271px"><%= requestDto.getiWork_period() %>����</td>
    <td class="auto-style3" style="width: 356px"><%= requestDto.getiNeed_ICU() %></td>
    <td class="auto-style3" style="width: 311px"><%= requestDto.getiNecessary_carrer_years() %></td>
    <td class="auto-style3" style="width: 350px"><%= requestDto.getiAccomodation_Availability() %>    </td>
    <td class="auto-style3" style="width: 150px"><%= requestDto.getiRepresentative_number() %></td>
    <td class="auto-style3" style="width: 200px"><%= requestDto.getiRepresentative_email() %></td>
     <% if(requestDto.getiRemarks() == null) { %>
    <td class="auto-style3" style="width: 148px">����</td>
    <% } else{ %>
   <td class="auto-style3" style="width: 148px"> <%= requestDto.getiRemarks() %></td>
   <%} %>
    <td class="auto-style3" style="width: 306px"><%= requestDto.getiStatus_of_request() %></td>
    
  </tr>
  		<%
				}
			} else if(count == 0) {
		%>
		
		<tr>
			<td class="auto-style3" colspan="17" align="center"> �İ߿�û�� �����ϴ�. </td>
		</tr>
	<%
			} else if (count > 0 && fCount != 0){
				for(int i = 0; i < frequestDao_list.size(); i++) {
					RequestDTO requestDto = frequestDao_list.get(i); 
	
				
		%>	
		  <tr>
  <td class="auto-style3" style="width: 10px"><input type="checkbox" name="iIds" value="<%= requestDto.getiId() %>"></td>
    <td class="auto-style3" style="width: 129px"><%= requestDto.getiId() %></td>
    <td class="auto-style3" style="width: 357px"><%= requestDto.getiInstitution_name() %></td>
    <td class="auto-style3" style="width: 254px"><%= requestDto.getiInstitution_classification() %></td>
    <td class="auto-style3" style="width: 748px"><%= requestDto.getiRequest_location_city() %> <%= requestDto.getiRequest_location_district() %></td>
    <td class="auto-style3" style="width: 475px"><%= requestDto.getiNecessary_Job() %></td>
    <td class="auto-style3" style="width: 162px"><%= requestDto.getiNecessary_numbers_of_worker() %></td>
    <td class="auto-style3" style="width: 305px"><%= requestDto.getiWork_type() %></td>
    <td class="auto-style3" style="width: 271px"><%= requestDto.getiWork_period() %>����</td>
    <td class="auto-style3" style="width: 356px"><%= requestDto.getiNeed_ICU() %></td>
    <td class="auto-style3" style="width: 311px"><%= requestDto.getiNecessary_carrer_years() %></td>
    <td class="auto-style3" style="width: 350px"><%= requestDto.getiAccomodation_Availability() %>    </td>
    <td class="auto-style3" style="width: 150px"><%= requestDto.getiRepresentative_number() %></td>
    <td class="auto-style3" style="width: 200px"><%= requestDto.getiRepresentative_email() %></td>
     <% if(requestDto.getiRemarks() == null) { %>
    <td class="auto-style3" style="width: 148px">����</td>
    <% } else{ %>
   <td class="auto-style3" style="width: 148px"> <%= requestDto.getiRemarks() %></td>
   <%} %>
    <td class="auto-style3" style="width: 350px"><%= requestDto.getiStatus_of_request() %></td>
    
  </tr>
  	
		<%
				}	
			} else {
		
		%>
		
		<tr>
   <td class="auto-style3" style="width: 148px">����</td>
		</tr>
		<%
			}
		%>
		
		<tr>
			<td class="auto-style3" colspan="17" align="center">
			<%
			
				if(count >0 && fCount == 0 && (("N").equals(IREQUEST_LOCATION_CITY)) && (("N").equals(IREQUEST_LOCATION_DISTRICT)) && (("N").equals(INECESSARY_JOB))) {
					// �� ������ ��
					int pageCount = count / pageSize + (count%pageSize == 0 ? 0 : 1);
					// �� �������� ������ ������ ��(��ũ ��)
					int pageBlock = 10;
					// �� �������� ������ ���� �� �� ��ȣ
					int startPage = ((currentPage-1)/pageBlock)*pageBlock+1;
					int endPage = startPage + pageBlock - 1;
					// ������ �������� �� ������ ������ ũ�� endpage�� pagecount�� �Ҵ�
					if(endPage > pageCount) {
						endPage = pageCount;
					}
					// ������ ��ϼ����� startPage�� Ŭ ��� ���� ��ũ ����
					if(startPage > pageBlock) {
						%>
						<a href="manager_requestmanagement?pageNum=<%=startPage - 10 %>">[����]</a>
					<% 
					}
						
						for(int i=startPage; i <= endPage; i++){
							if(i == currentPage){
						
					%>
							[<%=i %>]
			
					<% } else {
						
					%>
						<a href="manager_requestmanagement?pageNum=<%=i%>">[<%=i %>]</a>	
					<% }
						}
						if(endPage < pageCount){
							%>
							<a href="manager_requestmanagement?pageNum=<%=startPage + 10%>">[����]</a>
						<% 
						
						}
				} else if(fCount >0) {
					int pageCount = fCount / pageSize + (fCount%pageSize == 0 ? 0 : 1);
					int pageBlock = 10;
					
					int startPage = ((currentPage-1)/pageBlock)*pageBlock+1;
					int endPage = startPage + pageBlock - 1;
					
					if(endPage > pageCount){
						endPage = pageCount;
					}
					
					if(startPage > pageBlock){
					%>	
					
					<a href="manager_requestmanagement?pageNum=<%=startPage - 10%>&IREQUEST_LOCATION_CITY=<%=IREQUEST_LOCATION_CITY%>&IREQUEST_LOCATION_DISTRICT=<%=IREQUEST_LOCATION_DISTRICT%>&INECESSARY_JOB=<%=INECESSARY_JOB%>">[����]</a>
					
					<%
					
					}
					
					for(int i = startPage; i <= endPage; i++){
						if(i == currentPage){
					%>
						[<%=i%>]
					<% 		
						}else{
					%>
						<a href="manager_requestmanagement?pageNum=<%=i%>&IREQUEST_LOCATION_CITY=<%=IREQUEST_LOCATION_CITY%>&IREQUEST_LOCATION_DISTRICT=<%=IREQUEST_LOCATION_DISTRICT%>&INECESSARY_JOB=<%=INECESSARY_JOB%>">[<%=i%>]</a>
						
					<% 
						}
					
					}
					if(endPage < pageCount){
			%>	
						<a href="manager_requestmanagement?pageNum=<%=startPage + 10%>&&IREQUEST_LOCATION_CITY=<%=IREQUEST_LOCATION_CITY%>&IREQUEST_LOCATION_DISTRICT=<%=IREQUEST_LOCATION_DISTRICT%>&INECESSARY_JOB=<%=INECESSARY_JOB%>">[����]</a>
					
			<% 
			
					}
				}
			
			
			%>
		
	</td>
	</tr>
   </tbody>
</table>
	</div>
		
<%@ include file="footer.jsp" %>		
</form>
</body>
</html>