package com.korea.itcen.DAO;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.korea.itcen.DTO.ApplyDTO;
@Repository
public class ApplyDAO implements ApplyDAOInterface {

	DataSource dataSource;
	
	public ApplyDAO() {
		try {
			Context context = new InitialContext();
			dataSource = (DataSource) context.lookup("java:comp/env/jdbc/Oracle11g");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public int Apply_write(String aHope_institution, Date aHope_work_period_start, Date aHope_work_period_end, int aYears_of_exp_in_this_area, String aInstitution_of_experience, int aRecruitment_number, String aMemberID, String aApply_location_city, String aApply_location_district, String aApply_job) {
		int ri = 0;
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		
		try {
			connection = dataSource.getConnection();
			String query = "insert into apply (aId, aHope_institution, aHope_work_period_start, aHope_work_period_end, aYears_of_exp_in_this_area, aInstitution_of_experience, aStatus_of_dispatch_apply, aRecruitment_number, aMemberID, aApply_location_city, aApply_location_district, aApply_job) values (apply_seq.nextval,?,?,?,?,?,'대기',?,?,?,?,?)";
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setString(1, aHope_institution);
			preparedStatement.setDate(2, aHope_work_period_start);
			preparedStatement.setDate(3, aHope_work_period_end);
			preparedStatement.setInt(4, aYears_of_exp_in_this_area);
			preparedStatement.setString(5, aInstitution_of_experience);
			preparedStatement.setInt(6, aRecruitment_number);
			preparedStatement.setString(7, aMemberID);
			preparedStatement.setString(8, aApply_location_city);
			preparedStatement.setString(9, aApply_location_district);
			preparedStatement.setString(10, aApply_job);
			ri = preparedStatement.executeUpdate();
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
		return ri;
		
	} 
	
	public ArrayList<ApplyDTO> getApply_list(String aMemberID){
		ArrayList<ApplyDTO> dtos = new ArrayList<ApplyDTO>();
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		try {
			
			connection = dataSource.getConnection();
			String query = "select aId, aHope_institution, aHope_work_period_start, aHope_work_period_end, aYears_of_exp_in_this_area, aInstitution_of_experience, aStatus_of_dispatch_apply, aRecruitment_number, aMemberID, aApply_location_city, aApply_location_district, aApply_job from apply where aMemberId = ? order by aId desc";
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setString(1, aMemberID);
			resultSet = preparedStatement.executeQuery();
			
			while(resultSet.next()) {
				int aId = resultSet.getInt("aId");
				String aHope_institution = resultSet.getString("aHope_institution");
				Date aHope_work_period_start = resultSet.getDate("aHope_work_period_start");
				Date aHope_work_period_end = resultSet.getDate("aHope_work_period_end");
				int aYears_of_exp_in_this_area = resultSet.getInt("aYears_of_exp_in_this_area");
				String aInstitution_of_experience = resultSet.getString("aInstitution_of_experience");
				String aStatus_of_dispatch_apply = resultSet.getString("aStatus_of_dispatch_apply");
				int aRecruitment_number = resultSet.getInt("aRecruitment_number");
				String aApply_location_city = resultSet.getString("aApply_location_city");
				String aApply_location_district = resultSet.getString("aApply_location_district");
				String aApply_job = resultSet.getString("aApply_job");
				
				ApplyDTO applyDto = new ApplyDTO(aId, aHope_institution, aHope_work_period_start, aHope_work_period_end, aYears_of_exp_in_this_area, aInstitution_of_experience, aStatus_of_dispatch_apply, aRecruitment_number, aMemberID, aApply_location_city, aApply_location_district, aApply_job);
				dtos.add(applyDto);
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
		return dtos;
	}
	
	public ApplyDTO getApply(int aId){
		ApplyDTO applyDto = null;
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		try {
			
			connection = dataSource.getConnection();
			String query = "select * from apply where aId = ?";
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setInt(1, aId);
			resultSet = preparedStatement.executeQuery();
			
			if(resultSet.next()) {
				String aHope_institution = resultSet.getString("aHope_institution");
				Date aHope_work_period_start = resultSet.getDate("aHope_work_period_start");
				Date aHope_work_period_end = resultSet.getDate("aHope_work_period_end");
				int aYears_of_exp_in_this_area = resultSet.getInt("aYears_of_exp_in_this_area");
				String aInstitution_of_experience = resultSet.getString("aInstitution_of_experience");
				String aStatus_of_dispatch_apply = resultSet.getString("aStatus_of_dispatch_apply");
				int aRecruitment_number = resultSet.getInt("aRecruitment_number");
				String aMemberID = resultSet.getString("aMemberID");
				String aApply_location_city = resultSet.getString("aApply_location_city");
				String aApply_location_district = resultSet.getString("aApply_location_district");
				String aApply_job = resultSet.getString("aApply_job");
				
				applyDto = new ApplyDTO(aId, aHope_institution, aHope_work_period_start, aHope_work_period_end, aYears_of_exp_in_this_area, aInstitution_of_experience, aStatus_of_dispatch_apply, aRecruitment_number, aMemberID, aApply_location_city, aApply_location_district, aApply_job);
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
		return applyDto;
	}
	
	public int Apply_modify(int aId, String aHope_institution, Date aHope_work_period_start, Date aHope_work_period_end, int aYears_of_exp_in_this_area, String aInstitution_of_experience) {
		int rn = 0;
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		try {
			connection = dataSource.getConnection();
			String query = "update apply set aHope_institution = ?, aHope_work_period_start = ?, aHope_work_period_end = ?, aYears_of_exp_in_this_area = ?, aInstitution_of_experience = ? where aId = ?";
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setString(1,  aHope_institution);
			preparedStatement.setDate(2,  aHope_work_period_start);
			preparedStatement.setDate(3,  aHope_work_period_end);
			preparedStatement.setInt(4,  aYears_of_exp_in_this_area);
			preparedStatement.setString(5, aInstitution_of_experience);
			preparedStatement.setInt(6,  aId);
			rn = preparedStatement.executeUpdate();
		}catch (Exception e) {
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
	
	public int Apply_cancel(int aId) {
		int rn = 0;
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		try {
			
			connection = dataSource.getConnection();
			String query = "delete from apply where aId = ?";
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setInt(1,  aId);
			rn = preparedStatement.executeUpdate();
			
		}catch (Exception e) {
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
	// 사용자가 본인이 신청한 내역을 확인할 때 사용하는 메소드
	public int ApplyCount(String aMemberID) {
		int count = 0;
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		
		try {
			connection = dataSource.getConnection();
			String query = "select count(*) from Apply where aMemberID = ?";
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setString(1, aMemberID);
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
	// 관리자가 모집공고에 해당하는 APPLY 수 파악하기 위한 메소드
	public int rApplyCount(int rId) {
		int count = 0;
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		
		try {
			connection = dataSource.getConnection();
			String query = "select count(*) from Apply where aRecruitment_number = ?";
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
	// 기관별로 모집인원 확인하기
	public int iApplyCount(String iInstitution_name) {
		int count = 0;
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		
		try {
			connection = dataSource.getConnection();
			String query = "select count(*) from Apply where aHope_institution = ?";
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setString(1, iInstitution_name);
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
	
	public int Apply_modify_status(String aStatus_of_dispatch_apply, String aMemberId, int aRecruitment_number) {
		int result = 0;
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
	
		try {
			connection = dataSource.getConnection();
			String query = "update apply set aStatus_of_dispatch_apply = ? where aMemberId = ? And aRecruitment_number = ?";
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setString(1, aStatus_of_dispatch_apply);
			preparedStatement.setString(2, aMemberId);
			preparedStatement.setInt(3, aRecruitment_number);
			result = preparedStatement.executeUpdate();
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
		} return result;
}
	
	public ApplyDTO getApply_for_workerlist(String wId, int iRecruitment_post_number){
		ApplyDTO applyDto = null;
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		try {
			
			connection = dataSource.getConnection();
			String query = "select * from apply where aMemberId = ? AND aRecruitment_number = ? ";
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setString(1, wId);
			preparedStatement.setInt(2, iRecruitment_post_number);
			resultSet = preparedStatement.executeQuery();
			
			if(resultSet.next()) {
				int aId = resultSet.getInt("aId");
				String aHope_institution = resultSet.getString("aHope_institution");
				Date aHope_work_period_start = resultSet.getDate("aHope_work_period_start");
				Date aHope_work_period_end = resultSet.getDate("aHope_work_period_end");
				int aYears_of_exp_in_this_area = resultSet.getInt("aYears_of_exp_in_this_area");
				String aInstitution_of_experience = resultSet.getString("aInstitution_of_experience");
				String aStatus_of_dispatch_apply = resultSet.getString("aStatus_of_dispatch_apply");
				int aRecruitment_number = resultSet.getInt("aRecruitment_number");
				String aApply_location_city = resultSet.getString("aApply_location_city");
				String aApply_location_district = resultSet.getString("aApply_location_district");
				String aApply_job = resultSet.getString("aApply_job");
				
				applyDto = new ApplyDTO(aId, aHope_institution, aHope_work_period_start, aHope_work_period_end, aYears_of_exp_in_this_area, aInstitution_of_experience, aStatus_of_dispatch_apply, aRecruitment_number, wId, aApply_location_city, aApply_location_district, aApply_job);
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
		return applyDto;
	}
	
	public int checkApply(String wId, String rId) {
		int result = 0;
		int Apply_existent = 1;
		int Apply_nonexistent = -1;
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		
		try {
			connection = dataSource.getConnection();
			String query = "select aId from apply where aMemberId = ? and aRecruitment_number = ?";
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setString(1, wId);
			preparedStatement.setString(2, rId);
			resultSet = preparedStatement.executeQuery();
			if(resultSet.next()) {
				result = Apply_existent;
			} else {
				result = Apply_nonexistent;
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
		return result;
	}
	

	
}
