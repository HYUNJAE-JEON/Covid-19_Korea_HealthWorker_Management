package com.korea.itcen.DTO;

import java.sql.Timestamp;

public class RecruitmentDTO {

	public RecruitmentDTO() {
		
	}
	

	public int getrId() {
		return rId;
	}

	public void setrId(int rId) {
		this.rId = rId;
	}

	public String getrTitle() {
		return rTitle;
	}

	public void setrTitle(String rTitle) {
		this.rTitle = rTitle;
	}

	public Timestamp getrUpload_date() {
		return rUpload_date;
	}

	public void setrUpload_date(Timestamp rUpload_date) {
		this.rUpload_date = rUpload_date;
	}

	public int getrHit() {
		return rHit;
	}

	public void setrHit(int rHit) {
		this.rHit = rHit;
	}

	public String getrStatus_of_recruitment() {
		return rStatus_of_recruitment;
	}

	public void setrStatus_of_recruitment(String rStatus_of_recruitment) {
		this.rStatus_of_recruitment = rStatus_of_recruitment;
	}

	public String getrRecruitment_location_city() {
		return rRecruitment_location_city;
	}

	public void setrRecruitment_location_city(String rRecruitment_location_city) {
		this.rRecruitment_location_city = rRecruitment_location_city;
	}

	public String getrRecruitment_location_district() {
		return rRecruitment_location_district;
	}

	public void setrRecruitment_location_district(String rRecruitment_location_district) {
		this.rRecruitment_location_district = rRecruitment_location_district;
	}

	public String getrRecruitment_necessary_job() {
		return rRecruitment_necessary_job;
	}

	public void setrRecruitment_necessary_job(String rRecruitment_necessary_job) {
		this.rRecruitment_necessary_job = rRecruitment_necessary_job;
	}

	public int getrRecruitment_num_of_worker() {
		return rRecruitment_num_of_worker;
	}

	public void setrRecruitment_num_of_worker(int rRecruitment_num_of_worker) {
		this.rRecruitment_num_of_worker = rRecruitment_num_of_worker;
	}

	public String getrManager_department() {
		return rManager_department;
	}

	public void setrManager_department(String rManager_department) {
		this.rManager_department = rManager_department;
	}

	public String getrManager_call() {
		return rManager_call;
	}

	public void setrManager_call(String rManager_call) {
		this.rManager_call = rManager_call;
	}

	public String getrContents() {
		return rContents;
	}

	public void setrContents(String rContents) {
		this.rContents = rContents;
	}

	int rId;
	String rTitle;
	Timestamp rUpload_date;
	int rHit;
	String rStatus_of_recruitment;
	String rRecruitment_location_city;
	String rRecruitment_location_district;
	String rRecruitment_necessary_job;
	int rRecruitment_num_of_worker;
	String rManager_department;
	String rManager_call;
	String rContents;
	


	public RecruitmentDTO(int rId, String rTitle, Timestamp rUpload_date, int rHit, String rStatus_of_recruitment, String rRecruitment_location_city, String rRecruitment_location_district, String rRecruitment_necessary_job, int rRecruitment_num_of_worker, String rManager_department, String rManager_call, String rContents) {
		this.rId = rId;
		this.rTitle = rTitle;
		this.rUpload_date = rUpload_date;
		this.rHit = rHit;
		this.rStatus_of_recruitment = rStatus_of_recruitment;
		this.rRecruitment_location_city = rRecruitment_location_city;
		this.rRecruitment_location_district = rRecruitment_location_district;
		this.rRecruitment_necessary_job = rRecruitment_necessary_job;
		this.rRecruitment_num_of_worker = rRecruitment_num_of_worker;
		this.rManager_department = rManager_department;
		this.rManager_call = rManager_call;
		this.rContents = rContents;
	}
}
