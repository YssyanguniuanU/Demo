package com.yssy.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yssy.dao.AdminDao;
import com.yssy.model.Admin;
import com.yssy.service.AdminService;

@Service
public class AdminServiceImpl implements AdminService{

	@Autowired
	AdminDao dao;
	
	public Admin selectByName(String username, String password) {
		Admin admin = new Admin(null,username,password,null);
		List<Admin> list = dao.selectAll(admin);
		return list.size()==0?null:list.get(0);
	}

	public List<Admin> selectAll() {
		Admin admin = new Admin();
		return dao.selectAll(admin);
	}

}
