package com.Beillam.action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Beillam.dao.ProductDAO;
import com.Beillam.dto.ProductDTO;

public class IndexAction implements Action{

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String url = "index.jsp";
		
		//동작하는 부분
		//:Best 상품 출력 => best 상품을 DB에서 조회
		//Model단 이동(DAO)
		/*ProductDAO pDao = new ProductDAO();
		ArrayList<ProductDTO> bestlist = new ArrayList<>();
		bestlist = pDao.bestView();*/
		
		ProductDAO pDao = ProductDAO.getInstance();
		List<ProductDTO> bestlist = pDao.bestView();
		
		request.setAttribute("bestlist", bestlist);
		
		
		ActionForward forward = new ActionForward();
		forward.setPath(url);
		forward.setRedirect(false);
		
		return forward;
	}

}
