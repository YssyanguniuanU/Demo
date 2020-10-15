package com.yssy.dao;

import java.util.List;

import com.yssy.model.User;

public interface UserDao {
	List<User> selectAll(User user);
	void add(User user);
	void update(User user);
	void delete(int id);
}
