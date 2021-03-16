package com.korea.itcen.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;

import com.korea.itcen.DTO.RequestDTO;

public class RequestDAO {

	DataSource dataSource;
	
	public RequestDAO() {
		try {
			Context context = new InitialContext();
			dataSource = (DataSource) context.lookup("java:comp/env/jdbc/Oracle11g");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<RequestDTO> getRequest(int IRecruitment_post_number) {
		ArrayList<RequestDTO> rdtos = new ArrayList<RequestDTO>();
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
	
		try {
			connection = dataSource.getConnection();
			
			String query = "select * from Request_for_increase where IRECRUITMENT_POST_NUMBER = ? And ISTATUS_OF_REQUEST = '모집 가능' order by iId desc";
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setInt(1, IRecruitment_post_number);
			resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {
				int iId = resultSet.getInt("iId");
				String iInstitution_name = resultSet.getString("iInstitution_name");
				String iInstitution_classification = resultSet.getString("iInstitution_classification");
				String iNecessary_Job = resultSet.getString("iNecessary_Job");
				String iNeed_ICU = resultSet.getString("iNeed_ICU");
				int iNecessary_numbers_of_worker = resultSet.getInt("iNecessary_numbers_of_worker");
				String iWork_type = resultSet.getString("iWork_type");
				int iWork_period = resultSet.getInt("iWork_period");
				String iAccomodation_Availability = resultSet.getString("iAccomodation_Availability");
				int iNecessary_carrer_years = resultSet.getInt("iNecessary_carrer_years");
				String iRequest_location_city = resultSet.getString("iRequest_location_city");
				String iRequest_location_district = resultSet.getString("iRequest_location_district");
				String iRepresentative_number = resultSet.getString("iRepresentative_number");
				String iRepresentative_email = resultSet.getString("iRepresentative_email");
				Timestamp iRequest_Date = resultSet.getTimestamp("iRequest_Date");
				String iStatus_of_request = resultSet.getString("iStatus_of_request");
				String iRemarks = resultSet.getString("iRemarks");
				int iRecruitment_post_number = resultSet.getInt("iRecruitment_post_number");
				
				RequestDTO request_for_increaseDto = new RequestDTO(iId, iInstitution_name, iInstitution_classification, iNecessary_Job, iNeed_ICU, iNecessary_numbers_of_worker, iWork_type, iWork_period, iAccomodation_Availability, iNecessary_carrer_years, iRequest_location_city, iRequest_location_district, iRepresentative_number, iRepresentative_email, iRequest_Date, iStatus_of_request, iRemarks, iRecruitment_post_number);
				rdtos.add(request_for_increaseDto);
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
		}
		return rdtos;
	}
	// 노출되고 있는 request 개수 파악
	public int RequestCount(int rId) {
		int count = 0;
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		
		try {
			connection = dataSource.getConnection();
			String query = "select count(*) from Request_for_increase where IRECRUITMENT_POST_NUMBER = ? And ISTATUS_OF_REQUEST = '모집 가능'";
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setInt(1, rId);
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
		}
		return count;
	}
	//비노출되고 있는 request 노출
	public ArrayList<RequestDTO> getRequest_for_modify_invisible(String rRecruitment_location_city, String rRecruitment_location_district, String rRecruitment_necessary_job) {
		ArrayList<RequestDTO> rdtos = new ArrayList<RequestDTO>();
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
	
		try {
			connection = dataSource.getConnection();
			
			String query = "select * from Request_for_increase where IREQUEST_LOCATION_CITY = ? And IREQUEST_LOCATION_DISTRICT = ? And INECESSARY_JOB = ? And IRECRUITMENT_POST_NUMBER = 0 And ISTATUS_OF_REQUEST = '모집 가능' order by iId desc";
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setString(1, rRecruitment_location_city);
			preparedStatement.setString(2, rRecruitment_location_district);
			preparedStatement.setString(3, rRecruitment_necessary_job);
			resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {
				int iId = resultSet.getInt("iId");
				String iInstitution_name = resultSet.getString("iInstitution_name");
				String iInstitution_classification = resultSet.getString("iInstitution_classification");
				String iNecessary_Job = resultSet.getString("iNecessary_Job");
				String iNeed_ICU = resultSet.getString("iNeed_ICU");
				int iNecessary_numbers_of_worker = resultSet.getInt("iNecessary_numbers_of_worker");
				String iWork_type = resultSet.getString("iWork_type");
				int iWork_period = resultSet.getInt("iWork_period");
				String iAccomodation_Availability = resultSet.getString("iAccomodation_Availability");
				int iNecessary_carrer_years = resultSet.getInt("iNecessary_carrer_years");
				String iRequest_location_city = resultSet.getString("iRequest_location_city");
				String iRequest_location_district = resultSet.getString("iRequest_location_district");
				String iRepresentative_number = resultSet.getString("iRepresentative_number");
				String iRepresentative_email = resultSet.getString("iRepresentative_email");
				Timestamp iRequest_Date = resultSet.getTimestamp("iRequest_Date");
				String iStatus_of_request = resultSet.getString("iStatus_of_request");
				String iRemarks = resultSet.getString("iRemarks");
				int iRecruitment_post_number = resultSet.getInt("iRecruitment_post_number");
				
				RequestDTO request_for_increaseDto = new RequestDTO(iId, iInstitution_name, iInstitution_classification, iNecessary_Job, iNeed_ICU, iNecessary_numbers_of_worker, iWork_type, iWork_period, iAccomodation_Availability, iNecessary_carrer_years, iRequest_location_city, iRequest_location_district, iRepresentative_number, iRepresentative_email, iRequest_Date, iStatus_of_request, iRemarks, iRecruitment_post_number);
				rdtos.add(request_for_increaseDto);
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
		}
		return rdtos;
	}
	// 해당 지역 및 직무의 파견 요청 전체 개수(모집공고가 매핑되어있든 안되어있든 상관없이 노출)
	public int RequestCount_total(String rRecruitment_location_city, String rRecruitment_location_district, String rRecruitment_necessary_job) {
		int count = 0;
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		
		try {
			connection = dataSource.getConnection();
			String query = "select count(*) from Request_for_increase where IREQUEST_LOCATION_CITY = ? And IREQUEST_LOCATION_DISTRICT = ? And INECESSARY_JOB = ?  And ISTATUS_OF_REQUEST = '모집 가능'";
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setString(1, rRecruitment_location_city);
			preparedStatement.setString(2, rRecruitment_location_district);
			preparedStatement.setString(3, rRecruitment_necessary_job);
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
		}
		return count;
	}
	
	// 해당 지역 및 직무 중에 매핑되지 않은 데이터 개수(모집공고 작성할 때 필요)
	public int RequestCount_total_write(String rRecruitment_location_city, String rRecruitment_location_district, String rRecruitment_necessary_job) {
		int count = 0;
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		
		try {
			connection = dataSource.getConnection();
			String query = "select count(*) from Request_for_increase where IREQUEST_LOCATION_CITY = ? And IREQUEST_LOCATION_DISTRICT = ? And INECESSARY_JOB = ? And IRECRUITMENT_POST_NUMBER = 0 And ISTATUS_OF_REQUEST = '모집 가능'";
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setString(1, rRecruitment_location_city);
			preparedStatement.setString(2, rRecruitment_location_district);
			preparedStatement.setString(3, rRecruitment_necessary_job);
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
		}
		return count;
	}
	
	
	
	public RequestDTO getRequest_for_Memberlist(int iId) {
		RequestDTO requestDto = null;
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
	
		try {
			connection = dataSource.getConnection();
			
			String query = "select * from Request_for_increase where iId = ?";
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setInt(1, iId);
			resultSet = preparedStatement.executeQuery();

			if (resultSet.next()) {
				String iInstitution_name = resultSet.getString("iInstitution_name");
				String iInstitution_classification = resultSet.getString("iInstitution_classification");
				String iNecessary_Job = resultSet.getString("iNecessary_Job");
				String iNeed_ICU = resultSet.getString("iNeed_ICU");
				int iNecessary_numbers_of_worker = resultSet.getInt("iNecessary_numbers_of_worker");
				String iWork_type = resultSet.getString("iWork_type");
				int iWork_period = resultSet.getInt("iWork_period");
				String iAccomodation_Availability = resultSet.getString("iAccomodation_Availability");
				int iNecessary_carrer_years = resultSet.getInt("iNecessary_carrer_years");
				String iRequest_location_city = resultSet.getString("iRequest_location_city");
				String iRequest_location_district = resultSet.getString("iRequest_location_district");
				String iRepresentative_number = resultSet.getString("iRepresentative_number");
				String iRepresentative_email = resultSet.getString("iRepresentative_email");
				Timestamp iRequest_Date = resultSet.getTimestamp("iRequest_Date");
				String iStatus_of_request = resultSet.getString("iStatus_of_request");
				String iRemarks = resultSet.getString("iRemarks");
				int iRecruitment_post_number = resultSet.getInt("iRecruitment_post_number");
				
				requestDto = new RequestDTO(iId, iInstitution_name, iInstitution_classification, iNecessary_Job, iNeed_ICU, iNecessary_numbers_of_worker, iWork_type, iWork_period, iAccomodation_Availability, iNecessary_carrer_years, iRequest_location_city, iRequest_location_district, iRepresentative_number, iRepresentative_email, iRequest_Date, iStatus_of_request, iRemarks, iRecruitment_post_number);
				
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
		}
		return requestDto;
	}
	
	public int update_request_visible(int IRECRUITMENT_POST_NUMBER, String iId) {
		int result = 0;
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		try {
			connection = dataSource.getConnection();
			String query = "update Request_for_increase set IRECRUITMENT_POST_NUMBER = ? where iId = ?";
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setInt(1, IRECRUITMENT_POST_NUMBER);
			preparedStatement.setInt(2, Integer.parseInt(iId));
			result = preparedStatement.executeUpdate();
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
		}
		return result;
	}
	// 관리자가 공고를 마감하면 request의 상태도 모집완료로 처리
	public int Request_recruitment_end(int rId) {
		int result = 0;
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		try {
			connection = dataSource.getConnection();
			String query = "update Request_for_increase set ISTATUS_OF_REQUEST = '모집 완료' where IRECRUITMENT_POST_NUMBER = ?";
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setInt(1, rId);
			result = preparedStatement.executeUpdate();
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
		}
		return result;
	}
	// 관리자가 공고를 삭제하면 0번 게시판으로 자동매핑
	public int Request_recruitment_delete(int rId) {
		int result = 0;
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		try {
			connection = dataSource.getConnection();
			String query = "update Request_for_increase set IRECRUITMENT_POST_NUMBER = '0' where IRECRUITMENT_POST_NUMBER = ?";
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setInt(1, rId);
			result = preparedStatement.executeUpdate();
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
		}
		return result;
	}
	//전체 리스트 추출
	public ArrayList<RequestDTO> request_totallist(int startRow, int endRow) {
		
		ArrayList<RequestDTO> dtos = new ArrayList<RequestDTO>();
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		
		try {
			connection = dataSource.getConnection();
			
			String query = "select * from (select rownum rn, iId, iInstitution_name, iInstitution_classification, iNecessary_Job, iNeed_ICU, iNecessary_numbers_of_worker, iWork_type, iWork_period, iAccomodation_Availability, iNecessary_carrer_years, iRequest_location_city, iRequest_location_district, iRepresentative_number, iRepresentative_email, iRequest_Date, iStatus_of_request, iRemarks, iRecruitment_post_number from (select * from Request_for_increase order by iId desc)) where rn between ? and ?"; 
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setInt(1, startRow);
			preparedStatement.setInt(2, endRow);
			resultSet = preparedStatement.executeQuery();
			
			while (resultSet.next()) {
				int iId = resultSet.getInt("iId");
				String iInstitution_name = resultSet.getString("iInstitution_name");
				String iInstitution_classification = resultSet.getString("iInstitution_classification");
				String iNecessary_Job = resultSet.getString("iNecessary_Job");
				String iNeed_ICU = resultSet.getString("iNeed_ICU");
				int iNecessary_numbers_of_worker = resultSet.getInt("iNecessary_numbers_of_worker");
				String iWork_type = resultSet.getString("iWork_type");
				int iWork_period = resultSet.getInt("iWork_period");
				String iAccomodation_Availability = resultSet.getString("iAccomodation_Availability");
				int iNecessary_carrer_years = resultSet.getInt("iNecessary_carrer_years");
				String iRequest_location_city = resultSet.getString("iRequest_location_city");
				String iRequest_location_district = resultSet.getString("iRequest_location_district");
				String iRepresentative_number = resultSet.getString("iRepresentative_number");
				String iRepresentative_email = resultSet.getString("iRepresentative_email");
				Timestamp iRequest_Date = resultSet.getTimestamp("iRequest_Date");
				String iStatus_of_request = resultSet.getString("iStatus_of_request");
				String iRemarks = resultSet.getString("iRemarks");
				int iRecruitment_post_number = resultSet.getInt("iRecruitment_post_number");
				
				RequestDTO requestDto = new RequestDTO(iId, iInstitution_name, iInstitution_classification, iNecessary_Job, iNeed_ICU, iNecessary_numbers_of_worker, iWork_type, iWork_period, iAccomodation_Availability, iNecessary_carrer_years, iRequest_location_city, iRequest_location_district, iRepresentative_number, iRepresentative_email, iRequest_Date, iStatus_of_request, iRemarks, iRecruitment_post_number);
				dtos.add(requestDto);
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
	
	public ArrayList<RequestDTO> request_list(int startRow, int endRow, String IREQUEST_LOCATION_CITY, String IREQUEST_LOCATION_DISTRICT, String INECESSARY_JOB) {
		
		ArrayList<RequestDTO> dtos = new ArrayList<RequestDTO>();
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
			if(!IREQUEST_LOCATION_CITY.equals("N") && IREQUEST_LOCATION_DISTRICT.equals("N") && INECESSARY_JOB.equals("N")) {
				String query = "select * from (select rownum rn, iId, iInstitution_name, iInstitution_classification, iNecessary_Job, iNeed_ICU, iNecessary_numbers_of_worker, iWork_type, iWork_period, iAccomodation_Availability, iNecessary_carrer_years, iRequest_location_city, iRequest_location_district, iRepresentative_number, iRepresentative_email, iRequest_Date, iStatus_of_request, iRemarks, iRecruitment_post_number from (select * from Request_for_increase where IREQUEST_LOCATION_CITY = ? order by iId desc)) where rn between ? and ?"; 
				preparedStatement = connection.prepareStatement(query);
				preparedStatement.setString(1,  IREQUEST_LOCATION_CITY);
				preparedStatement.setInt(2, startRow);
				preparedStatement.setInt(3, endRow);
				resultSet = preparedStatement.executeQuery();
				
				while (resultSet.next()) {
					int iId = resultSet.getInt("iId");
					String iInstitution_name = resultSet.getString("iInstitution_name");
					String iInstitution_classification = resultSet.getString("iInstitution_classification");
					String iNecessary_Job = resultSet.getString("iNecessary_Job");
					String iNeed_ICU = resultSet.getString("iNeed_ICU");
					int iNecessary_numbers_of_worker = resultSet.getInt("iNecessary_numbers_of_worker");
					String iWork_type = resultSet.getString("iWork_type");
					int iWork_period = resultSet.getInt("iWork_period");
					String iAccomodation_Availability = resultSet.getString("iAccomodation_Availability");
					int iNecessary_carrer_years = resultSet.getInt("iNecessary_carrer_years");
					String iRequest_location_city = resultSet.getString("iRequest_location_city");
					String iRequest_location_district = resultSet.getString("iRequest_location_district");
					String iRepresentative_number = resultSet.getString("iRepresentative_number");
					String iRepresentative_email = resultSet.getString("iRepresentative_email");
					Timestamp iRequest_Date = resultSet.getTimestamp("iRequest_Date");
					String iStatus_of_request = resultSet.getString("iStatus_of_request");
					String iRemarks = resultSet.getString("iRemarks");
					int iRecruitment_post_number = resultSet.getInt("iRecruitment_post_number");
					
					RequestDTO requestDto = new RequestDTO(iId, iInstitution_name, iInstitution_classification, iNecessary_Job, iNeed_ICU, iNecessary_numbers_of_worker, iWork_type, iWork_period, iAccomodation_Availability, iNecessary_carrer_years, iRequest_location_city, iRequest_location_district, iRepresentative_number, iRepresentative_email, iRequest_Date, iStatus_of_request, iRemarks, iRecruitment_post_number);
					dtos.add(requestDto);
				}
			} 
			// 지역(광역시,도,구,군,시)만 설정하였을 때
			else if(!IREQUEST_LOCATION_CITY.equals("N") && !IREQUEST_LOCATION_DISTRICT.equals("N") && INECESSARY_JOB.equals("N") ) {
				String query = "select * from (select rownum rn, iId, iInstitution_name, iInstitution_classification, iNecessary_Job, iNeed_ICU, iNecessary_numbers_of_worker, iWork_type, iWork_period, iAccomodation_Availability, iNecessary_carrer_years, iRequest_location_city, iRequest_location_district, iRepresentative_number, iRepresentative_email, iRequest_Date, iStatus_of_request, iRemarks, iRecruitment_post_number from (select * from Request_for_increase where IREQUEST_LOCATION_CITY = ? and IREQUEST_LOCATION_DISTRICT = ? order by iId desc)) where rn between ? and ?"; 
				preparedStatement = connection.prepareStatement(query);
				preparedStatement.setString(1, IREQUEST_LOCATION_CITY);
				preparedStatement.setString(2, IREQUEST_LOCATION_DISTRICT);
				preparedStatement.setInt(3, startRow);
				preparedStatement.setInt(4, endRow);
				resultSet = preparedStatement.executeQuery();
			
				while (resultSet.next()) {
					int iId = resultSet.getInt("iId");
					String iInstitution_name = resultSet.getString("iInstitution_name");
					String iInstitution_classification = resultSet.getString("iInstitution_classification");
					String iNecessary_Job = resultSet.getString("iNecessary_Job");
					String iNeed_ICU = resultSet.getString("iNeed_ICU");
					int iNecessary_numbers_of_worker = resultSet.getInt("iNecessary_numbers_of_worker");
					String iWork_type = resultSet.getString("iWork_type");
					int iWork_period = resultSet.getInt("iWork_period");
					String iAccomodation_Availability = resultSet.getString("iAccomodation_Availability");
					int iNecessary_carrer_years = resultSet.getInt("iNecessary_carrer_years");
					String iRequest_location_city = resultSet.getString("iRequest_location_city");
					String iRequest_location_district = resultSet.getString("iRequest_location_district");
					String iRepresentative_number = resultSet.getString("iRepresentative_number");
					String iRepresentative_email = resultSet.getString("iRepresentative_email");
					Timestamp iRequest_Date = resultSet.getTimestamp("iRequest_Date");
					String iStatus_of_request = resultSet.getString("iStatus_of_request");
					String iRemarks = resultSet.getString("iRemarks");
					int iRecruitment_post_number = resultSet.getInt("iRecruitment_post_number");
					
					RequestDTO requestDto = new RequestDTO(iId, iInstitution_name, iInstitution_classification, iNecessary_Job, iNeed_ICU, iNecessary_numbers_of_worker, iWork_type, iWork_period, iAccomodation_Availability, iNecessary_carrer_years, iRequest_location_city, iRequest_location_district, iRepresentative_number, iRepresentative_email, iRequest_Date, iStatus_of_request, iRemarks, iRecruitment_post_number);
					dtos.add(requestDto);
				}
			} 
			// 지역(광역시,도)까지만 설정하고 직무를 선택하였을 때
			else if(!IREQUEST_LOCATION_CITY.equals("N") && IREQUEST_LOCATION_DISTRICT.equals("N") && !INECESSARY_JOB.equals("N") ){
				String query = "select * from (select rownum rn, iId, iInstitution_name, iInstitution_classification, iNecessary_Job, iNeed_ICU, iNecessary_numbers_of_worker, iWork_type, iWork_period, iAccomodation_Availability, iNecessary_carrer_years, iRequest_location_city, iRequest_location_district, iRepresentative_number, iRepresentative_email, iRequest_Date, iStatus_of_request, iRemarks, iRecruitment_post_number from (select * from Request_for_increase where IREQUEST_LOCATION_CITY = ? and INECESSARY_JOB = ? order by iId desc)) where rn between ? and ?"; 
				preparedStatement = connection.prepareStatement(query);
				preparedStatement.setString(1, IREQUEST_LOCATION_CITY);
				preparedStatement.setString(2, INECESSARY_JOB);
				preparedStatement.setInt(3, startRow);
				preparedStatement.setInt(4, endRow);
				resultSet = preparedStatement.executeQuery();
				
				while (resultSet.next()) {
					int iId = resultSet.getInt("iId");
					String iInstitution_name = resultSet.getString("iInstitution_name");
					String iInstitution_classification = resultSet.getString("iInstitution_classification");
					String iNecessary_Job = resultSet.getString("iNecessary_Job");
					String iNeed_ICU = resultSet.getString("iNeed_ICU");
					int iNecessary_numbers_of_worker = resultSet.getInt("iNecessary_numbers_of_worker");
					String iWork_type = resultSet.getString("iWork_type");
					int iWork_period = resultSet.getInt("iWork_period");
					String iAccomodation_Availability = resultSet.getString("iAccomodation_Availability");
					int iNecessary_carrer_years = resultSet.getInt("iNecessary_carrer_years");
					String iRequest_location_city = resultSet.getString("iRequest_location_city");
					String iRequest_location_district = resultSet.getString("iRequest_location_district");
					String iRepresentative_number = resultSet.getString("iRepresentative_number");
					String iRepresentative_email = resultSet.getString("iRepresentative_email");
					Timestamp iRequest_Date = resultSet.getTimestamp("iRequest_Date");
					String iStatus_of_request = resultSet.getString("iStatus_of_request");
					String iRemarks = resultSet.getString("iRemarks");
					int iRecruitment_post_number = resultSet.getInt("iRecruitment_post_number");
					
					RequestDTO requestDto = new RequestDTO(iId, iInstitution_name, iInstitution_classification, iNecessary_Job, iNeed_ICU, iNecessary_numbers_of_worker, iWork_type, iWork_period, iAccomodation_Availability, iNecessary_carrer_years, iRequest_location_city, iRequest_location_district, iRepresentative_number, iRepresentative_email, iRequest_Date, iStatus_of_request, iRemarks, iRecruitment_post_number);
					dtos.add(requestDto);
				}
			}
			// 직무만 선택하였을 때
			else if(IREQUEST_LOCATION_CITY.equals("N") && IREQUEST_LOCATION_DISTRICT.equals("N") && !INECESSARY_JOB.equals("N") ){
				String query = "select * from (select rownum rn, iId, iInstitution_name, iInstitution_classification, iNecessary_Job, iNeed_ICU, iNecessary_numbers_of_worker, iWork_type, iWork_period, iAccomodation_Availability, iNecessary_carrer_years, iRequest_location_city, iRequest_location_district, iRepresentative_number, iRepresentative_email, iRequest_Date, iStatus_of_request, iRemarks, iRecruitment_post_number from (select * from Request_for_increase where INECESSARY_JOB = ? order by iId desc)) where rn between ? and ?"; 
				preparedStatement = connection.prepareStatement(query);
				preparedStatement.setString(1, INECESSARY_JOB);
				preparedStatement.setInt(2, startRow);
				preparedStatement.setInt(3, endRow);
				resultSet = preparedStatement.executeQuery();
				
				while (resultSet.next()) {
					int iId = resultSet.getInt("iId");
					String iInstitution_name = resultSet.getString("iInstitution_name");
					String iInstitution_classification = resultSet.getString("iInstitution_classification");
					String iNecessary_Job = resultSet.getString("iNecessary_Job");
					String iNeed_ICU = resultSet.getString("iNeed_ICU");
					int iNecessary_numbers_of_worker = resultSet.getInt("iNecessary_numbers_of_worker");
					String iWork_type = resultSet.getString("iWork_type");
					int iWork_period = resultSet.getInt("iWork_period");
					String iAccomodation_Availability = resultSet.getString("iAccomodation_Availability");
					int iNecessary_carrer_years = resultSet.getInt("iNecessary_carrer_years");
					String iRequest_location_city = resultSet.getString("iRequest_location_city");
					String iRequest_location_district = resultSet.getString("iRequest_location_district");
					String iRepresentative_number = resultSet.getString("iRepresentative_number");
					String iRepresentative_email = resultSet.getString("iRepresentative_email");
					Timestamp iRequest_Date = resultSet.getTimestamp("iRequest_Date");
					String iStatus_of_request = resultSet.getString("iStatus_of_request");
					String iRemarks = resultSet.getString("iRemarks");
					int iRecruitment_post_number = resultSet.getInt("iRecruitment_post_number");
					
					RequestDTO requestDto = new RequestDTO(iId, iInstitution_name, iInstitution_classification, iNecessary_Job, iNeed_ICU, iNecessary_numbers_of_worker, iWork_type, iWork_period, iAccomodation_Availability, iNecessary_carrer_years, iRequest_location_city, iRequest_location_district, iRepresentative_number, iRepresentative_email, iRequest_Date, iStatus_of_request, iRemarks, iRecruitment_post_number);
					dtos.add(requestDto);
				}
			}
			// 전부 다 선택하였을 때
			else if(!IREQUEST_LOCATION_CITY.equals("N") && !IREQUEST_LOCATION_DISTRICT.equals("N") && !INECESSARY_JOB.equals("N") ) {
				String query = "select * from (select rownum rn, iId, iInstitution_name, iInstitution_classification, iNecessary_Job, iNeed_ICU, iNecessary_numbers_of_worker, iWork_type, iWork_period, iAccomodation_Availability, iNecessary_carrer_years, iRequest_location_city, iRequest_location_district, iRepresentative_number, iRepresentative_email, iRequest_Date, iStatus_of_request, iRemarks, iRecruitment_post_number from (select * from Request_for_increase where IREQUEST_LOCATION_CITY = ? and INECESSARY_JOB = ? And INECESSARY_JOB = ? order by iId desc)) where rn between ? and ?"; 

				preparedStatement = connection.prepareStatement(query);
				preparedStatement.setString(1, IREQUEST_LOCATION_CITY);
				preparedStatement.setString(2, IREQUEST_LOCATION_DISTRICT);
				preparedStatement.setString(3, INECESSARY_JOB);
				preparedStatement.setInt(4, startRow);
				preparedStatement.setInt(5, endRow);
				resultSet = preparedStatement.executeQuery();
				
				while (resultSet.next()) {
					int iId = resultSet.getInt("iId");
					String iInstitution_name = resultSet.getString("iInstitution_name");
					String iInstitution_classification = resultSet.getString("iInstitution_classification");
					String iNecessary_Job = resultSet.getString("iNecessary_Job");
					String iNeed_ICU = resultSet.getString("iNeed_ICU");
					int iNecessary_numbers_of_worker = resultSet.getInt("iNecessary_numbers_of_worker");
					String iWork_type = resultSet.getString("iWork_type");
					int iWork_period = resultSet.getInt("iWork_period");
					String iAccomodation_Availability = resultSet.getString("iAccomodation_Availability");
					int iNecessary_carrer_years = resultSet.getInt("iNecessary_carrer_years");
					String iRequest_location_city = resultSet.getString("iRequest_location_city");
					String iRequest_location_district = resultSet.getString("iRequest_location_district");
					String iRepresentative_number = resultSet.getString("iRepresentative_number");
					String iRepresentative_email = resultSet.getString("iRepresentative_email");
					Timestamp iRequest_Date = resultSet.getTimestamp("iRequest_Date");
					String iStatus_of_request = resultSet.getString("iStatus_of_request");
					String iRemarks = resultSet.getString("iRemarks");
					int iRecruitment_post_number = resultSet.getInt("iRecruitment_post_number");
					
					RequestDTO requestDto = new RequestDTO(iId, iInstitution_name, iInstitution_classification, iNecessary_Job, iNeed_ICU, iNecessary_numbers_of_worker, iWork_type, iWork_period, iAccomodation_Availability, iNecessary_carrer_years, iRequest_location_city, iRequest_location_district, iRepresentative_number, iRepresentative_email, iRequest_Date, iStatus_of_request, iRemarks, iRecruitment_post_number);
					dtos.add(requestDto);
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
	public int request_getCount() {
		int count = 0;
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		
		try {
			connection = dataSource.getConnection();
			String query = "select count(*) from Request_for_increase";
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
	public int request_getfCount(String IREQUEST_LOCATION_CITY, String IREQUEST_LOCATION_DISTRICT, String INECESSARY_JOB) {
		int fCount = 0;
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		try {
			connection = dataSource.getConnection();
			// 지역과 직무 검색 조건을 다 설정하지 않았을 때
			if (IREQUEST_LOCATION_CITY.equals("N") && IREQUEST_LOCATION_DISTRICT.equals("N") && INECESSARY_JOB.equals("N") ) {
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
			if(!IREQUEST_LOCATION_CITY.equals("N") && IREQUEST_LOCATION_DISTRICT.equals("N") && INECESSARY_JOB.equals("N")) {
				String query = "select count(*) from Request_for_increase where IREQUEST_LOCATION_CITY = ?";
				preparedStatement = connection.prepareStatement(query);
				preparedStatement.setString(1, IREQUEST_LOCATION_CITY);
				resultSet = preparedStatement.executeQuery();
				
				if(resultSet.next()) {
					fCount = resultSet.getInt(1);
				}
			} 
			// 지역(광역시,도,구,군,시)만 설정하였을 때
			else if(!IREQUEST_LOCATION_CITY.equals("N") && !IREQUEST_LOCATION_DISTRICT.equals("N") && INECESSARY_JOB.equals("N") ) {
				String query = "select count(*) from Request_for_increase where IREQUEST_LOCATION_CITY =? AND IREQUEST_LOCATION_DISTRICT = ?";
				preparedStatement = connection.prepareStatement(query);
				preparedStatement.setString(1, IREQUEST_LOCATION_CITY);
				preparedStatement.setString(2, IREQUEST_LOCATION_DISTRICT);
				resultSet = preparedStatement.executeQuery();
				
				if(resultSet.next()) {
					fCount = resultSet.getInt(1);
				}
			} 
			// 지역(광역시,도)까지만 설정하고 직무를 선택하였을 때
			else if(!IREQUEST_LOCATION_CITY.equals("N") && IREQUEST_LOCATION_DISTRICT.equals("N") && !INECESSARY_JOB.equals("N") ){
				String query = "select count(*) from Request_for_increase where IREQUEST_LOCATION_CITY = ? AND INECESSARY_JOB = ?";
				preparedStatement = connection.prepareStatement(query);
				preparedStatement.setString(1, IREQUEST_LOCATION_CITY);
				preparedStatement.setString(2, INECESSARY_JOB);
				resultSet = preparedStatement.executeQuery();
				
				if(resultSet.next()) {
					fCount = resultSet.getInt(1);
				}
			}
			// 직무만 선택하였을 때
			else if(IREQUEST_LOCATION_CITY.equals("N") && IREQUEST_LOCATION_DISTRICT.equals("N") && !INECESSARY_JOB.equals("N") ){
				String query = "select count(*) from Request_for_increase where INECESSARY_JOB = ?";
				preparedStatement = connection.prepareStatement(query);
				preparedStatement.setString(1, INECESSARY_JOB);

				resultSet = preparedStatement.executeQuery();
				
				if(resultSet.next()) {
					fCount = resultSet.getInt(1);
				}
			}
			//전부 선택하였을 때
			else if(!IREQUEST_LOCATION_CITY.equals("N") && !IREQUEST_LOCATION_DISTRICT.equals("N") && !INECESSARY_JOB.equals("N") ) {
				String query = "select count(*) from Request_for_increase where IREQUEST_LOCATION_CITY = ? AND IREQUEST_LOCATION_DISTRICT = ? AND INECESSARY_JOB =?";
				preparedStatement = connection.prepareStatement(query);
				preparedStatement.setString(1, IREQUEST_LOCATION_CITY);
				preparedStatement.setString(2, IREQUEST_LOCATION_DISTRICT);
				preparedStatement.setString(3, INECESSARY_JOB);
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
	
	//관리자가 request의 상태를 변경할 때 쓰는 메소드
	public int change_status_of_request(String iId, String iStatus_of_request ) {
		int result = 0;
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		try {
			connection = dataSource.getConnection();
			String query = "update Request_for_increase set iStatus_of_request = ? where iId = ?";
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setString(1, iStatus_of_request);
			preparedStatement.setInt(2, Integer.parseInt(iId));
			result = preparedStatement.executeUpdate();
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
		}
		return result;
	}
}
