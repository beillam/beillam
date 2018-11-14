package com.Beillam.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Beillam.action.Action;
import com.Beillam.action.ActionForward;
import com.Beillam.action.BoardDetailAction;
import com.Beillam.action.BoardDownloadAction;
import com.Beillam.action.BoardInsertAction;
import com.Beillam.action.BoardInsertPlayAction;
import com.Beillam.action.BoardListAction;
import com.Beillam.action.BoardSearchAction;
import com.Beillam.action.BoardUpdateAction;
import com.Beillam.action.BoardUpdatePlayAction;
import com.Beillam.action.BoardViewcntAction;
import com.Beillam.action.IdCheckAction;
import com.Beillam.action.IndexAction;
import com.Beillam.action.LoginAction;
import com.Beillam.action.LoginOutPlayAction;
import com.Beillam.action.LoginPlayAction;
import com.Beillam.action.MemberAction;
import com.Beillam.action.MemberPlayAction;
import com.Beillam.action.Member_CheckAction;
import com.Beillam.action.Member_DeleteAction;
import com.Beillam.action.PwUpdateAction;

/**
 * Servlet implementation class BizpollFrontController
 */
@WebServlet("/BizpollFrontController")
public class BizpollFrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public BizpollFrontController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// GET, POST 둘 다 받음
		// 한글깨짐 방지 : 가장 위에 적어주세요
		response.setCharacterEncoding("UTF-8");
		Action action = null; // 실제 동작하는 부분 . 인터페이스
		ActionForward forward = null; // forward, sendRedirect 설정

		// uri - ctx : 원하는 경로
		String uri = request.getRequestURI();
		String ctx = request.getContextPath();
		String command = uri.substring(ctx.length());

		System.out.println("uri: " + uri);
		System.out.println("ctx: " + ctx);
		System.out.println("페이지 이동 ===> " + command);

		// Action단 이동
		if (command.equals("/index.bizpoll")) {
			action = new IndexAction(); // 동작할 Action 클래스
			forward = action.excute(request, response);
		} else if (command.equals("/member.bizpoll")) {
			action = new MemberAction(); // 동작할 Action 클래스
			forward = action.excute(request, response);
		} else if (command.equals("/memberplay.bizpoll")) {
			action = new MemberPlayAction(); // 동작할 Action 클래스
			forward = action.excute(request, response);
		} else if (command.equals("/member_check.bizpoll")) {
			action = new Member_CheckAction(); // 동작할 Action 클래스
			forward = action.excute(request, response);
		} else if (command.equals("/login.bizpoll")) {
			action = new LoginAction(); // 동작할 Action 클래스
			forward = action.excute(request, response);
		}else if(command.equals("/LoginPlay.bizpoll")) {
			action = new LoginPlayAction(); // 동작할 Action 클래스
			forward = action.excute(request, response);
		}else if(command.equals("/member_delete.bizpoll")) {
			action = new Member_DeleteAction(); // 동작할 Action 클래스
			forward = action.excute(request, response);
		}else if(command.equals("/updatepw.bizpoll")) {
			action = new PwUpdateAction(); // 동작할 Action 클래스
			forward = action.excute(request, response);
		}else if(command.equals("/idcheck.bizpoll")) {
			action = new IdCheckAction(); // 동작할 Action 클래스
			forward = action.excute(request, response);
		}else if(command.equals("/Loginout.bizpoll")) {
			action = new LoginOutPlayAction(); // 동작할 Action 클래스
			forward = action.excute(request, response);
		}else if(command.equals("/boardList.bizpoll")) {
			action = new BoardListAction(); // 동작할 Action 클래스
			forward = action.excute(request, response);
		}else if(command.equals("/boardSearch.bizpoll")) {
			action = new BoardSearchAction(); // 동작할 Action 클래스
			forward = action.excute(request, response);
		}else if(command.equals("/boardDetail.bizpoll")) {
			action = new BoardDetailAction(); // 동작할 Action 클래스
			forward = action.excute(request, response);
		}else if(command.equals("/boardViewcnt.bizpoll")) {
			action = new BoardViewcntAction(); // 동작할 Action 클래스
			forward = action.excute(request, response);
		}else if(command.equals("/boardInsert.bizpoll")) {
			action = new BoardInsertAction(); // 동작할 Action 클래스
			forward = action.excute(request, response);
		}else if(command.equals("/boardInsertPlay.bizpoll")) {
			action = new BoardInsertPlayAction(); // 동작할 Action 클래스
			forward = action.excute(request, response);
		}else if(command.equals("/download.bizpoll")) {
			action = new BoardDownloadAction(); // 동작할 Action 클래스
			forward = action.excute(request, response);
		}else if(command.equals("/boardUpdate.bizpoll")) {
			action = new BoardUpdateAction(); // 동작할 Action 클래스
			forward = action.excute(request, response);
		}else if(command.equals("/boardUpdatePlay.bizpoll")) {
			action = new BoardUpdatePlayAction(); // 동작할 Action 클래스
			forward = action.excute(request, response);
		}
		
		
		
		// 공통 분기작업 (페이지 이동)
		if (forward != null) {
			if (forward.isRedirect()) { // true: sendRedirect 방식
				response.sendRedirect(forward.getPath());
			} else { // false: forward 방식
				RequestDispatcher rd = request.getRequestDispatcher(forward.getPath());
				rd.forward(request, response);
			}
		}
	}

}
