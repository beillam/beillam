package com.Beillam.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Beillam.dao.BoardDAO;
import com.Beillam.dto.BoardDTO;

import sun.security.jca.GetInstance;

public class BoardViewcntAction implements Action{

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		
		System.out.println("조회수증가왔당");
		String bno = request.getParameter("bno");
		System.out.println("====>"+bno+"!");
		String url = "boardDetail.bizpoll?bno=" + bno;
		
		BoardDAO bDao = BoardDAO.getInstance();
		//조회수1증가
		//session을 활용한 조회수 증가 바잊
		
		HttpSession session = request.getSession();
		
		bDao.viewCnt(bno, session);
		
		ActionForward forward = new ActionForward();
		forward.setPath(url);
		forward.setRedirect(false);
		
		return forward;
	}

}
