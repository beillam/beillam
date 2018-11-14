package com.Beillam.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.Beillam.dao.MemberDAO;
import com.Beillam.dao.ProductDAO;
import com.Beillam.dto.ProductDTO;

public class IdCheckAction implements Action{

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		System.out.println("IdCheckAction ActionForward");
		
		request.setCharacterEncoding("UTF-8");
		String userid = request.getParameter("id");
		System.out.println("id:" + userid);
		
		if(userid !=null) {
			if(!userid.trim().equals("")) {
				MemberDAO mDao = new MemberDAO();
				String msg = mDao.confirmID(userid);
				
				JSONObject jObj = new JSONObject();
				jObj.put("message",msg);
				jObj.put("id",userid);
				
				response.setContentType("application/x-json; charset=UTF-8");
				response.getWriter().print(jObj);
				
			}
		}
		return null;
		
		
	}

}