package com.korea.itcen.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.korea.itcen.DTO.WorkerDTO;

public class WorkerDAO {
	
	DataSource dataSource;

	public static final int MEMBER_NONEXISTENT = 0;
	public static final int MEMBER_EXISTENT = 1;
	public static final int MEMBER_JOIN_FAIL = 0;
	public static final int MEMBER_JOIN_SUCCESS = 1;
	public static final int MEMBER_LOGIN_PW_NO_GOOD = 0;
	public static final int MEMBER_LOGIN_SUCCESS = 1;
	public static final int MEMBER_LOGIN_IS_NOT = -1;

	private static WorkerDAO instance = new WorkerDAO(); // 인스턴스를 자신이 자기를 생성해서 가리키고 있음
	
	public WorkerDAO() {
		try {
			Context context = new InitialContext();
			dataSource = (DataSource) context.lookup("java:comp/env/jdbc/Oracle11g");
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
	
	public static WorkerDAO getInstance() {
		return instance;
	}
	// instance라는 변수는 heap 메모리에 생성된 memberdao의 주소를 가리키고 있고 이제 다른 servlet이나 jsp에서 따로
	// new memberdao로 새로운 memberdao를 생성하는 게 아니라 getinstance로 생성되어있는 instance를 불러내면서 여러 개의 memberdao 객체를 생성하지 않는다.

	public int insertWorker (WorkerDTO dto) {
		int ri = 0;
		
		Connection connection = null;
		PreparedStatement pstmt = null;
		
		
		try {
			connection = dataSource.getConnection();
			String query = "insert into worker (WID, WPW, WNAME, WBIRTHDATE, WADDRESS, WPHONE_NUMBER, WEMAIL,  WSEX, WCERTIFICATE_NUMBER, WJOB, WCLINICAL_EXPERIENCE, WMAJOR_CAREER_YEARS, WMAJOR_CAREER_INSTITUTION, WSTATUS_OF_EMPLOYMENT, WCOVID_19_CLINICAL_EXPERIENCE, WSTATUS_OF_APPLY, WDATE) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,'No',?)";
			pstmt = connection.prepareStatement(query);
			pstmt.setString(1, dto.getwId());
			pstmt.setString(2,  dto.getwPw());
			pstmt.setString(3,  dto.getwName());
			pstmt.setDate(4, dto.getwBirthdate());
			pstmt.setString(5, dto.getwAddress());
			pstmt.setString(6,  dto.getwPhone_number());
			pstmt.setString(7,  dto.getwEmail());
			pstmt.setString(8,  dto.getwSex());
			pstmt.setString(9,  dto.getwCertificate_number());
			pstmt.setString(10,  dto.getwJob());
			pstmt.setInt(11,  dto.getwClinical_experience());
			pstmt.setInt(12,  dto.getwMajor_career_years());
			pstmt.setString(13,  dto.getwMajor_career_institution());
			pstmt.setString(14,  dto.getwStatus_of_employment());
			pstmt.setString(15,  dto.getwCovid_19_clinical_experience());
			
			pstmt.setTimestamp(16,  dto.getwDate());
			
			pstmt.executeUpdate();
			ri = WorkerDAO.MEMBER_JOIN_SUCCESS;
		
		} catch (Exception e) {
			e.printStackTrace();
			//printStackTrace() = 에러 메세지의 발생 근원지를 찾아서 단계별로 에러를 출력한다
		} finally {
			try {
				if(pstmt != null) pstmt.close();
				if(connection != null) connection.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		
		return ri;
		
	}
	
	public int confirmId(String wId) {
		int ri = 0;
		
		Connection connection = null;
		PreparedStatement pstmt = null;
		ResultSet set = null;
		
		
		try {
			connection = dataSource.getConnection();
			String query = "select wId from worker where wId = ?";
			pstmt = connection.prepareStatement(query);
			pstmt.setString(1, wId);
			set = pstmt.executeQuery();
			if(set.next()) {
				ri = WorkerDAO.MEMBER_EXISTENT;
			} else {
				ri = WorkerDAO.MEMBER_NONEXISTENT;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				set.close();
				pstmt.close();
				connection.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		} return ri;
	}
	
	
	public int userCheck (String wId, String wPw) {
		int ri = 0;
		String dbPw;
		
		Connection connection = null;
		PreparedStatement pstmt = null;
		ResultSet set = null;
		

		try {
			connection = dataSource.getConnection();
			System.out.println(connection);
			String query = "select wPw from worker where wId = ?";
			pstmt = connection.prepareStatement(query);
			pstmt.setString(1, wId);
			set = pstmt.executeQuery();
			if(set.next()) {
				dbPw = set.getString("wPw");
				if(dbPw.equals(wPw)) {
					ri = WorkerDAO.MEMBER_LOGIN_SUCCESS;
					}
				 else {
					ri = WorkerDAO.MEMBER_LOGIN_PW_NO_GOOD;
				}
			} else {
				ri = WorkerDAO.MEMBER_LOGIN_IS_NOT;
			}

	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		try {
			set.close();
			pstmt.close();
			connection.close();
		} catch (Exception e2) {
			e2.printStackTrace();
		}
	}
		return ri;
	}
	
	
	
	public WorkerDTO getMember (String wId) {
		Connection connection = null;
		PreparedStatement pstmt = null;
		ResultSet set = null;
		WorkerDTO dto = null;
		try {
			connection = dataSource.getConnection();
			String query = "select * from worker where wId = ?";
			pstmt = connection.prepareStatement(query);
			pstmt.setString(1, wId);
			set = pstmt.executeQuery();
			
			if(set.next()) {
				dto = new WorkerDTO();
				dto.setwId(set.getString("wId"));
				dto.setwPw(set.getString("wPw"));
				dto.setwName(set.getString("wName"));
				dto.setwBirthdate(set.getDate("wBirthdate"));
				dto.setwPhone_number(set.getString("wPhone_number"));
				dto.setwSex(set.getString("wSex"));
				dto.setwCertificate_number(set.getString("wCertificate_number"));
				dto.setwJob(set.getString("wJob"));
				dto.setwClinical_experience(set.getInt("wClinical_experience"));
				dto.setwMajor_career_years(set.getInt("wMajor_career_years"));
				dto.setwMajor_career_institution(set.getString("wMajor_career_institution"));
				dto.setwStatus_of_employment(set.getString("wStatus_of_employment"));
				dto.setwCovid_19_clinical_experience(set.getString("wCovid_19_clinical_experience"));
				dto.setwStatus_of_apply(set.getString("wStatus_of_apply"));
				dto.setwEmail(set.getString("wEmail"));
				dto.setwDate(set.getTimestamp("wDate"));
				dto.setwAddress(set.getString("waddress"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				set.close();
				pstmt.close();
				connection.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}

		return dto;
	}
	public int updateMember(WorkerDTO dto) {
		int ri = 0;
		
		Connection connection = null;
		PreparedStatement pstmt = null;
				
		try {
			connection = dataSource.getConnection();
			String query = "update worker set wSex=?, wPw=?, wAddress=?, wPhone_number=?, wEmail=?, wCertificate_number=?, wJob=?, wClinical_experience=?, wMajor_career_years=?, wMajor_career_institution=?, wStatus_of_employment=?, wCovid_19_clinical_experience=? where wId = ?";
			pstmt = connection.prepareStatement(query);
			pstmt.setString(1,  dto.getwSex());
			pstmt.setString(2,  dto.getwPw());
			pstmt.setString(3,  dto.getwAddress());
			pstmt.setString(4,  dto.getwPhone_number());
			pstmt.setString(5,  dto.getwEmail());
			pstmt.setString(6,  dto.getwCertificate_number());
			pstmt.setString(7,  dto.getwJob());
			pstmt.setInt(8,  dto.getwClinical_experience());
			pstmt.setInt(9,  dto.getwMajor_career_years());
			pstmt.setString(10,  dto.getwMajor_career_institution());
			pstmt.setString(11,  dto.getwStatus_of_employment());
			pstmt.setString(12, dto.getwCovid_19_clinical_experience());
			pstmt.setString(13, dto.getwId());
			ri = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				pstmt.close();
				connection.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return ri;
	}
	// APPLY에서 파견지원요청자 상태 관리
	public ArrayList<WorkerDTO> getMemberList_for_Manager(String iInstitution_name, int startRow, int endRow){
		ArrayList<WorkerDTO> workerDto_list = new ArrayList<WorkerDTO>();
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		
		try {
			connection = dataSource.getConnection();
//			select * from worker where wId = (select aMemberID from apply where AHOPE_INSTITUTION = ?;
			String query = "select * from"
					+ "(select rownum rn, WID, WPW, WNAME, WBIRTHDATE, WADDRESS, WPHONE_NUMBER, WEMAIL, WSEX, WCERTIFICATE_NUMBER, WJOB, WCLINICAL_EXPERIENCE, WMAJOR_CAREER_YEARS, WMAJOR_CAREER_INSTITUTION,"
					+ "WSTATUS_OF_EMPLOYMENT, WCOVID_19_CLINICAL_EXPERIENCE, WSTATUS_OF_APPLY, WDATE from (select * from worker where wId in (select aMemberId from apply where aHope_institution in ?) order by WDATE desc)) where rn between ? and ?";
//			String query = "select * from Worker where wId = (select aMemberId from (select * from apply order by aId asc where aHope_institution = ?))";
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setString(1,  iInstitution_name);
			preparedStatement.setInt(2,  startRow);
			preparedStatement.setInt(3,  endRow);
			resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {
				WorkerDTO workerDto = new WorkerDTO();
				workerDto.setwId(resultSet.getString("wId"));
				workerDto.setwPw(resultSet.getString("wPw"));
				workerDto.setwName(resultSet.getString("wName"));
				workerDto.setwBirthdate(resultSet.getDate("wBirthdate"));
				workerDto.setwPhone_number(resultSet.getString("wPhone_number"));
				workerDto.setwSex(resultSet.getString("wSex"));
				workerDto.setwCertificate_number(resultSet.getString("wCertificate_number"));
				workerDto.setwJob(resultSet.getString("wJob"));
				workerDto.setwClinical_experience(resultSet.getInt("wClinical_experience"));
				workerDto.setwMajor_career_years(resultSet.getInt("wMajor_career_years"));
				workerDto.setwMajor_career_institution(resultSet.getString("wMajor_career_institution"));
				workerDto.setwStatus_of_employment(resultSet.getString("wStatus_of_employment"));
				workerDto.setwCovid_19_clinical_experience(resultSet.getString("wCovid_19_clinical_experience"));
				workerDto.setwStatus_of_apply(resultSet.getString("wStatus_of_apply"));
				workerDto.setwEmail(resultSet.getString("wEmail"));
				workerDto.setwDate(resultSet.getTimestamp("wDate"));
				workerDto.setwAddress(resultSet.getString("waddress"));
				workerDto_list.add(workerDto);
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
		} return workerDto_list;
	}

	public int wgetCount(String iInstitution_name) {
		int count = 0;
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		try {
			connection = dataSource.getConnection();
			String query = "select count(*) from Worker where wId in (select aMemberId from apply where aHope_institution in ?)"; 
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setString(1,  iInstitution_name);
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
	// 회원이 신청을 했을 때 apply 상태가 yes가 되도록
	public void wStatus_of_apply_modify_yes(String wId) {
		int rn = 0;
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		try {
			connection = dataSource.getConnection();
			String query = "update worker set WSTATUS_OF_APPLY = 'Yes' where wId = ?"; 
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setString(1,  wId);
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
		} 
	}
	//회원정보 관리에서 전체 회원 리스트 수 검색
	public int get_MemberCount() {
		int count = 0;
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		try {
			connection = dataSource.getConnection();
			String query = "select count(*) from Worker";
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
	//회원정보 관리에서 검색어를 설정하고 모집공고 여부를 결정 후 검색했을 때 총 레코드 개수
	public int get_MemberCount_S(String sel, String find, String wStatus_of_apply) {
		int fCount = 0;
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		try {
			connection = dataSource.getConnection();
			// 검색목록과 검색어를 정하였지만 지원상태는 정하지 않았을 때
			if(!sel.equals("N") && !find.equals("N") && wStatus_of_apply.equals("N")) {
				String query = "select count(*) from worker where " + sel + " like '%" + find + "%'";
				preparedStatement = connection.prepareStatement(query);
				resultSet = preparedStatement.executeQuery();
				
				if(resultSet.next()) {
					fCount = resultSet.getInt(1);
			}
			}
			// 검색목록과 검색어는 입력하지 않고 지원상태만 골랐을 때
			else if(sel.equals("N") && find.equals("N") && !wStatus_of_apply.equals("N")) {
				String query = "select count(*) from worker where wStatus_of_apply = ?";
				preparedStatement = connection.prepareStatement(query);
				preparedStatement.setString(1, wStatus_of_apply);
				resultSet = preparedStatement.executeQuery();
				
				if(resultSet.next()) {
					fCount = resultSet.getInt(1);
				}
			}
			// 검색목록, 검색어, 지원상태 전부 골랐을 때
			 else if(!sel.equals("N") && !find.equals("N") && !wStatus_of_apply.equals("N")) {
					String query = "select count(*) from worker where " + sel + " like '%" + find + "%' And wStatus_of_apply = ?";
					preparedStatement = connection.prepareStatement(query);
					preparedStatement.setString(1, wStatus_of_apply);
					resultSet = preparedStatement.executeQuery();
					
					if(resultSet.next()) {
						fCount = resultSet.getInt(1);
					}
				}
			// 전부 고르지 않았을 때
			 else if((sel.equals("N") && find.equals("N") && wStatus_of_apply.equals("N")) || (!sel.equals("N") && find.equals("N") && wStatus_of_apply.equals("N")) ) {
					fCount = 0;
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
	} return fCount;
	}
	// 검색하지 않고 전체 회원리스트 노출
	public ArrayList<WorkerDTO> memberList(int startRow, int endRow){
		ArrayList<WorkerDTO> workerDto_list = new ArrayList<WorkerDTO>();
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		try {
			
				connection = dataSource.getConnection();
				
				String query = "select * from (select rownum rn, WID, WPW, WNAME, WBIRTHDATE, WADDRESS, WPHONE_NUMBER, WEMAIL,  WSEX, WCERTIFICATE_NUMBER, WJOB, WCLINICAL_EXPERIENCE, WMAJOR_CAREER_YEARS, WMAJOR_CAREER_INSTITUTION, WSTATUS_OF_EMPLOYMENT, WCOVID_19_CLINICAL_EXPERIENCE, WSTATUS_OF_APPLY, WDATE from (select * from Worker order by WDATE desc)) where rn between ? and ?"; 
				preparedStatement = connection.prepareStatement(query);
				preparedStatement.setInt(1, startRow);
				preparedStatement.setInt(2, endRow);
				resultSet = preparedStatement.executeQuery();
				
				while(resultSet.next()) {
					WorkerDTO workerDto = new WorkerDTO();
					workerDto.setwId(resultSet.getString("wId"));
					workerDto.setwPw(resultSet.getString("wPw"));
					workerDto.setwName(resultSet.getString("wName"));
					workerDto.setwBirthdate(resultSet.getDate("wBirthdate"));
					workerDto.setwPhone_number(resultSet.getString("wPhone_number"));
					workerDto.setwSex(resultSet.getString("wSex"));
					workerDto.setwCertificate_number(resultSet.getString("wCertificate_number"));
					workerDto.setwJob(resultSet.getString("wJob"));
					workerDto.setwClinical_experience(resultSet.getInt("wClinical_experience"));
					workerDto.setwMajor_career_years(resultSet.getInt("wMajor_career_years"));
					workerDto.setwMajor_career_institution(resultSet.getString("wMajor_career_institution"));
					workerDto.setwStatus_of_employment(resultSet.getString("wStatus_of_employment"));
					workerDto.setwCovid_19_clinical_experience(resultSet.getString("wCovid_19_clinical_experience"));
					workerDto.setwStatus_of_apply(resultSet.getString("wStatus_of_apply"));
					workerDto.setwEmail(resultSet.getString("wEmail"));
					workerDto.setwDate(resultSet.getTimestamp("wDate"));
					workerDto.setwAddress(resultSet.getString("waddress"));
					workerDto_list.add(workerDto);
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
				} return workerDto_list;
	
	} 	
	// 검색한 회원 리스트
	public ArrayList<WorkerDTO> memberList_S(int startRow, int endRow, String sel, String find, String wStatus_of_apply){
	ArrayList<WorkerDTO> workerDto_list = new ArrayList<WorkerDTO>();
	Connection connection = null;
	PreparedStatement preparedStatement = null;
	ResultSet resultSet = null;
	try {
			connection = dataSource.getConnection();
			// 검색목록과 검색어를 정하였지만 지원상태는 정하지 않았을 때
			if(!sel.equals("N") && !find.equals("N") && wStatus_of_apply.equals("N")) {
				String query = "select * from (select rownum rn, WID, WPW, WNAME, WBIRTHDATE, WADDRESS, WPHONE_NUMBER, WEMAIL,  WSEX, WCERTIFICATE_NUMBER, WJOB, WCLINICAL_EXPERIENCE, WMAJOR_CAREER_YEARS, WMAJOR_CAREER_INSTITUTION, WSTATUS_OF_EMPLOYMENT, WCOVID_19_CLINICAL_EXPERIENCE, WSTATUS_OF_APPLY, WDATE from (select * from Worker where " + sel + " like '%" + find + "%'  order by WDATE desc)) where rn between ? and ?"; 
				preparedStatement = connection.prepareStatement(query);
				preparedStatement.setInt(1, startRow);
				preparedStatement.setInt(2, endRow);
				resultSet = preparedStatement.executeQuery();
				
				while(resultSet.next()) {
					WorkerDTO workerDto = new WorkerDTO();
					workerDto.setwId(resultSet.getString("wId"));
					workerDto.setwPw(resultSet.getString("wPw"));
					workerDto.setwName(resultSet.getString("wName"));
					workerDto.setwBirthdate(resultSet.getDate("wBirthdate"));
					workerDto.setwPhone_number(resultSet.getString("wPhone_number"));
					workerDto.setwSex(resultSet.getString("wSex"));
					workerDto.setwCertificate_number(resultSet.getString("wCertificate_number"));
					workerDto.setwJob(resultSet.getString("wJob"));
					workerDto.setwClinical_experience(resultSet.getInt("wClinical_experience"));
					workerDto.setwMajor_career_years(resultSet.getInt("wMajor_career_years"));
					workerDto.setwMajor_career_institution(resultSet.getString("wMajor_career_institution"));
					workerDto.setwStatus_of_employment(resultSet.getString("wStatus_of_employment"));
					workerDto.setwCovid_19_clinical_experience(resultSet.getString("wCovid_19_clinical_experience"));
					workerDto.setwStatus_of_apply(resultSet.getString("wStatus_of_apply"));
					workerDto.setwEmail(resultSet.getString("wEmail"));
					workerDto.setwDate(resultSet.getTimestamp("wDate"));
					workerDto.setwAddress(resultSet.getString("waddress"));
					workerDto_list.add(workerDto);
				}
			} 
			// 검색목록과 검색어는 입력하지 않고 지원상태만 골랐을 때
			else if(sel.equals("N") && find.equals("N") && !wStatus_of_apply.equals("N")) {
				String query = "select * from (select rownum rn, WID, WPW, WNAME, WBIRTHDATE, WADDRESS, WPHONE_NUMBER, WEMAIL,  WSEX, WCERTIFICATE_NUMBER, WJOB, WCLINICAL_EXPERIENCE, WMAJOR_CAREER_YEARS, WMAJOR_CAREER_INSTITUTION, WSTATUS_OF_EMPLOYMENT, WCOVID_19_CLINICAL_EXPERIENCE, WSTATUS_OF_APPLY, WDATE from (select * from Worker where  wStatus_of_apply = ?  order by WDATE desc)) where rn between ? and ?"; 
				preparedStatement = connection.prepareStatement(query);
				preparedStatement.setString(1, wStatus_of_apply);
				preparedStatement.setInt(2, startRow);
				preparedStatement.setInt(3, endRow);
				resultSet = preparedStatement.executeQuery();
				while(resultSet.next()) {
					WorkerDTO workerDto = new WorkerDTO();
					workerDto.setwId(resultSet.getString("wId"));
					workerDto.setwPw(resultSet.getString("wPw"));
					workerDto.setwName(resultSet.getString("wName"));
					workerDto.setwBirthdate(resultSet.getDate("wBirthdate"));
					workerDto.setwPhone_number(resultSet.getString("wPhone_number"));
					workerDto.setwSex(resultSet.getString("wSex"));
					workerDto.setwCertificate_number(resultSet.getString("wCertificate_number"));
					workerDto.setwJob(resultSet.getString("wJob"));
					workerDto.setwClinical_experience(resultSet.getInt("wClinical_experience"));
					workerDto.setwMajor_career_years(resultSet.getInt("wMajor_career_years"));
					workerDto.setwMajor_career_institution(resultSet.getString("wMajor_career_institution"));
					workerDto.setwStatus_of_employment(resultSet.getString("wStatus_of_employment"));
					workerDto.setwCovid_19_clinical_experience(resultSet.getString("wCovid_19_clinical_experience"));
					workerDto.setwStatus_of_apply(resultSet.getString("wStatus_of_apply"));
					workerDto.setwEmail(resultSet.getString("wEmail"));
					workerDto.setwDate(resultSet.getTimestamp("wDate"));
					workerDto.setwAddress(resultSet.getString("waddress"));
					workerDto_list.add(workerDto);
			}
		} 
			//검색어와 검색목록, 지원여부를 모두 설정하였을 때
			else if(!sel.equals("N") && !find.equals("N") && !wStatus_of_apply.equals("N")) {
				String query = "select * from (select rownum rn, WID, WPW, WNAME, WBIRTHDATE, WADDRESS, WPHONE_NUMBER, WEMAIL,  WSEX, WCERTIFICATE_NUMBER, WJOB, WCLINICAL_EXPERIENCE, WMAJOR_CAREER_YEARS, WMAJOR_CAREER_INSTITUTION, WSTATUS_OF_EMPLOYMENT, WCOVID_19_CLINICAL_EXPERIENCE, WSTATUS_OF_APPLY, WDATE from (select * from Worker where " + sel + " like '%" + find + "%' And wStatus_of_apply = ?  order by WDATE desc)) where rn between ? and ?"; 
				preparedStatement = connection.prepareStatement(query);
				preparedStatement.setString(1, wStatus_of_apply);
				preparedStatement.setInt(2, startRow);
				preparedStatement.setInt(3, endRow);
				resultSet = preparedStatement.executeQuery();
				while(resultSet.next()) {
					WorkerDTO workerDto = new WorkerDTO();
					workerDto.setwId(resultSet.getString("wId"));
					workerDto.setwPw(resultSet.getString("wPw"));
					workerDto.setwName(resultSet.getString("wName"));
					workerDto.setwBirthdate(resultSet.getDate("wBirthdate"));
					workerDto.setwPhone_number(resultSet.getString("wPhone_number"));
					workerDto.setwSex(resultSet.getString("wSex"));
					workerDto.setwCertificate_number(resultSet.getString("wCertificate_number"));
					workerDto.setwJob(resultSet.getString("wJob"));
					workerDto.setwClinical_experience(resultSet.getInt("wClinical_experience"));
					workerDto.setwMajor_career_years(resultSet.getInt("wMajor_career_years"));
					workerDto.setwMajor_career_institution(resultSet.getString("wMajor_career_institution"));
					workerDto.setwStatus_of_employment(resultSet.getString("wStatus_of_employment"));
					workerDto.setwCovid_19_clinical_experience(resultSet.getString("wCovid_19_clinical_experience"));
					workerDto.setwStatus_of_apply(resultSet.getString("wStatus_of_apply"));
					workerDto.setwEmail(resultSet.getString("wEmail"));
					workerDto.setwDate(resultSet.getTimestamp("wDate"));
					workerDto.setwAddress(resultSet.getString("waddress"));
					workerDto_list.add(workerDto);
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
			} return workerDto_list;

}
}


