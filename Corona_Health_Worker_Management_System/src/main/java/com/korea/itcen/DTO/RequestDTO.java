package com.korea.itcen.DTO;

import java.sql.Date;
import java.sql.Timestamp;

public class RequestDTO {

	public RequestDTO() {
		
	}

	public int getiId() {
		return iId;
	}

	public void setiId(int iId) {
		this.iId = iId;
	}

	public String getiInstitution_name() {
		return iInstitution_name;
	}

	public void setiInstitution_name(String iInstitution_name) {
		this.iInstitution_name = iInstitution_name;
	}

	public String getiInstitution_classification() {
		return iInstitution_classification;
	}

	public void setiInstitution_classification(String iInstitution_classification) {
		this.iInstitution_classification = iInstitution_classification;
	}

	public String getiNecessary_Job() {
		return iNecessary_Job;
	}

	public void setiNecessary_Job(String iNecessary_Job) {
		this.iNecessary_Job = iNecessary_Job;
	}

	public String getiNeed_ICU() {
		return iNeed_ICU;
	}

	public void setiNeed_ICU(String iNeed_ICU) {
		this.iNeed_ICU = iNeed_ICU;
	}

	public int getiNecessary_numbers_of_worker() {
		return iNecessary_numbers_of_worker;
	}

	public void setiNecessary_numbers_of_worker(int iNecessary_numbers_of_worker) {
		this.iNecessary_numbers_of_worker = iNecessary_numbers_of_worker;
	}

	public String getiWork_type() {
		return iWork_type;
	}

	public void setiWork_type(String iWork_type) {
		this.iWork_type = iWork_type;
	}

	public int getiWork_period() {
		return iWork_period;
	}

	public void setiWork_period(int iWork_period) {
		this.iWork_period = iWork_period;
	}

	public String getiAccomodation_Availability() {
		return iAccomodation_Availability;
	}

	public void setiAccomodation_Availability(String iAccomodation_Availability) {
		this.iAccomodation_Availability = iAccomodation_Availability;
	}

	public int getiNecessary_carrer_years() {
		return iNecessary_carrer_years;
	}

	public void setiNecessary_carrer_years(int iNecessary_carrer_years) {
		this.iNecessary_carrer_years = iNecessary_carrer_years;
	}

	public String getiRequest_location_city() {
		return iRequest_location_city;
	}

	public void setiRequest_location_city(String iRequest_location_city) {
		this.iRequest_location_city = iRequest_location_city;
	}

	public String getiRequest_location_district() {
		return iRequest_location_district;
	}

	public void setiRequest_location_district(String iRequest_location_district) {
		this.iRequest_location_district = iRequest_location_district;
	}

	public String getiRepresentative_number() {
		return iRepresentative_number;
	}

	public void setiRepresentative_number(String iRepresentative_number) {
		this.iRepresentative_number = iRepresentative_number;
	}

	public String getiRepresentative_email() {
		return iRepresentative_email;
	}

	public void setiRepresentative_email(String iRepresentative_email) {
		this.iRepresentative_email = iRepresentative_email;
	}

	public Timestamp getiRequest_Date() {
		return iRequest_Date;
	}

	public void setiRequest_Date(Timestamp iRequest_Date) {
		this.iRequest_Date = iRequest_Date;
	}

	public String getiStatus_of_request() {
		return iStatus_of_request;
	}

	public void setiStatus_of_request(String iStatus_of_request) {
		this.iStatus_of_request = iStatus_of_request;
	}

	public String getiRemarks() {
		return iRemarks;
	}

	public void setiRemarks(String iRemarks) {
		this.iRemarks = iRemarks;
	}

	public int getiRecruitment_post_number() {
		return iRecruitment_post_number;
	}

	public void setiRecruitment_post_number(int iRecruitment_post_number) {
		this.iRecruitment_post_number = iRecruitment_post_number;
	}


	int iId;
	String iInstitution_name;
	String iInstitution_classification;
	String iNecessary_Job;
	String iNeed_ICU;
	int iNecessary_numbers_of_worker;
	String iWork_type;
	int iWork_period;
	String iAccomodation_Availability;
	int iNecessary_carrer_years;
	String iRequest_location_city;
	String iRequest_location_district;
	String iRepresentative_number;
	String iRepresentative_email;
	Timestamp iRequest_Date;
	String iStatus_of_request;
	String iRemarks;
	int iRecruitment_post_number;

	public RequestDTO(int iId, String iInstitution_name, String iInstitution_classification, String iNecessary_Job, String iNeed_ICU, int iNecessary_numbers_of_worker, String iWork_type, int iWork_period, String iAccomodation_Availability, int iNecessary_carrer_years, String iRequest_location_city, String iRequest_location_district, String	iRepresentative_number, String iRepresentative_email, Timestamp iRequest_Date, String iStatus_of_request, String iRemarks, int iRecruitment_post_number) {
	
		this.iId = iId;
		this.iInstitution_name = iInstitution_name;
		this.iInstitution_classification = iInstitution_classification;
		this.iNecessary_Job = iNecessary_Job;
		this.iNeed_ICU = iNeed_ICU;
		this.iNecessary_numbers_of_worker = iNecessary_numbers_of_worker;
		this.iWork_type = iWork_type;
		this.iWork_period = iWork_period;
		this.iAccomodation_Availability = iAccomodation_Availability;
		this.iNecessary_carrer_years = iNecessary_carrer_years;
		this.iRequest_location_city = iRequest_location_city;
		this.iRequest_location_district = iRequest_location_district;
		this.iRepresentative_number = iRepresentative_number;
		this.iRepresentative_email = iRepresentative_email;
		this.iRequest_Date = iRequest_Date;
		this.iStatus_of_request = iStatus_of_request;
		this.iRemarks = iRemarks;
		this.iRecruitment_post_number = iRecruitment_post_number;
		
		
	}

}
