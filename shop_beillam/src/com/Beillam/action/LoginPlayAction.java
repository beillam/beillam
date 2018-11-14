package com.Beillam.action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Beillam.dao.MemberDAO;
import com.Beillam.dto.MemberDTO;

public class LoginPlayAction implements Action{

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String url = "";
		HttpSession session = request.getSession();
		
		String id = request.getParameter("inputid");
		String pw = request.getParameter("inputpw");
		System.out.println(id+","+pw);
		
		//DAO클래스에 LoginCheck()메서드를 활용하여 id와 pw값으로 Select절에 Where조건으로 검색 후
		//결과값(ArrayList)을 가지고 현재 지금 이곳 Action단으로 돌아오는 코드를 작성
		MemberDAO mDao = new MemberDAO();
		MemberDTO mDto = mDao.LoginCheck(id, pw);
		System.out.println(mDto);
		
		if(mDto != null) {
			//로그인성공
			//session값에 login된 회원 정보를 담아야함
			session.removeAttribute("id"); //혹시 모를 기존에 남아있는 값을 제거
			session.setAttribute("loginUser", mDto);
			url = "";
			
		}else {
			//로그인실패
			
		}
		//동작하는 부분
		
		ActionForward forward = new ActionForward();
		forward.setPath(url);
		forward.setRedirect(false);
		
		return forward;
	}

}
