package com.Beillam.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

import com.Beillam.dao.MemberDAO;

public class Member_DeleteAction implements Action{

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		
		String userid = request.getParameter("id");
		String userpw = request.getParameter("pw");
		System.out.println(userid+",");
		
		MemberDAO mDao = MemberDAO.getInstance();//mybatis하면 될거임
		String message = mDao.confirmPW(userid, userpw);//비밀번호 수정거 쓰는 거라서 비밀번호 수정하고 나면 될거임
		
		if(message.equals("-1")) {//올바른 비밀번호 입력
			//회원삭제 동작 메서드
			
			int flag = mDao.deleteMember(userid);
			
			if(flag>0) {
				//session을 초기화
				System.out.println("회원삭제");
				if(session !=null) {
					session.invalidate();
				}
			}else {
				System.out.println("삭제실패");
			}
			JSONObject jObj = new JSONObject();
			jObj.put("message",message);
			response.setContentType("application/x-json; charset=URF=8");
			response.getWriter().print(jObj);
			
		}
		return null;
	}

}
