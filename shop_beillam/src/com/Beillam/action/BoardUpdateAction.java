package com.Beillam.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Beillam.dao.BoardDAO;
import com.Beillam.dto.BoardDTO;

public class BoardUpdateAction implements Action{

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String url = "board/board_update.jsp";
		System.out.println("board업데이트 액션왔당.");
		
		String bno = request.getParameter("bno");
		System.out.println("bno:" + bno);
		
		BoardDAO bDao = BoardDAO.getInstance();
		BoardDTO bDto = bDao.boardDetailView(bno);
		
		System.out.println(bDto.toString());
		
		request.setAttribute("boardView", bDto);
		
		ActionForward forward = new ActionForward();
		forward.setPath(url);
		forward.setRedirect(false);
		
		return forward;
	}

}
