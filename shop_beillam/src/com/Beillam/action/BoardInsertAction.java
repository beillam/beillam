package com.Beillam.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Beillam.dao.BoardDAO;
import com.Beillam.dto.BoardDTO;

public class BoardInsertAction implements Action{

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String url = "board/boardinsert.jsp";
		System.out.println("boardinsert액션왔당.");
		
		
		
		
		BoardDAO bDao = BoardDAO.getInstance();
		
		//동작하는 부분
		
		ActionForward forward = new ActionForward();
		forward.setPath(url);
		forward.setRedirect(false);
		
		return forward;
	}

}
