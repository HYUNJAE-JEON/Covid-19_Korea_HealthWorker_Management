package com.korea.itcen.DAO;

import java.sql.Date;
import java.util.ArrayList;

import com.korea.itcen.DTO.RecruitmentDTO;

public interface RecruitmentDAOInterface {
	// 관리자_모집공고 작성
	public int Recruitment_write(String rTitle, Date rUpload_date, String rRecruitment_location_city, String rRecruitment_location_district, String rRecruitment_necessary_job, int rRecruitment_num_of_worker, String rContents);
	// 관리자_모집공고 마감
	public int Recruitment_end(int rId);
	// 관리자_모집공고 수정
	public int Recruitment_modify(int rId, String rTitle, String rContents, int rRecruitment_num_of_worker);
	// 관리자_모집공고 삭제
	public int Recruitment_delete(int rId);
	// 모집공고 전체 노출
	public ArrayList<RecruitmentDTO> Recruitment_totallist(int startRow, int endRow);
	// 모집공고 필터 적용 후 노출
	public ArrayList<RecruitmentDTO> Recruitment_list_paging_filter(int startRow, int endRow, String rRecruitment_location_city_opt, String rRecruitment_location_district_opt, String rRecruitment_necessary_job_opt);
	// 모집공고 전체 수
	public int Recruitment_Count();
	// 모집공고 필터 적용 후 수
	public int Recruitment_Count_Paging_filter(String rRecruitment_location_city_opt, String rRecruitment_location_district_opt, String rRecruitment_necessary_job_opt);
	// 모집공고의 상세내용 확인
	public RecruitmentDTO Recruitment_ContentView(String StrId);
	// 모집공고 수정 또는 지원내역 수정시
	public RecruitmentDTO get_Recruitment_for_apply(int aRecruitment_number);
	// 마지막에 입력받은 모집공고 내역 꺼내기 (다른 메소드 사용을 위해)
	public int Recruitment_select_last_row();
	// 모집공고 조회 수 확인
	public void Recruitment_upHit (String rId);
	
}
