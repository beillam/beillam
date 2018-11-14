package com.Beillam.common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

//공통으로 사용하기 때문에 common으로 package 생성
//싱글톤 패턴을 활용한 공유 방법
//프레임 워크 : 개발자가 개발하기 쉽게 도와주는 도구
//스프링 프레임워크, 제이쿼리 프레임워크
//싱글톤 패턴도 디자인 패턴 중 하나로 static과 생성자를 이용
public class DBManager {// 중복된 부분을 여기에

	// static = 자원공유의 목적, 객체생성을 하지 않고도 사용가능
	// 생성자 = 객체 생성할 때 필요
	// 싱글톤 패턴= 객체생성을 단 한번만 실행하고 다른 클래스에서 사용할 때는 한번 생성된 객체를
	// 빌려다가 공유의 목적으로 사용하게 만드는 방법
	private static Connection conn;
//인스턴스의 주소를 저장하기 위한 참조변수
	
//Connection 관련 정보 상수	
	private final static String DRIVER = "oracle.jdbc.driver.OracleDriver";
	private final static String URL = "jdbc:oracle:thin:@127.0.0.1:1521:XE";
	private final static String USER = "java";
	private final static String PASS = "1234";

	// 생성자를 private로 만들어 은닉화(숨김) 시킨다.
	// >외부에서 인스턴스를 생성하지 못하도록 선언
	// > 이유 : 공유해서 사용하려고 하는데 다른 개발자가 객체생성해서 사용하면 의미가 없음
	// (사용자의 실수를 막는 용도)
	private DBManager() {

	}
//인스턴스를 생성 또는 기존의 인스턴스를 반환하는 
	public static Connection getConnection() {
		conn = null;

		if (conn == null) {
			try {
				Class.forName(DRIVER);
				conn = DriverManager.getConnection(URL, USER, PASS);

			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return conn;
	}

	// SELECT 수행 후 자원 해제을 위한 메서드

	public static void close(Connection conn, PreparedStatement pstmt, ResultSet rs) {
		try {

			if (rs != null) {
				try {
					rs.close();
				} catch (Exception e) {
					e.getStackTrace();
				}
			}

			if (pstmt != null) {
				try {
					rs.close();
				} catch (Exception e) {
					e.getStackTrace();
				}
			}

			if (conn != null) {
				try {
					rs.close();
				} catch (Exception e) {
					e.getStackTrace();
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//insert, delete, update 수행후 자원해제를 위한 메서드
	//메서드 오버로딩 메서드 명이 같아도 안의 매게변수가 다르면 사용 가능
	public static void close(Connection conn, PreparedStatement pstmt) {
		try {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (Exception e) {
					e.getStackTrace();
				}
			}

			if (conn != null) {
				try {
					pstmt.close();
				} catch (Exception e) {
					e.getStackTrace();
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
