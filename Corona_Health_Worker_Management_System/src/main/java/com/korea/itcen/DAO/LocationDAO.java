package com.korea.itcen.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;

import com.korea.itcen.DTO.LocationDTO;

public class LocationDAO {
	
	DataSource dataSource;
		
	public LocationDAO(){
			try {
				Context context = new InitialContext();
				dataSource = (DataSource) context.lookup("java:comp/env/jdbc/Oracle11g");
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	
	public ArrayList<LocationDTO> locationDB_Call_City() {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		ArrayList<LocationDTO> List_location = new ArrayList<LocationDTO>();
		
		
		try {
			connection = dataSource.getConnection();
			String query = "select distinct Location_city from location";
			preparedStatement = connection.prepareStatement(query);
			resultSet = preparedStatement.executeQuery();
			
			while(resultSet.next()) {
				String Location_city = resultSet.getString("Location_city");
				String Location_district = "";
				LocationDTO locationDTO = new LocationDTO(Location_city,Location_district);
				List_location.add(locationDTO);
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(preparedStatement != null) preparedStatement.close();
				if(connection != null) connection.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		} return List_location;
	}
	
	public ArrayList<LocationDTO> locationDB_Call_District(String location_city_selected) {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		ArrayList<LocationDTO> List_location = new ArrayList<LocationDTO>();
		
		try {
			connection = dataSource.getConnection();
			String query = "select Location_district from location where Location_city = ?";
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setString(1,  location_city_selected);
			resultSet = preparedStatement.executeQuery();
			
			while(resultSet.next()) {
				String Location_city = "";
				String Location_district = resultSet.getString("Location_district");
				LocationDTO locationDTO = new LocationDTO(Location_city,Location_district);
				List_location.add(locationDTO);
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(preparedStatement != null) preparedStatement.close();
				if(connection != null) connection.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		} return List_location;
	}
	
	public ArrayList<String> locationDB_call_District(String location_city_selected) {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		ArrayList<String> List_district_location = new ArrayList<String>();
		
		try {
			connection = dataSource.getConnection();
			String query = "select Location_district from location where Location_city = ?";
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setString(1,  location_city_selected);
			resultSet = preparedStatement.executeQuery();
			
			while(resultSet.next()) {
				String Location_district = resultSet.getString("Location_district");
				List_district_location.add(Location_district);
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(preparedStatement != null) preparedStatement.close();
				if(connection != null) connection.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		} return List_district_location;
	}
	
}
