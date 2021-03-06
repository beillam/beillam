package com.Beillam.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.Beillam.common.DBManager;
import com.Beillam.dto.ProductDTO;
import com.Beillam.mybatis.SqlMapConfig;


public class ProductDAO {
	
	//Mybatis세팅값 호출
	
	SqlSessionFactory sqlSessionFactory = SqlMapConfig.getSqlSession();
	
	// mapper에 접근하기 위한 sqlSession
	
	SqlSession sqlSession;
	
	//싱글톤으로 new없이 사용하기 때문에 다른 곳에서 new로 객체생성 못하게 private으로 막음
	private ProductDAO() {}
	
	//싱글톤 패턴 - 객체생성 1회 실시 후 공유해서 사용
	//객체생성 1회 실시
	private static ProductDAO instance = new ProductDAO();
	
	//외부에서 getInstance()를 활용하여 1회 실시한 객체를 공유
	public static ProductDAO getInstance() {
		return instance;
	}
	
	// 실제 동작들
	// index 페이지에 베스트 상품목록 출력
	public List<ProductDTO> bestView(){
		sqlSession = sqlSessionFactory.openSession();
		List<ProductDTO>bestlist = null;	
		try {
			bestlist = sqlSession.selectList("bestView");
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		return bestlist;
	}
	
	//===================================================================
	//mybatis 사용하기 전 DBManager와 PrepareStatement 방식으로 구현한 DAO객체
	/*Connection conn = null;
	PreparedStatement pstmt =null;
	ResultSet rs = null;
	ArrayList<ProductDTO> list = new ArrayList<>();
	int result =0;
	
	public ArrayList<ProductDTO> bestView(){
		try {
			conn= DBManager.getConnection();
			String sql ="SELECT * FROM best_pro_view";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				String p_code = rs.getString("p_code");
				String p_name = rs.getString("p_name");
				int p_price = rs.getInt("p_price");
				String p_img = rs.getString("p_img");
				Date p_indate = rs.getDate("p_indate");
				ProductDTO pDto = new ProductDTO(p_code, p_name, p_price, p_img, p_indate);
				list.add(pDto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.close(conn, pstmt, rs);
		}
		return list;
	}
*/
}
