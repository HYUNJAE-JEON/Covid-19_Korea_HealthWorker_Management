package com.korea.itcen.DTO;

import java.sql.Date;
import java.sql.Timestamp;

public class WorkerDTO {


	
	public String getwId() {
		return wId;
	}
	public void setwId(String wId) {
		this.wId = wId;
	}
	public String getwPw() {
		return wPw;
	}
	public void setwPw(String wPw) {
		this.wPw = wPw;
	}
	public String getwName() {
		return wName;
	}
	public void setwName(String wName) {
		this.wName = wName;
	}
	public Date getwBirthdate() {
		return wBirthdate;
	}
	public void setwBirthdate(Date wBirthdate) {
		this.wBirthdate = wBirthdate;
	}
	public String getwPhone_number() {
		return wPhone_number;
	}
	public void setwPhone_number(String wPhone_number) {
		this.wPhone_number = wPhone_number;
	}
	public String getwSex() {
		return wSex;
	}
	public void setwSex(String wSex) {
		this.wSex = wSex;
	}
	public String getwCertificate_number() {
		return wCertificate_number;
	}
	public void setwCertificate_number(String wCertificate_number) {
		this.wCertificate_number = wCertificate_number;
	}
	public String getwJob() {
		return wJob;
	}
	public void setwJob(String wJob) {
		this.wJob = wJob;
	}
	public int getwClinical_experience() {
		return wClinical_experience;
	}
	public void setwClinical_experience(int wClinical_experience) {
		this.wClinical_experience = wClinical_experience;
	}
	public int getwMajor_career_years() {
		return wMajor_career_years;
	}
	public void setwMajor_career_years(int wMajor_career_years) {
		this.wMajor_career_years = wMajor_career_years;
	}
	public String getwMajor_career_institution() {
		return wMajor_career_institution;
	}
	public void setwMajor_career_institution(String wMajor_career_institution) {
		this.wMajor_career_institution = wMajor_career_institution;
	}
	public String getwStatus_of_employment() {
		return wStatus_of_employment;
	}
	public void setwStatus_of_employment(String wStatus_of_employment) {
		this.wStatus_of_employment = wStatus_of_employment;
	}
	public String getwCovid_19_clinical_experience() {
		return wCovid_19_clinical_experience;
	}
	public void setwCovid_19_clinical_experience(String wCovid_19_clinical_experience) {
		this.wCovid_19_clinical_experience = wCovid_19_clinical_experience;
	}
	public String getwStatus_of_apply() {
		return wStatus_of_apply;
	}
	public void setwStatus_of_apply(String wStatus_of_apply) {
		this.wStatus_of_apply = wStatus_of_apply;
	}
	public String getwEmail() {
		return wEmail;
	}
	public void setwEmail(String wEmail) {
		this.wEmail = wEmail;
	}
	public Timestamp getwDate() {
		return wDate;
	}
	public void setwDate(Timestamp wDate) {
		this.wDate = wDate;
	}
	public String getwAddress() {
		return wAddress;
	}
	public void setwAddress(String wAddress) {
		this.wAddress = wAddress;
	}
	private String wId;
	private String wPw;
	private String wName;
	private Date wBirthdate;
	private String wAddress;
	private String wPhone_number;
	private String wEmail;
	private String wSex;
	private String wCertificate_number;
	private String wJob;
	private int wClinical_experience;
	private int wMajor_career_years;
	private String wMajor_career_institution;
	private String wStatus_of_employment;
	private String wCovid_19_clinical_experience;
	private String wStatus_of_apply;
	private Timestamp wDate;
	
	
	
	
}
