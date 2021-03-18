package com.korea.itcen.DAO;

import java.sql.Date;
import java.util.ArrayList;

import com.korea.itcen.DTO.ApplyDTO;

public interface ApplyDAOInterface {

	// 사용자_파견지원서 작성
	public int Apply_write(String aHope_institution, Date aHope_work_period_start, Date aHope_work_period_end, int aYears_of_exp_in_this_area, String aInstitution_of_experience, int aRecruitment_number, String aMemberID, String aApply_location_city, String aApply_location_district, String aApply_job);
	// 사용자_파견지원서 수정
	public int Apply_modify(int aId, String aHope_institution, Date aHope_work_period_start, Date aHope_work_period_end, int aYears_of_exp_in_this_area, String aInstitution_of_experience);
	// 사용자_파견지원서 삭제
	public int Apply_cancel(int aId);
	// 사용자_내가 신청한 파견지원서 목록 보기
	public ArrayList<ApplyDTO> getApply_list(String aMemberID);
	// 사용자_신청한 파견지원 개수 파악
	public int ApplyCount(String aMemberID);
	// 사용자_파견지원서 수정페이지 진입 시 해당하는 지원서 노출
	public ApplyDTO getApply(int aId);
	// 사용자_파견지원 신청 시 중복이나 마감체크
	public int checkApply(String wId, String rId);
	
	
	// 관리자_해당 기관에 지원한 지원자 리스트
	public ApplyDTO getApply_for_workerlist(String wId, int iRecruitment_post_number);
	// 관리자_선택한 지원자의 지원상태 변경
	public int Apply_modify_status(String aStatus_of_dispatch_apply, String aMemberId, int aRecruitment_number);
	// 관리자_모집공고에 해당하는 지원자 수
	public int rApplyCount(int rId);
	// 관리자_ 모집기관에 해당하는 지원자 수
	public int iApplyCount(String iInstitution_name);


}
