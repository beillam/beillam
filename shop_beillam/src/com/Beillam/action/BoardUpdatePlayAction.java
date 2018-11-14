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

public class BoardUpdatePlayAction  implements Action{

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String url = "boardList.bizpoll";
		
		System.out.println("boardUpdatetPlay왔다");
		
		File uploadDir = new File(Constants.UPLOAD_PATH);
		
		if(!uploadDir.exists()) {
			uploadDir.mkdir();
		}
		
		MultipartRequest multi = new MultipartRequest(request, Constants.UPLOAD_PATH,
																Constants.MAX_UPLOAD,
																"UTF-8", new DefaultFileRenamePolicy());
		String bno = multi.getParameter("bno");
		String title = multi.getParameter("title");
		String content = multi.getParameter("content");
		String writer = multi.getParameter("writer");
		String filename = " ";
		String postfile = multi.getParameter("post-file-name");
		int filesize = 0;
		
		
		//수정 = 1. 기존에 첨부파일 무조건 삭제하고 그 다음부터 시작
		
		int bno1 = Integer.parseInt(bno);
		
		System.out.println(bno1 +","+ title +"," +content +","+ writer + ","+ postfile);
		
		File file = new File(Constants.UPLOAD_PATH+postfile);
		file.delete();
		
		
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
		BoardDTO bDto = new BoardDTO(bno1, title, content, writer, filename, filesize);
		
		int result = bDao.boardUpdate(bDto);
		if(result > 0) {
			//등록성공
			System.out.println("수정성공");
			
		}else {//등록실패
			System.out.println("수정실패");
		}
		
	
		//동작하는 부분
		
		ActionForward forward = new ActionForward();
		forward.setPath(url);
		forward.setRedirect(true);
		
		return forward;
	}

}

