package com.yssy.service;

import java.util.List;

import com.yssy.model.Admin;

public interface AdminService {
	Admin selectByName(String username, String password);
	List<Admin> selectAll();
}
