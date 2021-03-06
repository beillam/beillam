package com.Beillam.action;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Beillam.dao.BoardDAO;
import com.Beillam.dto.BoardDTO;
import com.Beillam.dto.CriteriaDTO;
import com.Beillam.dto.PageMakerDTO;


public class BoardListAction implements Action{

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String url = "board/boardList.jsp";//폴더하나가 더 있으면 폴더명/jsp이름
		System.out.println("boardlistAction왔다");
		
		CriteriaDTO criDto = new CriteriaDTO();
		int page = 1;
		if(request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		System.out.println("페이지번호"+page);
		criDto.setPage(page);
		
		String flag = null;
		String keyword = null;
		
		if(request.getParameter("keyword") != null) {
			
			System.out.println("====게시글 검색기능 작동");
			flag=request.getParameter("flag");
			keyword = request.getParameter("keyword");
			
			System.out.println(page + "," + flag + "," + keyword);
			
			criDto.setKeyword(keyword);
			criDto.setFlag(flag);
			
			request.setAttribute("flag" , flag);
			request.setAttribute("keyword", keyword);
		}
		
		
		
		
		BoardDAO bDao = BoardDAO.getInstance();
		//게시글 목록(정보들) 출력
		List<BoardDTO> boardList = bDao.boardListAll(criDto);
		
		request.setAttribute("boardList", boardList);
		
		
		
		//현재날짜 출력
		Date today = new Date();
		request.setAttribute("today", today);
		
		
		
		
		PageMakerDTO pageMaker = new PageMakerDTO();
		pageMaker.setCriDto(criDto);
		
		int totalCount = bDao.totalCount(criDto);
		pageMaker.setTotalCount(totalCount);
		request.setAttribute("pageMaker", pageMaker);
		
		System.out.println(pageMaker + toString());
		
		
		ActionForward forward = new ActionForward();
		forward.setPath(url);
		forward.setRedirect(false);
		
		return forward;
	}

}
