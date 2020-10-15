package com.yssy.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yssy.dao.UserDao;
import com.yssy.model.User;
import com.yssy.service.UserService;

@Service
public class UserServiceImpl implements UserService{

	@Autowired
	UserDao dao;
	
	public void add(User user) {
		dao.add(user);
	}

	public void delete(int id) {
		dao.delete(id);
	}

	public void update(User user) {
		dao.update(user);
	}

	public User selectByName(String email, String password) {
		User user = new User();
		user.setEmail(email);
		user.setPassword(password);
		List<User> list = dao.selectAll(user);
		return list.size()==0?null:list.get(0);
	}

	public User selectById(int id) {
		User user = new User();
		user.setUserId(id);
		List<User> list = dao.selectAll(user);
		return list.size()==0?null:list.get(0);
	}

	public User selectUser(User user) {
		List<User> list = dao.selectAll(user);
		return list.size()==0?null:list.get(0);
	}

	public Boolean isEmail(String email) {
		User user = new User();
		user.setEmail(email);
		User user2 = selectUser(user);
		if (user2 == null) {
			return false;
		}
		return true;
	}

}
