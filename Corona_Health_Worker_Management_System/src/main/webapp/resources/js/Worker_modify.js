/**
 * 
 */

function wJob_change(){
		if(document.getElementById("wJob_s").value == '0'){
			document.getElementById("wJob").disabled = true;
			 document.getElementById("wJob").value = "";
		}

		if(document.getElementById("wJob_s").value == '9'){
			document.getElementById("wJob").disabled = false;	
			document.getElementById("wJob").value = "";
			document.getElementById("wJob").focus();
		} else{
			document.getElementById("wJob").disabled = true;
			 document.getElementById("wJob").value = document.getElementById("wJob_s").value;
		}
	}

function infoConfirm() {
	if(document.reg_frm.wId.value.length ==0) {
		alert("아이디는 필수사항입니다..");
		reg_frm.wId.focus();
		return;
	}
	
	// 회원가입을 할 때 id의 길이가 0이면 아이디를 입력하게 하는 것이다.
	var idRegExp = /^[a-zA-z0-9]{4,12}$/;
	if(!idRegExp.test(document.reg_frm.wId.value)) {
		alert("아이디는 영문 대소문자와 숫자 4~12자리로 입력해야합니다!");
		reg_frm.wId.value ="";
		reg_frm.wId.focus();
		return;
	}
	
	if(document.reg_frm.wPw.value.length == 0) {
		alert("패스워드는 필수사항입니다.");
		reg_frm.wPw.focus();
		return;
	}
	if(document.reg_frm.wPw.value != document.reg_frm.wPw_check.value) {
		alert("패스워드가 일치하지 않습니다.");
		reg_frm.wPw.focus();
		return;
	}
	
	if(document.reg_frm.wName.value.length == 0) {
		alert("이름은 필수사항입니다.");
		reg_frm.wName.focus();
		return;
	}
	
	if(document.reg_frm.wSex1.checked == false && document.reg_frm.wSex2.checked == false) {
		alert("성별은 필수사항입니다.")
		return;
	}
	
	
	if(document.reg_frm.wPhone_number.value.length == 0) {
		alert("휴대폰번호는 필수 사항입니다.");
		reg_frm.wPhone_number.focus();
		return;
	}
	
	if(document.reg_frm.wEmail.value.length == 0) {
		alert("메일은 필수사항입니다.");
		reg_frm.wEmail.focus();
		return;
	}
	var emailregExp2 = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;	
	if(!emailregExp2.test(document.reg_frm.wEmail.value)){
		alert("이메일 형식이 맞지 않습니다.");
		reg_frm.wEmail.value="";
		reg_frm.wEmail.focus();
		return;
		
	}
	
			
		
	if(document.reg_frm.wCertificate_number.value == 0) {
		alert("자격번호는 필수사항입니다.");
		return;
	}		

	
	if(document.reg_frm.wStatus_of_employment1.checked == false && document.reg_frm.wStatus_of_employment2.checked == false && document.reg_frm.wStatus_of_employment3.checked == false && document.reg_frm.wStatus_of_employment4.checked == false) {
		alert("재직 상태는 필수사항입니다.")
		return;
	}
	if(document.reg_frm.wCovid_19_clinical_experience1.checked == false && document.reg_frm.wCovid_19_clinical_experience2.checked == false) {
		alert("코로나 파견의료 경험 항목은 필수사항입니다.")
		return;
	}


	document.reg_frm.submit();
}

function updateInfoConfirm() {
	if(document.reg_frm.pw.value == "") {
		alert("패스워드를 입력하세요.");
		document.reg_frm.pw.focus();
		return;
	}
	if(document.reg_frm.pw.value != document.reg_frm.pw_check.value) {
		alert("패스워드가 일치하지 않습니다.");
		reg_frm.pw.focus();
		return;
	}
	if(document.reg_frm.eMail.value.length == 0) {
		alert("메일은 필수 사항입니다.");
		reg.frm.eMail.focus();
		return;
	}
	document.reg_frm.submit();
}
