package com.korea.itcen.DAO;

import java.util.ArrayList;

import com.korea.itcen.DTO.LocationDTO;

public interface LocationDAOInterface {

	// 시, 도 호출
	public ArrayList<LocationDTO> locationDB_Call_City();
	// 각 시, 도에 맞는 구,시 호출 
	public ArrayList<LocationDTO> locationDB_Call_District(String location_city_selected);
}
