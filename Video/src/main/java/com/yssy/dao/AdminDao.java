package com.yssy.dao;

import java.util.List;

import com.yssy.model.Admin;

public interface AdminDao {
	List<Admin> selectAll(Admin admin);
	List<Admin> selectLikeAll(Admin admin);
}
