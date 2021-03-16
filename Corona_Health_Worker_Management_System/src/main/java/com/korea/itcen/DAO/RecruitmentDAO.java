package com.korea.itcen.DAO;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;

import com.korea.itcen.DTO.RecruitmentDTO;

public class RecruitmentDAO {

	DataSource dataSource;
	
	public RecruitmentDAO() {
		try {
			Context context = new InitialContext();
			dataSource = (DataSource) context.lookup("java:comp/env/jdbc/Oracle11g");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	//모집공고 작성
	public int write(String rTitle, Date rUpload_date, String rRecruitment_location_city, String rRecruitment_location_district, String rRecruitment_necessary_job, int rRecruitment_num_of_worker, String rContents) {
		int result = 0;
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		
		try {
			connection = dataSource.getConnection();
			String query = "insert into recruitment (rId, rTitle, rUpload_date, rHit, rStatus_of_recruitment, rRecruitment_location_city, rRecruitment_location_district, rRecruitment_necessary_job, rRecruitment_num_of_worker, rManager_department, rManager_call, rContents) values (recruitment_seq.nextval, ?, ?, 0, '모집중',?,?,?,?, '보건복지부','01011112222', ?)";
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setString(1,  rTitle);
			preparedStatement.setDate(2,  rUpload_date);
			preparedStatement.setString(3,  rRecruitment_location_city);
			preparedStatement.setString(4,  rRecruitment_location_district);
			preparedStatement.setString(5,  rRecruitment_necessary_job);
			preparedStatement.setInt(6,  rRecruitment_num_of_worker);
			preparedStatement.setString(7,  rContents);
			result = preparedStatement.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(preparedStatement != null) preparedStatement.close();
				if(connection != null) connection.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		} return result;
	}
	//가장 최근에 입력받은 행 꺼내기
	public int select_last_row() {
		int rId = 0;
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		
		try {
			connection = dataSource.getConnection();
			String query = "SELECT * FROM (SELECT * FROM RECRUITMENT ORDER BY RUPLOAD_DATE DESC) WHERE ROWNUM = 1";
			preparedStatement = connection.prepareStatement(query);
			resultSet = preparedStatement.executeQuery();
			if(resultSet.next()) {
				rId = resultSet.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(preparedStatement != null) preparedStatement.close();
				if(connection != null) connection.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		} return rId;
	}
	//전체 리스트 추출해내는 것
	public ArrayList<RecruitmentDTO> totallist(int startRow, int endRow) {
		
		ArrayList<RecruitmentDTO> dtos = new ArrayList<RecruitmentDTO>();
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		
		try {
			connection = dataSource.getConnection();
			
			String query = "select * from (select rownum rn, rId, rTitle, rUpload_date, rHit, rStatus_of_recruitment, rRecruitment_location_city, rRecruitment_location_district, rRecruitment_necessary_job, rRecruitment_num_of_worker, rManager_department, rManager_call, rContents from (select * from Recruitment order by rId desc)) where rn between ? and ?"; 
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setInt(1, startRow);
			preparedStatement.setInt(2, endRow);
			resultSet = preparedStatement.executeQuery();
			
			while (resultSet.next()) {
				int rId = resultSet.getInt("rId");
				String rTitle = resultSet.getString("rTitle");
				Timestamp rUpload_date = resultSet.getTimestamp("rUpload_date");
				int rHit = resultSet.getInt("rHit");
				String rStatus_of_recruitment = resultSet.getString("rStatus_of_recruitment");
				String rRecruitment_location_city = resultSet.getString("rRecruitment_location_city");
				String rRecruitment_location_district = resultSet.getString("rRecruitment_location_district");
				String rRecruitment_necessary_job = resultSet.getString("rRecruitment_necessary_job");
				int rRecruitment_num_of_worker = resultSet.getInt("rRecruitment_num_of_worker");
				String rManager_department = resultSet.getString("rManager_department");
				String rManager_call = resultSet.getString("rManager_call");
				String rContents = resultSet.getString("rContents");
				
				RecruitmentDTO recruitmentDto = new RecruitmentDTO(rId, rTitle, rUpload_date, rHit, rStatus_of_recruitment, rRecruitment_location_city, rRecruitment_location_district, rRecruitment_necessary_job, rRecruitment_num_of_worker, rManager_department, rManager_call, rContents);
				dtos.add(recruitmentDto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(resultSet != null) resultSet.close();
				if(preparedStatement != null) preparedStatement.close();
				if(connection != null) connection.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return dtos;
	}
	
	
	
	// 페이징 + 필터
	
	public ArrayList<RecruitmentDTO> list(int startRow, int endRow, String rRecruitment_location_city_opt, String rRecruitment_location_district_opt, String rRecruitment_necessary_job_opt) {
		
		ArrayList<RecruitmentDTO> dtos = new ArrayList<RecruitmentDTO>();
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		
		
		try {
			connection = dataSource.getConnection();
			// 지역과 직무 검색 조건을 다 설정하지 않았을 때
//			if (rRecruitment_location_city_opt.equals("N") && rRecruitment_location_district_opt.equals("N") && rRecruitment_necessary_job_opt.equals("N") ) {
			
				//rId, rTitle, rUpload_date, rHit, rStatus_of_recruitment, rRecruitment_location_city, rRecruitment_location_district, rRecruitment_necessary_job, rRecruitment_num_of_worker, rManager_department, rManager_call, rContents 
//				String query = "select * from (select rownum rn, rId, rTitle, rUpload_date, rHit, rStatus_of_recruitment, rRecruitment_location_city, rRecruitment_location_district, rRecruitment_necessary_job, rRecruitment_num_of_worker, rManager_department, rManager_call, rContents from (select * from Recruitment order by rId desc)) where rn between ? and ?";
				// bGroup desc 되어있기 때문에 게시글이 사용될 때마다 최근에 입력한 
//				preparedStatement = connection.prepareStatement(query);
//				preparedStatement.setInt(1, startRow);
//				preparedStatement.setInt(2, endRow);
//				resultSet = preparedStatement.executeQuery();
				
//				while (resultSet.next()) {
//					int rId = resultSet.getInt("rId");
//					String rTitle = resultSet.getString("rTitle");
//					Timestamp rUpload_date = resultSet.getTimestamp("rUpload_date");
//					int rHit = resultSet.getInt("rHit");
//					String rStatus_of_recruitment = resultSet.getString("rStatus_of_recruitment");
//					String rRecruitment_location_city = resultSet.getString("rRecruitment_location_city");
//					String rRecruitment_location_district = resultSet.getString("rRecruitment_location_district");
//					String rRecruitment_necessary_job = resultSet.getString("rRecruitment_necessary_job");
//					int rRecruitment_num_of_worker = resultSet.getInt("rRecruitment_num_of_worker");
//					String rManager_department = resultSet.getString("rManager_department");
//					String rManager_call = resultSet.getString("rManager_call");
//					String rContents = resultSet.getString("rContents");
//					
//					RecruitmentDTO recruitmentDto = new RecruitmentDTO(rId, rTitle, rUpload_date, rHit, rStatus_of_recruitment, rRecruitment_location_city, rRecruitment_location_district, rRecruitment_necessary_job, rRecruitment_num_of_worker, rManager_department, rManager_call, rContents);
//					dtos.add(recruitmentDto);
//				
//				}	
			
//			}
			// 지역(광역시, 도)는 선택하고 구,군,시는 선택하지 않았으며, 직무도 선택하지 않았을 때
			if(!rRecruitment_location_city_opt.equals("N") && rRecruitment_location_district_opt.equals("N") && rRecruitment_necessary_job_opt.equals("N")) {
				String query = "select * from (select rownum rn, rId, rTitle, rUpload_date, rHit, rStatus_of_recruitment, rRecruitment_location_city, rRecruitment_location_district, rRecruitment_necessary_job, rRecruitment_num_of_worker, rManager_department, rManager_call, rContents from (select * from Recruitment where rRecruitment_location_city = ? order by rId desc)) where rn between ? and ?";
				preparedStatement = connection.prepareStatement(query);
				preparedStatement.setString(1,  rRecruitment_location_city_opt);
				preparedStatement.setInt(2, startRow);
				preparedStatement.setInt(3, endRow);
				resultSet = preparedStatement.executeQuery();
				
				while (resultSet.next()) {
					int rId = resultSet.getInt("rId");
					String rTitle = resultSet.getString("rTitle");
					Timestamp rUpload_date = resultSet.getTimestamp("rUpload_date");
					int rHit = resultSet.getInt("rHit");
					String rStatus_of_recruitment = resultSet.getString("rStatus_of_recruitment");
					String rRecruitment_location_city = resultSet.getString("rRecruitment_location_city");
					String rRecruitment_location_district = resultSet.getString("rRecruitment_location_district");
					String rRecruitment_necessary_job = resultSet.getString("rRecruitment_necessary_job");
					int rRecruitment_num_of_worker = resultSet.getInt("rRecruitment_num_of_worker");
					String rManager_department = resultSet.getString("rManager_department");
					String rManager_call = resultSet.getString("rManager_call");
					String rContents = resultSet.getString("rContents");
					
					RecruitmentDTO recruitmentDto = new RecruitmentDTO(rId, rTitle, rUpload_date, rHit, rStatus_of_recruitment, rRecruitment_location_city, rRecruitment_location_district, rRecruitment_necessary_job, rRecruitment_num_of_worker, rManager_department, rManager_call, rContents);
					dtos.add(recruitmentDto);
				}
			} 
			// 지역(광역시,도,구,군,시)만 설정하였을 때
			else if(!rRecruitment_location_city_opt.equals("N") && !rRecruitment_location_district_opt.equals("N") && rRecruitment_necessary_job_opt.equals("N") ) {
				String query = "select * from (select rownum rn, rId, rTitle, rUpload_date, rHit, rStatus_of_recruitment, rRecruitment_location_city, rRecruitment_location_district, rRecruitment_necessary_job, rRecruitment_num_of_worker, rManager_department, rManager_call, rContents from (select * from Recruitment where rRecruitment_location_city = ? AND rRecruitment_location_district = ? order by rId desc)) where rn between ? and ?";
				preparedStatement = connection.prepareStatement(query);
				preparedStatement.setString(1, rRecruitment_location_city_opt);
				preparedStatement.setString(2, rRecruitment_location_district_opt);
				preparedStatement.setInt(3, startRow);
				preparedStatement.setInt(4, endRow);
				resultSet = preparedStatement.executeQuery();
			
				while (resultSet.next()) {
					int rId = resultSet.getInt("rId");
					String rTitle = resultSet.getString("rTitle");
					Timestamp rUpload_date = resultSet.getTimestamp("rUpload_date");
					int rHit = resultSet.getInt("rHit");
					String rStatus_of_recruitment = resultSet.getString("rStatus_of_recruitment");
					String rRecruitment_location_city = resultSet.getString("rRecruitment_location_city");
					String rRecruitment_location_district = resultSet.getString("rRecruitment_location_district");
					String rRecruitment_necessary_job = resultSet.getString("rRecruitment_necessary_job");
					int rRecruitment_num_of_worker = resultSet.getInt("rRecruitment_num_of_worker");
					String rManager_department = resultSet.getString("rManager_department");
					String rManager_call = resultSet.getString("rManager_call");
					String rContents = resultSet.getString("rContents");
					
					RecruitmentDTO recruitmentDto = new RecruitmentDTO(rId, rTitle, rUpload_date, rHit, rStatus_of_recruitment, rRecruitment_location_city, rRecruitment_location_district, rRecruitment_necessary_job, rRecruitment_num_of_worker, rManager_department, rManager_call, rContents);
					dtos.add(recruitmentDto);
				}
			} 
			// 지역(광역시,도)까지만 설정하고 직무를 선택하였을 때
			else if(!rRecruitment_location_city_opt.equals("N") && rRecruitment_location_district_opt.equals("N") && !rRecruitment_necessary_job_opt.equals("N") ){
				String query = "select * from (select rownum rn, rId, rTitle, rUpload_date, rHit, rStatus_of_recruitment, rRecruitment_location_city, rRecruitment_location_district, rRecruitment_necessary_job, rRecruitment_num_of_worker, rManager_department, rManager_call, rContents from (select * from Recruitment where rRecruitment_location_city = ? AND rRecruitment_necessary_job = ? order by rId desc)) where rn between ? and ?";
				preparedStatement = connection.prepareStatement(query);
				preparedStatement.setString(1, rRecruitment_location_city_opt);
				preparedStatement.setString(2, rRecruitment_necessary_job_opt);
				preparedStatement.setInt(3, startRow);
				preparedStatement.setInt(4, endRow);
				resultSet = preparedStatement.executeQuery();
				
				while (resultSet.next()) {
					int rId = resultSet.getInt("rId");
					String rTitle = resultSet.getString("rTitle");
					Timestamp rUpload_date = resultSet.getTimestamp("rUpload_date");
					int rHit = resultSet.getInt("rHit");
					String rStatus_of_recruitment = resultSet.getString("rStatus_of_recruitment");
					String rRecruitment_location_city = resultSet.getString("rRecruitment_location_city");
					String rRecruitment_location_district = resultSet.getString("rRecruitment_location_district");
					String rRecruitment_necessary_job = resultSet.getString("rRecruitment_necessary_job");
					int rRecruitment_num_of_worker = resultSet.getInt("rRecruitment_num_of_worker");
					String rManager_department = resultSet.getString("rManager_department");
					String rManager_call = resultSet.getString("rManager_call");
					String rContents = resultSet.getString("rContents");
					
					RecruitmentDTO recruitmentDto = new RecruitmentDTO(rId, rTitle, rUpload_date, rHit, rStatus_of_recruitment, rRecruitment_location_city, rRecruitment_location_district, rRecruitment_necessary_job, rRecruitment_num_of_worker, rManager_department, rManager_call, rContents);
					dtos.add(recruitmentDto);
				}
			}
			// 직무만 선택하였을 때
			else if(rRecruitment_location_city_opt.equals("N") && rRecruitment_location_district_opt.equals("N") && !rRecruitment_necessary_job_opt.equals("N") ){
				String query = "select * from (select rownum rn, rId, rTitle, rUpload_date, rHit, rStatus_of_recruitment, rRecruitment_location_city, rRecruitment_location_district, rRecruitment_necessary_job, rRecruitment_num_of_worker, rManager_department, rManager_call, rContents from (select * from Recruitment where rRecruitment_necessary_job = ? order by rId desc)) where rn between ? and ?";
				preparedStatement = connection.prepareStatement(query);
				preparedStatement.setString(1, rRecruitment_necessary_job_opt);
				preparedStatement.setInt(2, startRow);
				preparedStatement.setInt(3, endRow);
				resultSet = preparedStatement.executeQuery();
				
				while (resultSet.next()) {
					int rId = resultSet.getInt("rId");
					String rTitle = resultSet.getString("rTitle");
					Timestamp rUpload_date = resultSet.getTimestamp("rUpload_date");
					int rHit = resultSet.getInt("rHit");
					String rStatus_of_recruitment = resultSet.getString("rStatus_of_recruitment");
					String rRecruitment_location_city = resultSet.getString("rRecruitment_location_city");
					String rRecruitment_location_district = resultSet.getString("rRecruitment_location_district");
					String rRecruitment_necessary_job = resultSet.getString("rRecruitment_necessary_job");
					int rRecruitment_num_of_worker = resultSet.getInt("rRecruitment_num_of_worker");
					String rManager_department = resultSet.getString("rManager_department");
					String rManager_call = resultSet.getString("rManager_call");
					String rContents = resultSet.getString("rContents");
					
					RecruitmentDTO recruitmentDto = new RecruitmentDTO(rId, rTitle, rUpload_date, rHit, rStatus_of_recruitment, rRecruitment_location_city, rRecruitment_location_district, rRecruitment_necessary_job, rRecruitment_num_of_worker, rManager_department, rManager_call, rContents);
					dtos.add(recruitmentDto);
				}
			}
			// 전부 다 선택하였을 때
			else if(!rRecruitment_location_city_opt.equals("N") && !rRecruitment_location_district_opt.equals("N") && !rRecruitment_necessary_job_opt.equals("N") ) {
				String query = "select * from (select rownum rn, rId, rTitle, rUpload_date, rHit, rStatus_of_recruitment, rRecruitment_location_city, rRecruitment_location_district, rRecruitment_necessary_job, rRecruitment_num_of_worker, rManager_department, rManager_call, rContents from (select * from Recruitment where rRecruitment_location_city = ? AND rRecruitment_location_district = ? AND rRecruitment_necessary_job = ? order by rId desc)) where rn between ? and ?";
				preparedStatement = connection.prepareStatement(query);
				preparedStatement.setString(1, rRecruitment_location_city_opt);
				preparedStatement.setString(2, rRecruitment_location_district_opt);
				preparedStatement.setString(3, rRecruitment_necessary_job_opt);
				preparedStatement.setInt(4, startRow);
				preparedStatement.setInt(5, endRow);
				resultSet = preparedStatement.executeQuery();
				
				while (resultSet.next()) {
					int rId = resultSet.getInt("rId");
					String rTitle = resultSet.getString("rTitle");
					Timestamp rUpload_date = resultSet.getTimestamp("rUpload_date");
					int rHit = resultSet.getInt("rHit");
					String rStatus_of_recruitment = resultSet.getString("rStatus_of_recruitment");
					String rRecruitment_location_city = resultSet.getString("rRecruitment_location_city");
					String rRecruitment_location_district = resultSet.getString("rRecruitment_location_district");
					String rRecruitment_necessary_job = resultSet.getString("rRecruitment_necessary_job");
					int rRecruitment_num_of_worker = resultSet.getInt("rRecruitment_num_of_worker");
					String rManager_department = resultSet.getString("rManager_department");
					String rManager_call = resultSet.getString("rManager_call");
					String rContents = resultSet.getString("rContents");
					
					RecruitmentDTO recruitmentDto = new RecruitmentDTO(rId, rTitle, rUpload_date, rHit, rStatus_of_recruitment, rRecruitment_location_city, rRecruitment_location_district, rRecruitment_necessary_job, rRecruitment_num_of_worker, rManager_department, rManager_call, rContents);
					dtos.add(recruitmentDto);
				}
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(resultSet != null) resultSet.close();
				if(preparedStatement != null) preparedStatement.close();
				if(connection != null) connection.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return dtos;
	}
	
	// 총 레코드 수 구하는 로직
	public int getCount() {
		int count = 0;
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		
		try {
			connection = dataSource.getConnection();
			String query = "select count(*) from Recruitment";
			preparedStatement = connection.prepareStatement(query);
			resultSet = preparedStatement.executeQuery();
			if(resultSet.next()) {
				count = resultSet.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(resultSet != null) resultSet.close();
				if(preparedStatement != null) preparedStatement.close();
				if(connection != null) connection.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		} return count;
	}
	
	
	
	

	
	// 검색 후 페이지에 나타낼 총 레코드 수 계싼
	public int getfCount(String rRecruitment_location_city_opt, String rRecruitment_location_district_opt, String rRecruitment_necessary_job_opt) {
		int fCount = 0;
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		try {
			connection = dataSource.getConnection();
			// 지역과 직무 검색 조건을 다 설정하지 않았을 때
			if (rRecruitment_location_city_opt.equals("N") && rRecruitment_location_district_opt.equals("N") && rRecruitment_necessary_job_opt.equals("N") ) {
//				String query = "select count(*) from Recruitment";
//				preparedStatement = connection.prepareStatement(query);
//				resultSet = preparedStatement.executeQuery();
//				
//				if(resultSet.next()) {
//					fCount = resultSet.getInt(1);
//				}
				fCount = 0;
			} 
			// 지역(광역시, 도)는 선택하고 구,군,시는 선택하지 않았으며, 직무도 선택하지 않았을 
			if(!rRecruitment_location_city_opt.equals("N") && rRecruitment_location_district_opt.equals("N") && rRecruitment_necessary_job_opt.equals("N") ) {
				String query = "select count(*) from Recruitment where rRecruitment_location_city = ?";
				preparedStatement = connection.prepareStatement(query);
				preparedStatement.setString(1, rRecruitment_location_city_opt);
				resultSet = preparedStatement.executeQuery();
				
				if(resultSet.next()) {
					fCount = resultSet.getInt(1);
				}
			} 
			// 지역(광역시,도,구,군,시)만 설정하였을 때
			else if(!rRecruitment_location_city_opt.equals("N") && !rRecruitment_location_district_opt.equals("N") && rRecruitment_necessary_job_opt.equals("N") ) {
				String query = "select count(*) from Recruitment where rRecruitment_location_city =? AND rRecruitment_location_district = ?";
				preparedStatement = connection.prepareStatement(query);
				preparedStatement.setString(1, rRecruitment_location_city_opt);
				preparedStatement.setString(2, rRecruitment_location_district_opt);
				resultSet = preparedStatement.executeQuery();
				
				if(resultSet.next()) {
					fCount = resultSet.getInt(1);
				}
			} 
			// 지역(광역시,도)까지만 설정하고 직무를 선택하였을 때
			else if(!rRecruitment_location_city_opt.equals("N") && rRecruitment_location_district_opt.equals("N") && !rRecruitment_necessary_job_opt.equals("N") ) {
				String query = "select count(*) from Recruitment where rRecruitment_location_city = ? AND rRecruitment_necessary_job = ?";
				preparedStatement = connection.prepareStatement(query);
				preparedStatement.setString(1, rRecruitment_location_city_opt);
				preparedStatement.setString(2, rRecruitment_necessary_job_opt);
				resultSet = preparedStatement.executeQuery();
				
				if(resultSet.next()) {
					fCount = resultSet.getInt(1);
				}
			}
			// 직무만 선택하였을 때
			else if(rRecruitment_location_city_opt.equals("N") && rRecruitment_location_district_opt.equals("N") && !rRecruitment_necessary_job_opt.equals("N") ) {
				String query = "select count(*) from Recruitment where rRecruitment_necessary_job = ?";
				preparedStatement = connection.prepareStatement(query);
				preparedStatement.setString(1, rRecruitment_necessary_job_opt);

				resultSet = preparedStatement.executeQuery();
				
				if(resultSet.next()) {
					fCount = resultSet.getInt(1);
				}
			}
			//전부 선택하였을 때
			else if(!rRecruitment_location_city_opt.equals("N") && !rRecruitment_location_district_opt.equals("N") && !rRecruitment_necessary_job_opt.equals("N") ) {
				String query = "select count(*) from Recruitment where rRecruitment_location_city = ? AND rRecruitment_location_district = ? AND rRecruitment_necessary_job =?";
				preparedStatement = connection.prepareStatement(query);
				preparedStatement.setString(1, rRecruitment_location_city_opt);
				preparedStatement.setString(2, rRecruitment_location_district_opt);
				preparedStatement.setString(3, rRecruitment_necessary_job_opt);
				resultSet = preparedStatement.executeQuery();
				
				if(resultSet.next()) {
					fCount = resultSet.getInt(1);
				}
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(resultSet != null) resultSet.close();
				if(preparedStatement != null) preparedStatement.close();
				if(connection != null) connection.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		} return fCount;

	}
	
	
	
	public RecruitmentDTO contentView(String strID) {
		upHit(strID);
		
		RecruitmentDTO recruitmentdto = null;
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		
		try {
			connection = dataSource.getConnection();
			
			String query = "select * from recruitment where rId = ?";
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setInt(1,  Integer.parseInt(strID));
			resultSet = preparedStatement.executeQuery();
			
			if(resultSet.next()) {

				int rId = resultSet.getInt("rId");
				String rTitle = resultSet.getString("rTitle");
				Timestamp rUpload_date = resultSet.getTimestamp("rUpload_date");
				int rHit = resultSet.getInt("rHit");
				String rStatus_of_recruitment = resultSet.getString("rStatus_of_recruitment");
				String rRecruitment_location_city = resultSet.getString("rRecruitment_location_city");
				String rRecruitment_location_district = resultSet.getString("rRecruitment_location_district");
				String rRecruitment_necessary_job = resultSet.getString("rRecruitment_necessary_job");
				int rRecruitment_num_of_worker = resultSet.getInt("rRecruitment_num_of_worker");
				String rManager_department = resultSet.getString("rManager_department");
				String rManager_call = resultSet.getString("rManager_call");
				String rContents = resultSet.getString("rContents");
				
				recruitmentdto = new RecruitmentDTO(rId, rTitle, rUpload_date, rHit, rStatus_of_recruitment, rRecruitment_location_city, rRecruitment_location_district, rRecruitment_necessary_job, rRecruitment_num_of_worker, rManager_department, rManager_call, rContents);
	
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(resultSet != null) resultSet.close();
				if(preparedStatement != null) preparedStatement.close();
				if(connection != null) connection.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return recruitmentdto;
	}
	
	public RecruitmentDTO get_Recruitment_for_apply(int aRecruitment_number){
		RecruitmentDTO recruitmentDto = null;
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		try {
			connection = dataSource.getConnection();
			String query = "select * from Recruitment where rId = ?";
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setInt(1, aRecruitment_number);
			resultSet = preparedStatement.executeQuery();

			if (resultSet.next()) {
				String rTitle = resultSet.getString("rTitle");
				Timestamp rUpload_date = resultSet.getTimestamp("rUpload_date");
				int rHit = resultSet.getInt("rHit");
				String rStatus_of_recruitment = resultSet.getString("rStatus_of_recruitment");
				String rRecruitment_location_city = resultSet.getString("rRecruitment_location_city");
				String rRecruitment_location_district = resultSet.getString("rRecruitment_location_district");
				String rRecruitment_necessary_job = resultSet.getString("rRecruitment_necessary_job");
				int rRecruitment_num_of_worker = resultSet.getInt("rRecruitment_num_of_worker");
				String rManager_department = resultSet.getString("rManager_department");
				String rManager_call = resultSet.getString("rManager_call");
				String rContents = resultSet.getString("rContents");
			
				recruitmentDto = new RecruitmentDTO(aRecruitment_number, rTitle, rUpload_date, rHit, rStatus_of_recruitment, rRecruitment_location_city, rRecruitment_location_district, rRecruitment_necessary_job, rRecruitment_num_of_worker, rManager_department, rManager_call, rContents);
				
			}
		}catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(resultSet != null) resultSet.close();
				if(preparedStatement != null) preparedStatement.close();
				if(connection != null) connection.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		} return recruitmentDto;
		
	}
	
	public int end(int rId) {
		int rn = 0;
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		try {
			connection = dataSource.getConnection();
			String query = "update recruitment set rStatus_of_recruitment = '마감' where rId = ?";
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setInt(1, rId);
			rn = preparedStatement.executeUpdate();
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		try {
			if(resultSet != null) resultSet.close();
			if(preparedStatement != null) preparedStatement.close();
			if(connection != null) connection.close();
		} catch (Exception e2) {
			e2.printStackTrace();
		}
	} return rn;
		
	}
	
	
	public int modify(int rId, String rTitle, String rContents, int rRecruitment_num_of_worker) {
		
		int rn = 0;
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		
		try {
			connection = dataSource.getConnection();
			
			String query = "update recruitment set rTitle = ?, rContents = ?, rRecruitment_num_of_worker = ? where rId = ?";
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setString(1,  rTitle);
			preparedStatement.setString(2,  rContents);
			preparedStatement.setInt(3,  rRecruitment_num_of_worker);
			preparedStatement.setInt(4,  rId);
			rn = preparedStatement.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(preparedStatement != null) preparedStatement.close();
				if(connection != null) connection.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		} return rn;
		
	}
	
	public int delete(int rId) {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		int rn = 0;
		try {
			
			connection = dataSource.getConnection();
			String query = "delete from recruitment where rId = ?";
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setInt(1,  rId);
			rn = preparedStatement.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(preparedStatement != null) preparedStatement.close();
				if(connection != null) connection.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		} return rn;
	}
	

	private void upHit (String rId) {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		try {
			connection = dataSource.getConnection();
			String query = "update Recruitment set Rhit = Rhit + 1 where rId = ?";
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setString(1, rId);
			
			int rn = preparedStatement.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(preparedStatement != null) preparedStatement.close();
				if(connection != null) connection.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	}
	

	
}


	