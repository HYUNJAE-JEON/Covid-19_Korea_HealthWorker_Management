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

function requestSelect(rRecruitment_location_city_opt, rRecruitment_location_district_opt, rRecruitment_necessary_job_opt){
	$.ajax({
		type: "POST",
		url: "/itcen/manager_request_register_inrecruit",
		dataType:"json",
		data: {rRecruitment_location_city:$('#rRecruitment_location_city_opt').val(), rRecruitment_location_district:$('#rRecruitment_location_district_opt').val(), rRecruitment_necessary_job:$('#rRecruitment_necessary_job_opt').val()},
		success: function(result){
			if(result.length > 0){
			$("#request_place").find("tr").remove();
			var str = "<tr>";
			$.each(result, function(i){
				str +="<td><input type='checkbox' name='iIds' value=" + result[i].iId + "></td>";
				str +="<td>" + result[i].iId + "</td>";
				str +="<td>" + result[i].iInstitution_name + "</td>";
				str +="<td>" + result[i].iInstitution_classification + "</td>";
				str +="<td>" + result[i].iNecessary_numbers_of_worker + "</td>";
				str +="<td>" + result[i].iWork_period + "</td>";
				str +="<td>" + result[i].iWork_type + "</td>";
				str +="<td>" + result[i].iNeed_ICU + "</td>";
				str +="<td>" + result[i].iAccomodation_Availability + "</td>";
				str +="<td>" + result[i].iRemarks + "</td>";
				str +="</tr>"
			});
				$("#request_place").append(str);
			} else {
				$("#request_place").find("tr").remove();
				var str="<tr><td colspan='10' align='center'> 검색된 상세기관이 없습니다.</td></tr>"
				$("#request_place").append(str);
			}
		},
			error:function(jqXHR, textStatus, errorThrown){
				alert("오류가 발생하였습니다. 다시 선택해주십시오.");
			}
		});
	}

