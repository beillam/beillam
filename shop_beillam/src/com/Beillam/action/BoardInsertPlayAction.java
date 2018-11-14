package com.Beillam.action;

import java.io.File;
import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Beillam.common.Constants;
import com.Beillam.dao.BoardDAO;
import com.Beillam.dto.BoardDTO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import oracle.net.aso.e;

public class BoardInsertPlayAction implements Action{

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String url = "boardList.bizpoll";
		
		System.out.println("boardInsertPlay왔다");
		
		File uploadDir = new File(Constants.UPLOAD_PATH);
		
		if(!uploadDir.exists()) {
			uploadDir.mkdir();
		}
		
		MultipartRequest multi = new MultipartRequest(request, Constants.UPLOAD_PATH,
																Constants.MAX_UPLOAD,
																"UTF-8", new DefaultFileRenamePolicy());
		
		String title = multi.getParameter("title");
		String content = multi.getParameter("content");
		String writer = multi.getParameter("writer");
		String filename = " ";
		int filesize = 0;
		
		System.out.println(title +"," +content +","+ writer+","+filename);
		
		try {
			Enumeration files = multi.getFileNames();
			
				while(files.hasMoreElements()) {
					String file1 = (String)files.nextElement();
					filename = multi.getFilesystemName(file1);
					File f1 = multi.getFile(file1);
					
					if(f1 != null) {
						filesize = (int)f1.length();
					}
				
				}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		if(filename == null || filename.trim().equals("")) {
			filename="";
			
		}
		
		BoardDAO bDao = BoardDAO.getInstance();
		BoardDTO bDto = new BoardDTO(title, content, writer, filename, filesize);
	
		
		int result = bDao.boardInsert(bDto);
		
		if(result > 0) {
			//등록성공
			System.out.println("등록성공");
			
		}else {//등록실패
			System.out.println("등록실패");
		}
		
		
		//동작하는 부분
		
		ActionForward forward = new ActionForward();
		forward.setPath(url);
		forward.setRedirect(true);
		
		return forward;
	}

}

