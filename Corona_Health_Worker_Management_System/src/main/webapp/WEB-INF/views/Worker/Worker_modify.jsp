<%@ page import ="com.korea.itcen.DAO.*"  %>
<%@ page import ="com.korea.itcen.DTO.*"  %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <% request.setCharacterEncoding("UTF-8"); %>
<% response.setCharacterEncoding("UTF-8"); %>

 <%@ page errorPage = "viewError.jsp" %>   

<%
	String id = (String)session.getAttribute("id");
	WorkerDAO workerDao = WorkerDAO.getInstance();
	WorkerDTO workerDto = workerDao.getMember(id);
	request.setAttribute("workerDto", workerDto);
	
%>
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
<script language="JavaScript" src="${pageContext.request.contextPath}/resources/js/Worker_modify.js" charset="UTF-8"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js">
</script>
<script>
	function sample4_execDaumPostcode(){
		new daum.Postcode({
            oncomplete: function(data) {
                // �˾����� �˻���� �׸��� Ŭ�������� ������ �ڵ带 �ۼ��ϴ� �κ�.

                // ���θ� �ּ��� ���� ��Ģ�� ���� �ּҸ� ǥ���Ѵ�.
                // �������� ������ ���� ���� ��쿣 ����('')���� �����Ƿ�, �̸� �����Ͽ� �б� �Ѵ�.
                var roadAddr = data.roadAddress; // ���θ� �ּ� ����
                var extraRoadAddr = ''; // ���� �׸� ����

                // ���������� ���� ��� �߰��Ѵ�. (�������� ����)
                // �������� ��� ������ ���ڰ� "��/��/��"�� ������.
                if(data.bname !== '' && /[��|��|��]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // �ǹ����� �ְ�, ���������� ��� �߰��Ѵ�.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // ǥ���� �����׸��� ���� ���, ��ȣ���� �߰��� ���� ���ڿ��� �����.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // �����ȣ�� �ּ� ������ �ش� �ʵ忡 �ִ´�.
                document.getElementById('sample4_postcode').value = data.zonecode;
                document.getElementById("sample4_roadAddress").value = roadAddr;
                document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
                
                // �����׸� ���ڿ��� ���� ��� �ش� �ʵ忡 �ִ´�.
                if(roadAddr !== ''){
                    document.getElementById("sample4_extraAddress").value = extraRoadAddr;
                } else {
                    document.getElementById("sample4_extraAddress").value = '';
                }

                var guideTextBox = document.getElementById("guide");
                // ����ڰ� '���� ����'�� Ŭ���� ���, ���� �ּҶ�� ǥ�ø� ���ش�.
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(���� ���θ� �ּ� : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(���� ���� �ּ� : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
            }
        }).open();
    }
	

</script>
</head>
<body>
<%@ include file="gnb_v2.jsp" %>
<div class="middle_title">
	<h2 class="auto-style7">ȸ�� ���� �����ϱ�</h2>
</div>
	<form action="modify" method="post" name="reg_frm">
	<input type="hidden" id="wId" name="wId" value="${workerDto.wId}">
	<table name = "membertable" style="border-collapse:collapse; border:1px gray solid;" width="700" height="230" border="1" align="center">
	<!-- ù��°  �� -->
		<tr> 
			<td colspan="2" align="center" bgcolor="#053863" style="font-weight: bold; color:#fff">ȸ�� �⺻����</td>
		</tr>
	<!-- �ι�° ���̵� �� -->
		<tr>
			<td align="center" bgcolor="D5D5D5"><span style= "font-size:7px; color: #ff7f00">*</span>���̵�</td>
			<td><input type="text" size="30" maxlength="12" placeholder="4~12���� ���� ��ҹ���,���ڸ� �Է�" value="${workerDto.wId}" readonly>  </td>
		</tr>
	<!-- ����° ��й�ȣ �� -->
		<tr>
			<td align="center" bgcolor="D5D5D5"><span style= "font-size:7px; color: #ff7f00">*</span>��й�ȣ</td>
			<td><input type="password" name ="wPw" id="wPw" size="30" maxlength="12" placeholder="4~12���� ���� ��ҹ���,���ڸ� �Է�"> </td>
		</tr>
	<!-- �׹�° �� -->
		<tr>
			<td align="center" bgcolor="D5D5D5"><span style= "font-size:7px; color: #ff7f00">*</span>��й�ȣ Ȯ��</td>
			<td><input type="password" name="wPw_check" id="wPw_check" size="30" maxlength="12"></td> 
		</tr>
		<!-- �ټ���° �� -->
		<tr>
			<td align="center" bgcolor="D5D5D5"><span style= "font-size:7px; color: #ff7f00">*</span>�̸�</td>
			<td><input type="text" name="wName" id="wName" size="20" value="${workerDto.wName}" readonly> </td>
		</tr>
		<!-- ������° �� -->
		<tr>
			<td align="center" bgcolor="D5D5D5"><span style= "font-size:7px; color: #ff7f00">*</span>����</td>
			<td>
				<input type="radio" name="wSex" id="wSex1" value="MALE">��
				<input type="radio" name="wSex" id="wSex2" value="FEMALE">��
			</td>
		</tr>
		<!-- �ϰ���° �� -->
		<tr>
			<td align="center" bgcolor="D5D5D5"><span style= "font-size:7px; color: #ff7f00">*</span>�������</td>
			<td>
			<input type="hidden" value="${workerDto.wBirthdate}" name="wBirthdate">
			<input type="text" size="20" value="${workerDto.wBirthdate}" disabled>
			</td>
			</tr>
		<!-- ������° �� -->
		<tr>
			<td align="center" bgcolor="D5D5D5"><span style= "font-size:7px; color: #ff7f00">*</span>�޴�����ȣ</td>
			<td><input type="number" name="wPhone_number" id="wPhone_number" value="${workerDto.wPhone_number}" size="20" placeholder="'-' ��ȣ ���� �Է�"></td>
		</tr>			
		<!-- ��ȣ��° �� -->
		<tr>
			<td align="center" bgcolor="D5D5D5"><span style= "font-size:7px; color: #ff7f00">*</span>�̸���</td>
			<td><input type="text" name="wEmail" id="wEmail" size="20"  value="${workerDto.wEmail}"></td>
		</tr>	
		<!-- ����° �� -->
		<tr>
			<td align="center" bgcolor="D5D5D5"><span style= "font-size:7px; color: #ff7f00">*</span>���� ������</td>
		
			<td>
			<input type="text" name="original_wAddress" size="40" value="${workerDto.wAddress}" readonly><br/>
			<input type="text" id="sample4_postcode" placeholder="�����ȣ">
			<input type="button" onclick="sample4_execDaumPostcode()" value="�����ȣ ã��">
			<br/><input type="text" id="sample4_roadAddress" placeholder="���θ��ּ�" name="wAddress1">&nbsp;<input type="text" id="sample4_jibunAddress" placeholder="�����ּ�" name="wAddress3">
			<br/><input type="text" id="sample4_detailAddress" placeholder="���ּ�" size="47" name="wAddress2">&nbsp;<input type="text" id="sample4_extraAddress" placeholder="�����׸�">
			<br/><span id="guide" style="color:#999;display:none;font-size:1px;"></span></td>
		</tr>
		<!-- ȸ������ �� -->
		
		<tr> 
			<td colspan="2" align="center" bgcolor="#053863" style="font-weight: bold; color:#fff">�������</td>
		</tr>
		<!-- ���ѹ�° �� -->
		<tr>
			<td align="center" bgcolor="D5D5D5"><span style= "font-size:7px; color: #ff7f00">*</span>����</td>
			
			<td>
			<input type="hidden" name="original_wJob" value="${workerDto.wJob}">
			<input type="text" name="wJob" id="wJob" value="${workerDto.wJob}" disabled size="20">
			<select name="wJob" id="wJob_s" onchange="wJob_change()">
				<option value="0">�����ϼ���</option>
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
				<option value="9">��Ÿ(�����Է�)</option>
			</select>
			<br/> <p style="font-size:7px;color:#999;"> *���л��� �ǽ����� ������ �ִ� 4�г� �̻��� ���л� �Ǵ� ���������ڸ� ���� ����</p>
			</td>
		</tr>
		<!-- ���ι�° �� -->
		<tr>
			<td align="center" bgcolor="D5D5D5"><span style= "font-size:7px; color: #ff7f00">*</span>�ڰݹ�ȣ</td>
			<td><input type="text" name="wCertificate_number" id="wCertificate_number" value="${workerDto.wCertificate_number}" size="20"></td>		
		</tr>
		<!-- ������° �� -->
		<tr>
			<td align="center" bgcolor="D5D5D5">�� ���</td>
			
			<td>
			<input type="hidden" name="original_wClinical_experience" value="${workerDto.wClinical_experience}">
			<input type="text" disabled size="4" value="${workerDto.wClinical_experience}">��
			<select name="wClinical_experience" id="wClinical_experience">
			<option value=0>�����ϼ���</option>
			<option value=1>1��</option>
			<option value=2>2��</option>
			<option value=3>3��</option>
			<option value=4>4��</option>
			<option value=5>5��</option>
			<option value=6>6��</option>
			<option value=7>7��</option>
			<option value=8>8��</option>
			<option value=9>9��</option>
			<option value=10>10�� �̻�</option>
			</select>
			</td>
		</tr>
		<tr>
			<td align="center" bgcolor="D5D5D5">�ֿ��ӻ���</td>
			<td>
			<input type="hidden" name="original_wMjaor_career_years" value="${workerDto.wMajor_career_years}">
			<input type="text" disabled size="4" value="${workerDto.wMajor_career_years}">��
			<select name="wMjaor_career_years" id="wMjaor_career_years">
			<option value=0>�����ϼ���</option>
			<option value=1>1��</option>
			<option value=2>2��</option>
			<option value=3>3��</option>
			<option value=4>4��</option>
			<option value=5>5��</option>
			<option value=6>6��</option>
			<option value=7>7��</option>
			<option value=8>8��</option>
			<option value=9>9��</option>
			<option value=10>10�� �̻�</option>
			</select>
			</td>
		</tr>
		<tr>
			<td align="center" bgcolor="D5D5D5">�ֿ��±��<br></td>
			<td><input type="text" name="wMajor_career_institution" id="wMajor_career_institution" size="20" placeholder="���� ��� �ٹ��� ��� �Է� " value="${workerDto.wMajor_career_institution}" ></td>
		</tr>
		<tr>
			<td align="center" bgcolor="D5D5D5"><span style= "font-size:7px; color: #ff7f00">*</span>���� ����</td>
			<td>
				<input type="radio" name="wStatus_of_employment" id="wStatus_of_employment1" value="Inoffice">������
				<input type="radio" name="wStatus_of_employment" id="wStatus_of_employment2" value="job-hunting">������
				<input type="radio" name="wStatus_of_employment" id="wStatus_of_employment3" value="vacation">�ް�
				<input type="radio" name="wStatus_of_employment" id="wStatus_of_employment4" value="training">����(���л��� ������ �ش�)
			</td>
		</tr>
		<tr>
			<td align="center" bgcolor="D5D5D5"><span style= "font-size:7px; color: #ff7f00">*</span>�ڷγ� �İ��Ƿ� ����<br></td>
			<td>
			<input type="radio" name="wCovid_19_clinical_experience" id="wCovid_19_clinical_experience1" value="Yes">�ش�����
			<input type="radio" name="wCovid_19_clinical_experience" id="wCovid_19_clinical_experience2" value="No">�ش����
			</td>
		</tr>

	</table><br>
	<div align="center">
	<input class="button" type="button" value="����" onclick="infoConfirm()">&nbsp;&nbsp;&nbsp; <input type="reset" value="���" class="button" onclick="javascript:window.location='worker_recruitment_view'">
	</div>
	</form>
<%@ include file="footer.jsp" %>		
</body>
</html>