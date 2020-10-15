package com.yssy.service;

import java.util.List;

import com.yssy.model.User;

public interface UserService {
	void add(User user);
	void delete(int id);
	void update(User user);
	User selectByName(String email,String password);
	User selectById(int id); 
	User selectUser(User user);
	
	Boolean isEmail(String email);
}
