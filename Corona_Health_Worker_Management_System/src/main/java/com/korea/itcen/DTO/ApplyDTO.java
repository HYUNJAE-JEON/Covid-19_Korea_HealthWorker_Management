package com.korea.itcen.DTO;

import java.sql.Date;

public class ApplyDTO {


	public int getaId() {
		return aId;
	}

	public void setaId(int aId) {
		this.aId = aId;
	}

	public String getaHope_institution() {
		return aHope_institution;
	}

	public void setaHope_institution(String aHope_institution) {
		this.aHope_institution = aHope_institution;
	}

	public Date getaHope_work_period_start() {
		return aHope_work_period_start;
	}

	public void setaHope_work_period_start(Date aHope_work_period_start) {
		this.aHope_work_period_start = aHope_work_period_start;
	}

	public Date getaHope_work_period_end() {
		return aHope_work_period_end;
	}

	public void setaHope_work_period_end(Date aHope_work_period_end) {
		this.aHope_work_period_end = aHope_work_period_end;
	}

	public int getaYears_of_exp_in_this_area() {
		return aYears_of_exp_in_this_area;
	}

	public void setaYears_of_exp_in_this_area(int aYears_of_exp_in_this_area) {
		this.aYears_of_exp_in_this_area = aYears_of_exp_in_this_area;
	}

	public String getaInstitution_of_experience() {
		return aInstitution_of_experience;
	}

	public void setaInstitution_of_experience(String aInstitution_of_experience) {
		this.aInstitution_of_experience = aInstitution_of_experience;
	}

	public String getaStatus_of_dispatch_apply() {
		return aStatus_of_dispatch_apply;
	}

	public void setaStatus_of_dispatch_apply(String aStatus_of_dispatch_apply) {
		this.aStatus_of_dispatch_apply = aStatus_of_dispatch_apply;
	}

	public int getaRecruitment_number() {
		return aRecruitment_number;
	}

	public void setaRecruitment_number(int aRecruitment_number) {
		this.aRecruitment_number = aRecruitment_number;
	}

	public String getaMemberID() {
		return aMemberID;
	}

	public void setaMemberID(String aMemberID) {
		this.aMemberID = aMemberID;
	}

	public String getaApply_location_city() {
		return aApply_location_city;
	}

	public void setaApply_location_city(String aApply_location_city) {
		this.aApply_location_city = aApply_location_city;
	}

	public String getaApply_location_district() {
		return aApply_location_district;
	}

	public void setaApply_location_district(String aApply_location_district) {
		this.aApply_location_district = aApply_location_district;
	}

	public String getaApply_job() {
		return aApply_job;
	}

	public void setaApply_job(String aApply_job) {
		this.aApply_job = aApply_job;
	}
	
	int aId;
	String aHope_institution;
	Date aHope_work_period_start;
	Date aHope_work_period_end;
	int aYears_of_exp_in_this_area;
	String aInstitution_of_experience;
	String aStatus_of_dispatch_apply;
	int aRecruitment_number;
	String aMemberID;
	String aApply_location_city;
	String aApply_location_district;
	String aApply_job;

	public ApplyDTO() {
		
	}
	
	public ApplyDTO(int aId, String aHope_institution, Date aHope_work_period_start, Date aHope_work_period_end, int aYears_of_exp_in_this_area, String aInstitution_of_experience, String aStatus_of_dispatch_apply, int aRecruitment_number, String aMemberID, String aApply_location_city, String aApply_location_district, String aApply_job) {
		
		this.aId = aId;
		this.aHope_institution = aHope_institution;
		this.aHope_work_period_start = aHope_work_period_start;
		this.aHope_work_period_end = aHope_work_period_end;
		this.aYears_of_exp_in_this_area = aYears_of_exp_in_this_area;
		this.aInstitution_of_experience = aInstitution_of_experience;
		this.aStatus_of_dispatch_apply = aStatus_of_dispatch_apply;
		this.aRecruitment_number = aRecruitment_number;
		this.aMemberID = aMemberID; 
		this.aApply_location_city = aApply_location_city;
		this.aApply_location_district = aApply_location_district;
		this.aApply_job = aApply_job;
		
		
	}
}
