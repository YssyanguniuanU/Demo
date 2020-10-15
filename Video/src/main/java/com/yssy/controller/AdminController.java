package com.yssy.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yssy.model.Admin;
import com.yssy.service.AdminService;

@Controller
public class AdminController {
	@Autowired
	AdminService service;
	
	@RequestMapping("adminLogin") 
	public String adminLogin(String username,String password,HttpServletRequest req, HttpServletResponse resp) {
		Admin admin = service.selectByName(username, password);
		req.getSession().setAttribute("ADMIN",admin);
		return admin==null?"index":"HVideoManage";
	}
	
	@RequestMapping("adminExit")
	public String adminExit(HttpServletRequest req, HttpServletResponse resp) {
		req.getSession().invalidate();
		return "index";
	}
}
