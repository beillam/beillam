package com.Beillam.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Beillam.dao.MemberDAO;
import com.Beillam.dto.MemberDTO;

public class MemberPlayAction implements Action{

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		System.out.println("MemberPlayAction");
		String url = "index.bizpoll";
		
		String id = request.getParameter("userid");
		String pw = request.getParameter("userpw");
		String name = request.getParameter("username");
		String phone = request.getParameter("userphone");
		String zipcode = request.getParameter("sample6_postcode");
		String addr1 = request.getParameter("sample6_address");
		String addr2 = request.getParameter("sample6_address2");
		String emailid = request.getParameter("email_id");
		String emailurl = request.getParameter("email_url");
		String email = emailid + "@" + emailurl;
	
		MemberDTO mDto = new MemberDTO(id, pw, name, phone, zipcode, addr1, addr2, email);
		System.out.println(mDto.toString());
		
		//mybatis
		MemberDAO mDao = MemberDAO.getInstance();
		int result = mDao.inputMember(mDto);
		
		response.setContentType("text/html; charset=UTF-8");
		
		if(result > 0) {
			System.out.println("성공");
		}else {
			System.out.println("실패");
		}
		
		//동작하는 부분
		
		ActionForward forward = new ActionForward();
		forward.setPath(url);
		forward.setRedirect(true);
		
		return forward;
	}

}
