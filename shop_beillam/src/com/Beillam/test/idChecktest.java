package com.Beillam.test;

import static org.junit.Assert.*;

import org.junit.Test;

import com.Beillam.dao.MemberDAO;

public class idChecktest {
	String userid = "sentilemon02";
	@Test
	public void testConfirmID() {
		MemberDAO mDao = MemberDAO.getInstance();
		mDao.confirmID(userid);
	}

}
