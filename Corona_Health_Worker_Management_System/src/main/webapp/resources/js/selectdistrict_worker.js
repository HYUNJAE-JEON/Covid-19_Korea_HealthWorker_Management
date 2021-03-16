/**
 * 
 */

function citySelect(rRecruitment_location_city_opt){
	$.ajax({
		type: "POST",
		url: "/itcen/District_call",
		dataType:"json",
		data: {select_city:$('#rRecruitment_location_city_opt').val()},
		success: function(result){
			
			$("#rRecruitment_location_district_opt").find("option").remove().end().append("<option value='N'>전체</option>");
		
			$.each(result, function(i){
				$("#rRecruitment_location_district_opt").append("<option value='"+result[i]+"'>"+result[i]+"</option>")
			});
		},
		error: function (jqXHR, textStatus, errorThrown) {
			alert("오류가 발생하였습니다. 다시 선택해주십시오.");
		}
	});
}	



