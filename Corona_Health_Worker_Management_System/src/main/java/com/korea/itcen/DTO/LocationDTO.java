package com.korea.itcen.DTO;

public class LocationDTO {

	public LocationDTO() {}
	
	public String getLocation_city() {
		return Location_city;
	}
	public void setLocation_city(String location_city) {
		Location_city = location_city;
	}
	public String getLocation_district() {
		return Location_district;
	}
	public void setLocation_district(String location_district) {
		Location_district = location_district;
	}
	
	String Location_city;
	String Location_district;
	
	public LocationDTO(String Location_city, String Location_district) {
		this.Location_city = Location_city;
		this.Location_district = Location_district;
	}
	
}
