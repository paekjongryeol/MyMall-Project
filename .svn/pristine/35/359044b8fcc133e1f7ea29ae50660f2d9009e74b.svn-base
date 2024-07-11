package com.mall.login.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mall.login.dao.LoginDao;
import com.mall.table.vo.UserInfoVO;

@Service
public class LoginService {

	@Autowired
	LoginDao dao;
	
	public UserInfoVO selectUserInfo(UserInfoVO vo) throws Exception{
		return dao.selectUserInfo(vo);
	}
}
