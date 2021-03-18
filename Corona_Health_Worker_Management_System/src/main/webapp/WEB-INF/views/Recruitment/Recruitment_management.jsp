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
	RecruitmentDAO recruitmentDao = new RecruitmentDAO();
	LocationDAO locationDao = new LocationDAO();
	ArrayList<LocationDTO> city_selected = new ArrayList<LocationDTO>();

	ArrayList<RecruitmentDTO> recruitmentDto = null;
	ArrayList<RecruitmentDTO> frecruitmentDto = null;
	
 	
 	int pageSize = 10;
 	String pageNum = request.getParameter("pageNum");
	String rRecruitment_location_city_opt= "";
	String rRecruitment_location_district_opt= "";
	String rRecruitment_necessary_job_opt= "";
	
	if(request.getParameter("rRecruitment_location_city_opt") == null) {
		rRecruitment_location_city_opt = "N";
	} else {
		rRecruitment_location_city_opt = request.getParameter("rRecruitment_location_city_opt");
	}
	
	if(request.getParameter("rRecruitment_location_district_opt") == null){
		rRecruitment_location_district_opt = "N";
	} else {
		rRecruitment_location_district_opt = request.getParameter("rRecruitment_location_district_opt");
	}

	if(request.getParameter("rRecruitment_necessary_job_opt") == null) {
		rRecruitment_necessary_job_opt = "N";
	} else {
		rRecruitment_necessary_job_opt = request.getParameter("rRecruitment_necessary_job_opt");
	}

	
	
	if(pageNum == null){
 		pageNum = "1";
 	}
 	int currentPage = Integer.parseInt(pageNum);
 	int startRow = (currentPage - 1) * pageSize + 1;
 	int endRow = currentPage * pageSize;
 	int count = 0;
 	int fCount = 0;
 	fCount = recruitmentDao.Recruitment_Count_Paging_filter(rRecruitment_location_city_opt, rRecruitment_location_district_opt, rRecruitment_necessary_job_opt);
 	count = recruitmentDao.Recruitment_Count();
 	if(count > 0 && (("N").equals(rRecruitment_location_city_opt)) && (("N").equals(rRecruitment_location_district_opt)) && (("N").equals(rRecruitment_necessary_job_opt))) {
 		recruitmentDto = recruitmentDao.Recruitment_totallist(startRow, endRow);
 	}
 	if(fCount > 0) {
 		frecruitmentDto = recruitmentDao.Recruitment_list_paging_filter(startRow, endRow, rRecruitment_location_city_opt, rRecruitment_location_district_opt, rRecruitment_necessary_job_opt);
 	}
 	request.setAttribute("Recruitment_list_paging_filter", recruitmentDto);
 	request.setAttribute("flist", frecruitmentDto);
	city_selected = locationDao.locationDB_Call_City();
	request.setAttribute("city_list", city_selected);
 	
	String name = (String)session.getAttribute("name");
	String id = (String)session.getAttribute("id");

	System.out.println(rRecruitment_location_city_opt);
	System.out.println(rRecruitment_location_district_opt);
	System.out.println(rRecruitment_necessary_job_opt);
%>
<!-- ������� Recruitment_list_paging_filter �ҷ����� -->
<!-- �Ʒ��� �˾�â���� �� �޾ƿ��� -->
 

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>��������</title>
<style>
.lnb li {
	Recruitment_list_paging_filter-style: none;
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
  border-style: none none double none;
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
  vertical-align: top;
}

.auto-style1 {
	color: #000000;
	font-family: �޸տ�����;
	font-weight: normal;
	border-left-style: solid;
	border-left-width: 1px;
	border-right-style: none;
	border-right-width: medium;
	border-top-style: none;
	border-top-width: medium;
	border-bottom-style: solid;
	border-bottom-width: 1px;
}
.auto-style3 {
	border-style: none;
	border-width: medium;
	font-weight: normal;
	color: #333333;
	font-family: �޸ո���T;
}
.contents {
	border-style: dotted;
}
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
<script type="text/javascript" charset="UTF-8" src="${pageContext.request.contextPath}/resources/js/jquery-3.5.1.min.js"></script>
<script type="text/javascript" charset="UTF-8" src="${pageContext.request.contextPath}/resources/js/selectdistrict.js"></script>
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
	
	<form name=form1 method=get action="manager_recruitment" accept-charset="utf-8">
	<div class="buttons" align="center" style="font-family: �޸ո���T;">
				��������:<select name="rRecruitment_necessary_job_opt" id="rRecruitment_necessary_job_opt">
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
			��������:<select name="rRecruitment_location_city_opt" id="rRecruitment_location_city_opt" onchange="citySelect(this.value);">
			<option value="N"> �����ϼ��� </option>
			<c:forEach items="${city_list}" var="city">
				<option value="${city.location_city}">${city.location_city}</option>
			</c:forEach>
			</select>
			<select name="rRecruitment_location_district_opt" id="rRecruitment_location_district_opt">
			<option value="N"> ��ü </option>
			</select>
			<input class="button" type = "submit" value="�ٷ� �˻�">
			<br/>(�� �Խñ� ��: <%=count%> / �˻� �Խñ� ��: <%=fCount%> )
			<br/>
			
	</div>
	<div>
	<br/>
	<br/>
	<table class="type10" style="text-align: center; border-top-width: 0px; width: 1238px; border-bottom-width: 0px;" align="center">
  <thead>
  <tr>
    <th scope="cols" style="width: 81px; height: 15px;" class="auto-style1">��ȣ</th>
    <th scope="cols" style="width: 615px; height: 15px;" class="auto-style1">���� 	����</th>
    <th scope="cols" style="width: 101px; height: 15px;" class="auto-style1">��ȸ��</th>
    <th scope="cols" style="width: 133px; height: 15px;" class="auto-style1">����</th>
    <th scope="cols" style="width: 178px; height: 15px;" class="auto-style1">�����</th>
    <th scope="cols" style="width: 178px; height: 15px;" class="auto-style1">��û�� 	��Ȳ</th>
    <th scope="cols" style="width: 178px; height: 15px;" class="auto-style1">����</th>
  </tr>
  </thead>
  	<% 
			if(count > 0 && fCount == 0 && (("N").equals(rRecruitment_location_city_opt)) && (("N").equals(rRecruitment_location_district_opt)) && (("N").equals(rRecruitment_necessary_job_opt))) {
			
				for(int i = 0; i < recruitmentDto.size(); i++) {
					RecruitmentDTO recruitment = recruitmentDto.get(i);
					
		%>
  <tbody class="contents">
		<tr>
			<td class="auto-style3" style="width: 81px"><%= recruitment.getrId() %></td>
			<td class="auto-style3" style="width: 615px"><a href="manager_recruitment_content_view?rId=<%= recruitment.getrId() %>&pageNum=<%=currentPage%>"><%=recruitment.getrTitle() %></a></td>
			<td class="auto-style3" style="width: 101px"><%= recruitment.getrUpload_date() %></td>
			<td class="auto-style3" style="width: 133px"><%= recruitment.getrHit() %></td>
			<td class="auto-style3" style="width: 178px"><%= recruitment.getrStatus_of_recruitment() %> </td>
			<td class="auto-style3" style="width: 178px"><%= ApplyDao.rApplyCount(recruitment.getrId()) %> / <%= recruitment.getrRecruitment_num_of_worker() %></td>
			<td class="auto-style3" style="width: 178px"><button type="button" onclick="location.href='manager_recruitment_end?rId=<%= recruitment.getrId() %>'">�����ϱ�</button></td>
		</tr>
				<%
				}
			} else if(count == 0) {
		%>
		<tr>
			<td class="auto-style3"  colspan="7" align="center"> �Խñ��� �����ϴ�. </td>
		</tr>
				<%
			} else if (count > 0 && fCount != 0){
				for(int i = 0; i < frecruitmentDto.size(); i++) {
					RecruitmentDTO recruitment = frecruitmentDto.get(i); 
	
				
		%>
				<tr>
			<td class="auto-style3" style="width: 81px"><%= recruitment.getrId() %></td>
			<td class="auto-style3" style="width: 615px"><a href="manager_recruitment_content_view?rId=<%= recruitment.getrId() %>&pageNum=<%=currentPage%>"><%=recruitment.getrTitle() %></a></td>
			<td class="auto-style3" style="width: 101px"><%= recruitment.getrUpload_date() %></td>
			<td class="auto-style3" style="width: 133px"><%= recruitment.getrHit() %></td>
			<td class="auto-style3" style="width: 178px"><%= recruitment.getrStatus_of_recruitment() %> </td>
			<td class="auto-style3" style="width: 178px"><%= ApplyDao.rApplyCount(recruitment.getrId()) %> / <%= recruitment.getrRecruitment_num_of_worker() %></td>
			<td class="auto-style3" style="width: 178px"><button type="button" onclick="location.href='manager_recruitment_end?rId=<%= recruitment.getrId() %>'">�����ϱ�</button></td>
		</tr>
				<%
				}	
			} else {
		
		%>
				<tr>
			<td class="auto-style3"  colspan="7" align="center"> �Խñ��� �����ϴ�. </td>
		</tr>
				<%
			}
		%>
		<tr>
			<td  class="auto-style3" colspan="7" align="center">
			<%
			
				if(count >0 && fCount == 0 && (("N").equals(rRecruitment_location_city_opt)) && (("N").equals(rRecruitment_location_district_opt)) && (("N").equals(rRecruitment_necessary_job_opt))) {
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
						<a href="manager_recruitment?pageNum=<%=startPage - 10 %>">[����]</a>
					<% 
					}
						
						for(int i=startPage; i <= endPage; i++){
							if(i == currentPage){
						
					%>
							[<%=i %>]
			
					<% } else {
						
					%>
						<a href="manager_recruitment?pageNum=<%=i%>">[<%=i %>]</a>	
					<% }
						}
						if(endPage < pageCount){
							%>
							<a href="manager_recruitment?pageNum=<%=startPage + 10%>">[����]</a>
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
					
					<a href="manager_recruitment?pageNum=<%=startPage - 10%>&rRecruitment_necessary_job_opt=<%=rRecruitment_necessary_job_opt%>&rRecruitment_location_city_opt=<%=rRecruitment_location_city_opt%>&rRecruitment_location_district_opt=<%=rRecruitment_location_district_opt%>">[����]</a>
					
					<%
					
					}
					
					for(int i = startPage; i <= endPage; i++){
						if(i == currentPage){
					%>
						[<%=i%>]
					<% 		
						}else{
					%>
						<a href="manager_recruitment?pageNum=<%=i%>&rRecruitment_necessary_job_opt=<%=rRecruitment_necessary_job_opt%>&rRecruitment_location_city_opt=<%=rRecruitment_location_city_opt%>&rRecruitment_location_district_opt=<%=rRecruitment_location_district_opt%>">[<%=i%>]</a>
						
					<% 
						}
					
					}
					if(endPage < pageCount){
			%>	
						<a href="manager_recruitment?pageNum=<%=startPage + 10%>&rRecruitment_necessary_job_opt=<%=rRecruitment_necessary_job_opt%>&rRecruitment_location_city_opt=<%=rRecruitment_location_city_opt%>&rRecruitment_location_district_opt=<%=rRecruitment_location_district_opt%>">[����]</a>
					
			<% 
			
					}
				}
			
			
			%>
	</td>
	</tr>
  </tbody>
</table>
	
	</div>
<div align="center">
<input class="button" type="button" value="Ȩ���� ���ư���"onclick="javascript:window.location='main_view'">&nbsp;&nbsp;&nbsp;
			<input class="button" type="button" value="�������� �ۼ�"onclick="javascript:window.location='manager_recruitment_write_view'">&nbsp;&nbsp;&nbsp;
</div>
	

</form>
<%@ include file="footer.jsp" %>		
</body>
</html>