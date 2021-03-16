<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
 <%@ page errorPage = "viewError.jsp" %>       
 <% request.setCharacterEncoding("UTF-8"); %>
<% response.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script language="JavaScript" src="${pageContext.request.contextPath}/resources/js/Worker.js" charset="UTF-8"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js">
</script>
<script>
	function sample4_execDaumPostcode(){
		new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample4_postcode').value = data.zonecode;
                document.getElementById("sample4_roadAddress").value = roadAddr;
                document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
                
                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                if(roadAddr !== ''){
                    document.getElementById("sample4_extraAddress").value = extraRoadAddr;
                } else {
                    document.getElementById("sample4_extraAddress").value = '';
                }

                var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
            }
        }).open();
    }
	

</script>
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
	font-family: 휴먼엑스포;
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
	font-family: 휴먼엑스포;    
    margin: 4px;
    cursor: pointer;
}

</style>
</head>
<body>
<%@ include file="gnb_v2.jsp" %>
<div class="middle_title">
	<h2 class="auto-style7">회원 정보 수정하기</h2>
</div>

	<form action="join" method="post" name="reg_frm"> <!-- 자바 스크립트의 요소를 참조하기 위해 name을 쓴다. -->
		<table name = "membertable" style="border-collapse:collapse; border:1px gray solid;" width="700" height="230" border="1" align="center">
		<!-- 첫번째  줄 -->
		<tr> 
			<td colspan="2" align="center" bgcolor="#053863" style="font-weight: bold; color:#fff">회원 기본정보</td>
		</tr>
		<!-- 두번째 아이디 줄 -->
		<tr>
			<td align="center" bgcolor="D5D5D5"><span style= "font-size:7px; color: #ff7f00">*</span>아이디</td>
			<td><input type="text" name="wId" size="30" id="wId" maxlength="12" placeholder="4~12자의 영문 대소문자,숫자만 입력">  </td>
		</tr>
		<!-- 세번째 비밀번호 줄 -->
		<tr>
			<td align="center" bgcolor="D5D5D5"><span style= "font-size:7px; color: #ff7f00">*</span>비밀번호</td>
			<td><input type="password" name ="wPw" id="wPw" size="30" maxlength="12" placeholder="4~12자의 영문 대소문자,숫자만 입력"> </td>
		</tr>
		<!-- 네번째 줄 -->
		<tr>
			<td align="center" bgcolor="D5D5D5"><span style= "font-size:7px; color: #ff7f00">*</span>비밀번호 확인</td>
			<td><input type="password" name="wPw_check" id="wPw_check" size="30" maxlength="12"></td> 
		</tr>
		<!-- 다섯번째 줄 -->
		<tr>
			<td align="center" bgcolor="D5D5D5"><span style= "font-size:7px; color: #ff7f00">*</span>이름</td>
			<td><input type="text" name="wName" id="wName" size="20"> </td>
		</tr>
		<!-- 여섯번째 줄 -->
		<tr>
			<td align="center" bgcolor="D5D5D5"><span style= "font-size:7px; color: #ff7f00">*</span>성별</td>
			<td>
				<input type="radio" name="wSex" id="wSex1" value="MALE">남
				<input type="radio" name="wSex" id="wSex2" value="FEMALE">여
			</td>
		</tr>
		<!-- 일곱번째 줄 -->
		<tr>
			<td align="center" bgcolor="D5D5D5"><span style= "font-size:7px; color: #ff7f00">*</span>생년월일</td>
			<td><input type="number" name="year" size="5" maxlength="4" id="year">년
				<select name="month" id="month">
				<option value=01>01</option>
				<option value=02>02</option>
				<option value=03>03</option>
				<option value=04>04</option>
				<option value=05>05</option>
				<option value=06>06</option>
				<option value=07>07</option>
				<option value=08>08</option>
				<option value=09>09</option>
				<option value=10>10</option>
				<option value=11>11</option>
				<option value=12>12</option>
				</select> 월 
				<select name="day" id="day">
					<option value=01> 01 </option>
					<option value=02> 02 </option>
					<option value=03> 03 </option>
					<option value=04> 04 </option>
					<option value=05> 05 </option>
					<option value=06> 06 </option>
					<option value=07> 07 </option>
					<option value=08> 08 </option>
					<option value=09> 09 </option>
					<option value=10> 10 </option>
					<option value=11> 11 </option>
					<option value=12> 12 </option>
					<option value=13> 13 </option>
					<option value=14> 14 </option>
					<option value=15> 15 </option>
					<option value=16> 16 </option>
					<option value=17> 17 </option>
					<option value=18> 18 </option>
					<option value=19> 19 </option>
					<option value=20> 20 </option>
					<option value=21> 21 </option>
					<option value=22> 22 </option>
					<option value=23> 23 </option>
					<option value=24> 24 </option>
					<option value=25> 25 </option>
					<option value=26> 26 </option>
					<option value=27> 27 </option>
					<option value=28> 28 </option>
					<option value=29> 29 </option>
					<option value=30> 30 </option>
					<option value=31> 31 </option>
				</select> 일
			</td>
			</tr>
		<!-- 여덟번째 줄 -->
		<tr>
			<td align="center" bgcolor="D5D5D5"><span style= "font-size:7px; color: #ff7f00">*</span>휴대폰번호</td>
			<td><input type="number" name="wPhone_number" id="wPhone_number" size="20" placeholder="'-' 기호 빼고 입력"></td>
		</tr>
		<!-- 아호번째 줄 -->
		<tr>
			<td align="center" bgcolor="D5D5D5"><span style= "font-size:7px; color: #ff7f00">*</span>이메일</td>
			<td><input type="text" name="wEmail" id="wEmail" size="20"></td>
		</tr>
		<!-- 열번째 줄 -->
		<tr>
			<td align="center" bgcolor="D5D5D5"><span style= "font-size:7px; color: #ff7f00">*</span>현재 거주지</td>
			<td><input type="text" id="sample4_postcode" placeholder="우편번호">
			<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기">
			<br/><input type="text" id="sample4_roadAddress" placeholder="도로명주소" name="wAddress1">&nbsp;<input type="text" id="sample4_jibunAddress" placeholder="지번주소" name="wAddress3">
			<br/><input type="text" id="sample4_detailAddress" placeholder="상세주소" size="47" name="wAddress2">&nbsp;<input type="text" id="sample4_extraAddress" placeholder="참고항목">
			<br/><span id="guide" style="color:#999;display:none;font-size:1px;"></span></td>
		</tr>
		<!-- 회원정보 끝 -->
		
		<tr> 
			<td colspan="2" align="center" bgcolor="#053863" style="font-weight: bold; color:#fff">경력정보</td>
		</tr>
		<!-- 열한번째 줄 -->
		<tr>
			<td align="center" bgcolor="D5D5D5"><span style= "font-size:7px; color: #ff7f00">*</span>직업</td>
			<td><input type="text" name="wJob" id="wJob" value="" disabled size="20">
			<select name="wJob" id="wJob_s" onchange="wJob_change()">
				<option value="0">선택하세요</option>
				<option value="일반간호사">일반간호사</option>
				<option value="임상전문간호사">임상전문간호사</option>
				<option value="간호조무사">간호조무사</option>
				<option value="공공의료인(군의료인 포함)">공공의료인(군의료인 포함)</option>
				<option value="내과의사">내과의사</option>
				<option value="대학생(간호대)">대학생(간호대)</option>
				<option value="대학생(의과대)">대학생(의과대)</option>
				<option value="대학생(기타 보건대)">대학생(기타 보건대)</option>
				<option value="방사선사">방사선사</option>
				<option value="요양보호사">요양보호사</option>
				<option value="임상병리사">임상병리사</option>
				<option value="타과목 의사">타과목 의사</option>
				<option value="9">기타(직접입력)</option>
			</select>
			<br/> <p style="font-size:7px;color:#999;"> *대학생은 실습참여 경험이 있는 4학년 이상의 재학생 또는 졸업예정자만 지원 가능</p>
			</td>
		</tr>
		<!-- 열두번째 줄 -->
		<tr>
			<td align="center" bgcolor="D5D5D5">자격번호</td>
			<td><input type="text" name="wCertificate_number" id="wCertificate_number" size="20"></td>		
		</tr>
		<!-- 열세번째 줄 -->
		<tr>
			<td align="center" bgcolor="D5D5D5">총 경력</td>
			<td><select name="wClinical_experience" id="wClinical_experience">
			<option value=0>선택하세요</option>
			<option value=1>1년</option>
			<option value=2>2년</option>
			<option value=3>3년</option>
			<option value=4>4년</option>
			<option value=5>5년</option>
			<option value=6>6년</option>
			<option value=7>7년</option>
			<option value=8>8년</option>
			<option value=9>9년</option>
			<option value=10>10년 이상</option>
			</select>
			</td>
		</tr>
		<tr>
			<td align="center" bgcolor="D5D5D5">주요임상경력</td>
			<td><select name="wMjaor_career_years" id="wMjaor_career_years">
			<option value=0>선택하세요</option>
			<option value=1>1년</option>
			<option value=2>2년</option>
			<option value=3>3년</option>
			<option value=4>4년</option>
			<option value=5>5년</option>
			<option value=6>6년</option>
			<option value=7>7년</option>
			<option value=8>8년</option>
			<option value=9>9년</option>
			<option value=10>10년 이상</option>
			</select>
			</td>
		</tr>
		<tr>
			<td align="center" bgcolor="D5D5D5">주요경력기관<br></td>
			<td><input type="text" name="wMajor_career_institution" id="wMajor_career_institution" size="20" placeholder="가장 길게 근무한 기관 입력 " ></td>
		</tr>
		<tr>
			<td align="center" bgcolor="D5D5D5"><span style= "font-size:7px; color: #ff7f00">*</span>재직 상태</td>
			<td>
				<input type="radio" name="wStatus_of_employment" id="wStatus_of_employment1" value="Inoffice">재직중
				<input type="radio" name="wStatus_of_employment" id="wStatus_of_employment2" value="job-hunting">구직중
				<input type="radio" name="wStatus_of_employment" id="wStatus_of_employment3" value="vacation">휴가
				<input type="radio" name="wStatus_of_employment" id="wStatus_of_employment4" value="training">교육(대학생은 교육에 해당)
			</td>
		</tr>
		<tr>
			<td align="center" bgcolor="D5D5D5">코로나 파견의료 경험<br></td>
			<td>
			<input type="radio" name="wCovid_19_clinical_experience" id="wCovid_19_clinical_experience1" value="Yes">해당있음
			<input type="radio" name="wCovid_19_clinical_experience" id="wCovid_19_clinical_experience2" value="No">해당없음
			</td>
		</tr>
	</table><br>
	<div align="center">
	<input class="button" type="button" value="회원가입" onclick="infoConfirm()">&nbsp;&nbsp;&nbsp; <input type="reset" value="취소" class="button" onclick="javascript:window.location='login_view'">
	</div>
	</form>

<%@ include file="footer.jsp" %>		
</body>
</html>