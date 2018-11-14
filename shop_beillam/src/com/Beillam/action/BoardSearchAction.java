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

public class BoardSearchAction implements Action{

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String url = "board/boardList.jsp";//폴더하나가 더 있으면 폴더명/jsp이름
		System.out.println("boardsearch왔당~");
		String flag = request.getParameter("flag");
		String keyword = request.getParameter("keyword");
		System.out.println(flag + keyword);
		
		//keyword와 type으로 검색된 게시글 리스트가 출력
		CriteriaDTO criDto = new CriteriaDTO();
		int page = 1;
		if(request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		System.out.println("페이지번호"+page);
		criDto.setPage(page);
		
		BoardDAO bDao = BoardDAO.getInstance();
		//게시글 목록(정보들) 출력
		
		criDto.setKeyword(keyword);
		criDto.setFlag(flag);
		
		
		List<BoardDTO> searchList = bDao.boardSearch(criDto);
		
		request.setAttribute("boardList", searchList);
		//현재날짜 출력
		Date today = new Date();
		request.setAttribute("today", today);
		
		
		PageMakerDTO pageMaker = new PageMakerDTO();
		pageMaker.setCriDto(criDto);
		
		int totalCount = bDao.totalCount(criDto);
		pageMaker.setTotalCount(totalCount);
		request.setAttribute("pageMaker", pageMaker);
		
		System.out.println(pageMaker + toString());
		
		
		//동작하는 부분
		
		ActionForward forward = new ActionForward();
		forward.setPath(url);
		forward.setRedirect(false);
		
		return forward;
	}

}
