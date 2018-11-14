package com.Beillam.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;

import javax.websocket.Session;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.Beillam.common.DBManager;
import com.Beillam.dto.MemberDTO;
import com.Beillam.mybatis.SqlMapConfig;


public class MemberDAO {
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	ArrayList<MemberDTO>list = new ArrayList<>();
	
	
	SqlSessionFactory sqlSessionFactory = SqlMapConfig.getSqlSession();
	SqlSession sqlSession;
	private static MemberDAO instance = new MemberDAO();
	
	public static MemberDAO getInstance() {
		return instance;
	}
	
	
	
	public int inputMember(MemberDTO mDto) {
		int result = 0;
		try {
			conn = DBManager.getConnection();
			String sql = "INSERT INTO beillam_member(id, pw, name, phone, zipcode, addr1, addr2, email) "
					+ "VALUES(?,?,?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, mDto.getId());
			pstmt.setString(2, mDto.getPw());
			pstmt.setString(3, mDto.getName());
			pstmt.setString(4, mDto.getPhone());
			pstmt.setString(5, mDto.getZipcode());
			pstmt.setString(6, mDto.getAddr1());
			pstmt.setString(7, mDto.getAddr2());
			pstmt.setString(8, mDto.getEmail());
			
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.close(conn, pstmt);
		}
		return result;
	}
	
	public MemberDTO LoginCheck(String uid, String upw){
		sqlSession = sqlSessionFactory.openSession();
		MemberDTO mDto = new MemberDTO();
		mDto.setId(uid);
		mDto.setPw(upw);
		try {
			mDto = sqlSession.selectOne("LoginCheck",mDto);
			sqlSession.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		return mDto;
	}
	
/*		public int updatePW(String userId, String userPw) {
		try {
			conn=DBManager.getConnection();
			String sql = "UPDATE beillam_member SET pw=? WHERE id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			pstmt.setString(2, userPw);
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt);
		}
		return 0;
	}	*/
	
	

	public String confirmPW(String userid, String userpw) {
		String result="";
		sqlSession = sqlSessionFactory.openSession();
		MemberDTO mDto = new MemberDTO();
		mDto.setId(userid);
		mDto.setPw(userpw);
		try {
			result = sqlSession.selectOne("confirmPW",mDto);
			
			if(result !=null) {
				result = "-1";
			}else {
				result ="1";
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		
		return result;
	}
	
	public int deleteMember(String userid) {
		int flag = 0;
		
		sqlSession = sqlSessionFactory.openSession();
		try {
			flag = sqlSession.delete("deleteMember",userid);
			sqlSession.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		
		return flag;
	}
	
	public String confirmID(String userid) {
		String msg="";
		try {
			conn=DBManager.getConnection();
			String sql = "SELECT id FROM member_beillam WHERE id=" + userid;
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				msg="-1";
			}else {
				msg="1";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.close(conn, pstmt, rs);
		}
		return msg;
	} 

}
