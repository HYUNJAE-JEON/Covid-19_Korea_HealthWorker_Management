/**
 * 
 */

function citySelect(IREQUEST_LOCATION_CITY){
	$.ajax({
		type: "POST",
		url: "http://localhost:8181/Corona_HealthWorker_Management/district_call.do",
		dataType:"json",
		data: {select_city:$('#IREQUEST_LOCATION_CITY').val()},
		success: function(result){
			
			$("#IREQUEST_LOCATION_DISTRICT").find("option").remove().end().append("<option value='N'>전체</option>");
		
			$.each(result, function(i){
				$("#IREQUEST_LOCATION_DISTRICT").append("<option value='"+result[i]+"'>"+result[i]+"</option>")
			});
		},
		error: function (jqXHR, textStatus, errorThrown) {
			alert("오류가 발생하였습니다. 다시 선택해주십시오.");
		}
	});
}	



