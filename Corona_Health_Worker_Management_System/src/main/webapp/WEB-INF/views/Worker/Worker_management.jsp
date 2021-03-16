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
String sel = "";
String find = "";
String wStatus_of_apply="";
String pageNum = request.getParameter("pageNum");
if(request.getParameter("sel") ==null) {
	sel="N";
}else {
	sel = request.getParameter("sel");
}
if(request.getParameter("find") ==null || ("null").equals(request.getParameter("find")) || ("���⿡ �˻�").equals(request.getParameter("find")) || ("").equals(request.getParameter("find"))) {
	find="N";
}else {
	find = request.getParameter("find");
}
if(request.getParameter("wStatus_of_apply") ==null) {
	wStatus_of_apply="N";
}else {
	wStatus_of_apply = request.getParameter("wStatus_of_apply");
}
System.out.println(sel);
System.out.println(find);
System.out.println(wStatus_of_apply);

if(pageNum == null){
		pageNum = "1";
}

int pageSize = 10;
int currentPage = Integer.parseInt(pageNum);
int startRow = (currentPage - 1) * pageSize + 1;
int endRow = currentPage * pageSize;

WorkerDAO workerDao = WorkerDAO.getInstance();
WorkerDTO workerDto = null;
ArrayList<WorkerDTO> workerDto_list = null;
ArrayList<WorkerDTO> workerDto_list_s = null;
ApplyDAO applyDao = new ApplyDAO();
ArrayList<ApplyDTO> applyDto_list = null;
ApplyDTO applyDto = null;

int count = 0;
int Scount = 0;
count = workerDao.get_MemberCount();
Scount = workerDao.get_MemberCount_S(sel, find, wStatus_of_apply);
if(count > 0 && find.equals("N") && wStatus_of_apply.equals("N")) {
	workerDto_list = workerDao.memberList(startRow, endRow);
}
if (Scount > 0) {
	workerDto_list_s = workerDao.memberList_S(startRow, endRow, sel, find, wStatus_of_apply);
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style type="text/css">

tbody.apply_checked{
	position: absolute;
	display: none;
}
#applies:checked ~ tbody{
	display: block;
}

#move{
      text-decoration: none;
      color:black;
      background: ButtonFace; 
	    color: ButtonText;
	    border-style: solid; 
	    border-width: 2px;
	    border-color: ButtonHighlight ButtonShadow ButtonShadow ButtonHighlight;
	    margin-top: 3px;


    }
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
.contents {
	border-style: none;
	border-left-style: none;
	border-right-style: none;
}
.button {
    width:120px;
    background-color: #476da2;
	border-style: inset;
    color:#fff;��
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
<script>

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
<form name=form method=get action="manager_workermanagement">
<div class = "buttons" align = "right" style= "text-align: center;">

			<select name="sel" id="sel" required>
			<option value="N"> �����ϼ��� </option>
			<option value="wId">���̵�</option>
			<option value="wName">�̸�</option>
			<option value="wAddress">���� ������</option>
			<option value="wJob">����</option>
			<option value="wstatus_of_employment">���� ����</option>
			</select>
			<input type="text" name="find" id="find"  placeholder="���⿡ �˻�">
			<select name="wStatus_of_apply" id="wStatus_of_apply">
			<option value="N"> �������μ��� </option>
			<option value="Yes">����</option>
			<option value="No">������</option>
			</select>
			<input class="button" type= "submit"  value="�˻�">
			<input class="button" type="button" value="Ȩ���� ���ư���"onclick="javascript:window.location='main_view'">&nbsp;&nbsp;&nbsp;
			
			
			</div>

<br/>
<br/>

<div class="container" align="center">
    <table class="type10" style="text-align: center; border-top-width: 0px; width: 1400px; border-bottom-width: 0px;" align="center">
  <thead>
  <tr>
    <th scope="cols" style="width: 138px; height: 15px;" class="auto-style1">��ȣ</th>
    <th scope="cols" style="width: 301px; height: 15px;" class="auto-style1">���̵�</th>
    <th scope="cols" style="width: 220px; height: 15px;" class="auto-style1">	�̸�</th>
    <th scope="cols" style="width: 348px; height: 15px;" class="auto-style1">�������</th>
    <th scope="cols" style="width: 606px; height: 15px;" class="auto-style1">���������</th>
    <th scope="cols" style="width: 20px; height: 15px;" class="auto-style1">	����</th>
    <th scope="cols" style="width: 359px; height: 15px;" class="auto-style1">�ڰݹ�ȣ</th>
    <th scope="cols" style="width: 331px; height: 15px;" class="auto-style1">	����</th>
    <th scope="cols" style="width: 246px; height: 15px;" class="auto-style1">�� <br />���(��)</th>
    <th scope="cols" style="width: 365px; height: 15px;" class="auto-style1">��������</th>
    <th scope="cols" style="width: 332px; height: 15px;" class="auto-style1">�İ��Ƿ� <br />	����</th>
    <th scope="cols" style="width: 150px; height: 15px;" class="auto-style1">	��û <br />��</th>
    <th scope="cols" style="width: 350px; height: 15px;" class="auto-style1">��ûȮ��</th>
  </tr>
  					<%
					
					if (count > 0 && Scount == 0 && find.equals("N") && wStatus_of_apply.equals("N")) {
						int number = count - (currentPage - 1) * pageSize;
						for(int i = 0; i <workerDto_list.size(); i++){
							workerDto = workerDto_list.get(i);
							applyDto_list = applyDao.getApply_list(workerDto.getwId());
							int applycount = applyDao.ApplyCount(workerDto.getwId());

					%>
  </thead>
  <tbody class="contents">
  <tr>
    <td class="auto-style3" style="width: 138px"><%=number--%></td>
    <td class="auto-style3" style="width: 301px"><%=workerDto.getwId()%></td>
    <td class="auto-style3" style="width: 199px"><%=workerDto.getwName() %> </td>
    <td class="auto-style3" style="width: 348px"> <%=workerDto.getwBirthdate() %> </td>
    <td class="auto-style3" style="width: 606px"><%=workerDto.getwAddress() %></td>
    <td class="auto-style3" style="width: 20px"><%=workerDto.getwSex() %></td>
    <td class="auto-style3" style="width: 359px"><%=workerDto.getwCertificate_number() %></td>
    <td class="auto-style3" style="width: 331px"><%=workerDto.getwJob() %></td>
    <td class="auto-style3" style="width: 246px"><%=workerDto.getwClinical_experience() %></td>
    <td class="auto-style3" style="width: 365px"><%=workerDto.getwStatus_of_employment() %></td>
    <td class="auto-style3" style="width: 332px"><%=workerDto.getwCovid_19_clinical_experience() %></td>
    <td class="auto-style3" style="width: 150px"><%=applycount %></td>
    <td class="auto-style3" style="width: 350px">					
    <% for(int j = 0; j < applyDto_list.size(); j++ ) {
						applyDto = 	applyDto_list.get(j);%> 
	<a id="move" href="manager_recruitment_content_view.do?rId=<%=applyDto.getaRecruitment_number() %>"><%=applyDto.getaHope_institution() %></a><br/>
	<%} %> 
	</td>
  </tr>
  			<% }} else if(count == 0) { %>
  			<tr>
				<td class="auto-style3"  colspan="14" align="center"> ����� ȸ���� �����ϴ�. </td>
			</tr>
  			<% } else if(count > 0 && Scount != 0){
						int number = Scount - (currentPage - 1) * pageSize;
						for(int i = 0; i < workerDto_list_s.size(); i++) {
							workerDto = workerDto_list_s.get(i);
							applyDto_list = applyDao.getApply_list(workerDto.getwId());
							int applycount = applyDao.ApplyCount(workerDto.getwId());
			%>
	 <tr>
    <td class="auto-style3" style="width: 138px"><%=number--%></td>
    <td class="auto-style3" style="width: 301px"><%=workerDto.getwId()%></td>
    <td class="auto-style3" style="width: 199px"><%=workerDto.getwName() %> </td>
    <td class="auto-style3" style="width: 348px"> <%=workerDto.getwBirthdate() %> </td>
    <td class="auto-style3" style="width: 464px"><%=workerDto.getwAddress() %></td>
    <td class="auto-style3" style="width: 162px"><%=workerDto.getwSex() %></td>
    <td class="auto-style3" style="width: 359px"><%=workerDto.getwCertificate_number() %></td>
    <td class="auto-style3" style="width: 331px"><%=workerDto.getwJob() %></td>
    <td class="auto-style3" style="width: 246px"><%=workerDto.getwClinical_experience() %></td>
    <td class="auto-style3" style="width: 365px"><%=workerDto.getwStatus_of_employment() %></td>
    <td class="auto-style3" style="width: 332px"><%=workerDto.getwCovid_19_clinical_experience() %></td>
    <td class="auto-style3" style="width: 150px"><%=applycount %></td>
    <td class="auto-style3" style="width: 350px">					
    <% for(int j = 0; j < applyDto_list.size(); j++ ) {
						applyDto = 	applyDto_list.get(j);%> 
	<a id="move" href="manager_recruitment_content_view.do?rId=<%=applyDto.getaRecruitment_number() %>"><%=applyDto.getaHope_institution() %></a><br/>
	<%} %> 
	</td>
  </tr>
  <% 		}}
					else {
						
				%>
					<tr>
<td class="auto-style3"  colspan="14" align="center"> ����� ȸ���� �����ϴ�. </td>					
</tr>
			<%} %>
  <tr>
				<td class="auto-style3" colspan="14" align="center">
				<% 
					if(count > 0 && Scount == 0 && find.equals("N") && wStatus_of_apply.equals("N")) { 
						int pageCount = count / pageSize + (count%pageSize == 0 ? 0 : 1);
						int pageBlock = 10;
						int startPage = ((currentPage-1)/pageBlock)*pageBlock+1;
						int endPage = startPage + pageBlock - 1;
						
						if(endPage > pageCount) {
							endPage = pageCount;
						}
						if(startPage > pageBlock){
							%>
							<a href="manager_workermanagement?pageNum=<%=startPage-10%>">[����]</a>
							<% 
						}
						for(int i=startPage; i <= endPage; i++) {
							if(i == currentPage) {
								%>
								[<%=i %>]
								<% 
							} else{
						%>
							<a href="manager_workermanagement?pageNum=<%=i%>">[<%=i %>]</a>
						<%
						}
					}
						
						if (endPage < pageCount) {
							%>
							<a href="manager_workermanagement?pageNum=<%=startPage+10%>">[����]</a>
							<% 
							
						}
					}
					// �˻� ������ ó��
					else if(Scount > 0){
						int pageCount = Scount / pageSize + (Scount%pageSize == 0 ? 0 : 1);
						int pageBlock = 10;
						int startPage = ((currentPage-1)/pageBlock)*pageBlock+1;
						int endPage = startPage + pageBlock - 1;
						
						if(endPage > pageCount) {
							endPage = pageCount;
						}
						if(startPage > pageBlock){
							%>
							<a href="manager_workermanagement?sel=<%=sel%>&find=<%=find%>&wStatus_of_apply=<%=wStatus_of_apply %>&pageNum=<%=startPage-10%>">[����]</a>
							<% 
						}
						for(int i=startPage; i <= endPage; i++) {
							if(i == currentPage) {
								%>
								[<%=i %>]
								<% 
							} else{
						%>
							<a href="manager_workermanagement?sel=<%=sel%>&find=<%=find%>&wStatus_of_apply=<%=wStatus_of_apply %>&pageNum=<%=i%>">[<%=i %>]</a>
						<%
						}
					}
						
						if (endPage < pageCount) {
							%>
							<a href="manager_workermanagement?sel=<%=sel%>&find=<%=find%>&wStatus_of_apply=<%=wStatus_of_apply %>&pageNum=<%=startPage+10%>">[����]</a>
							<% 
							
						}
					}
				%>
				</td>
				</tr>
				
  </tbody>
</table>
			
<!--  			<input type = "text" name="location_city_selected" readonly value= >
			<select name="select_district" id="select_district">
			<option value="N"> �����ϼ��� </option>
			<c:forEach items="${district_list}" var="district">
			<option value="${district.location_district}">${district.location_district}</option>
			</c:forEach>
			</select>
			<a href="javascript:;" onclick="district_check();" >�˻� �Ϸ�</a>	-->

</div>
</form>
<%@ include file="footer.jsp" %>			
</body>
</html>